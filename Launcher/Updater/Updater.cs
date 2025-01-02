using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.IO.Compression;
using System.Reflection.Metadata;



namespace Updater
{
    public class OSFileName
    {
        public string fileToDownload { get; set; } = "";
        public string filenameExec { get; set; } = "";
    }


    public class Updater
    {
        /*
         * Fonctionnement: 
         *  1/ un Updater récupère le numéro de version du logiciel à télécharger et le compare avec le dernier enregistré
         *  2/ Si le numéro n'est pas le même il télécharge le fichier et le dézippe
         *  3/ Lance le fichier téléchargé ou celui déja présent
         *   
         * */

        private string FileLogName;
        private string FileTempName;
        private readonly static JsonSerializerOptions JSONoptions = new JsonSerializerOptions { WriteIndented = true };
        private WebClient client = new WebClient();

        public string fileName { get; set; } = "";
        public string version { get; set; } = "0.0.0";
        public OSFileName windows { get; set; } = new();
        public OSFileName linux { get; set; } = new();
        public OSFileName macOS { get; set; } = new();
        public string fileVersionTxt { get; set; } = "";
        public string zipFile { get; set; } = "";
        public string URLServer { get; set; } = "";



        public static Updater UpdaterFromFile(string fileName)
        {
            string json;
            if (!File.Exists(fileName))
            {
                json = JsonSerializer.Serialize(new Updater(fileName), JSONoptions);
                File.WriteAllText(fileName, json);
            }

            json = File.ReadAllText(fileName);
            Updater? up = JsonSerializer.Deserialize<Updater>(json);

            return up ?? new Updater(fileName);
        }

        public static string GetOS()
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                return "Windows";
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
            {
                return "Linux";
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
            {
                return "macOS";
            }
            else
            {
                return "Inconnu";
            }
        }



        public Updater(string fileName)
        {
            FileLogName = fileName.Substring(0, fileName.Length-5) + "Log.txt";
            FileTempName = fileName.Substring(0, fileName.Length-5) + "TempVersion.txt";
            this.fileName = fileName;
        }


        public async Task Run()
        {
            if (UpdateNeeded())
            {
                DownloadFile();
            }


            try
            {
                if (zipFile.Length > 3)
                {
                    string path = zipFile.Substring(0, zipFile.Length - 4);
                    Process? process;
                    ProcessStartInfo startInfo;

                    // Tuer les instances qui existent déjà
                    foreach (var proc in Process.GetProcessesByName(windows.filenameExec))
                    {
                        proc.Kill();
                    }

                    await Task.Delay(500);

                    Log("\nDémarrage du jeu. Intance existante: " + Process.GetProcessesByName(windows.filenameExec).Any().ToString());

                    // Démarrer le bon programme selon l'OS
                    if (GetOS() == "Linux")
                    {
                        startInfo = new ProcessStartInfo
                        {
                            FileName = linux.filenameExec,
                            WorkingDirectory = path,
                            UseShellExecute = true
                        };
                    }
                    if (GetOS() == "MacOS")
                    {
                        startInfo = new ProcessStartInfo
                        {
                            FileName = macOS.filenameExec,
                            WorkingDirectory = path,
                            UseShellExecute = true
                        };
                    }
                    else // Windows par défaut
                    {
                        startInfo = new ProcessStartInfo
                        {
                            FileName = windows.filenameExec,
                            WorkingDirectory = path,
                            UseShellExecute = true
                        };
                    }

                    process = Process.Start(startInfo);
                    await Task.Delay(1000);

                    if (process != null)
                    {
                        if (process.MainWindowHandle == IntPtr.Zero)
                        {
                            SetForegroundWindow(process.MainWindowHandle);
                        }

                        Log("Jeu affiché: " + Process.GetProcessesByName(windows.filenameExec).Any().ToString());

                        if (process.HasExited)
                        {
                            Log("---Jeu crash---");
                        }
                    }
                }
                else
                {
                    Log("Nom du fichier zip non spécifié.");
                }
            }
            catch (Exception e)
            {
                Log(e.Message, true);

            }

        }
        [System.Runtime.InteropServices.DllImport("user32.dll")]
        private static extern bool SetForegroundWindow(IntPtr hWnd);

        public bool UpdateNeeded()
        {

            try
            {
                client.DownloadFile(URLServer + "/" + fileVersionTxt, FileTempName);
            }
            catch (Exception e)
            {
                Log(e.Message);
                return false;
            }

            string currentVersion = File.ReadLines(FileTempName).First();

            return currentVersion != version;
        }

        public void DownloadFile()
        {

            // Supprimer le zip
            if (File.Exists(zipFile))
            {
                File.Delete(zipFile);
            }


            try
            {
                if (GetOS() == "Linux")
                {
                    client.DownloadFile(URLServer + "/" + linux.fileToDownload, zipFile);
                }
                if (GetOS() == "MacOS")
                {
                    client.DownloadFile(URLServer + "/" + macOS.fileToDownload, zipFile);

                }
                else // Windows par défaut
                {
                    client.DownloadFile(URLServer + "/" + windows.fileToDownload, zipFile);
                }

                if (zipFile.Length > 3)
                {
                    string nameD = zipFile.Substring(0, zipFile.Length - 4);
                    if (Directory.Exists(nameD))
                    {
                        Directory.Delete(nameD, true);
                    }

                    ZipFile.ExtractToDirectory(zipFile, nameD, true);
                }
                else
                {
                    Log("Nom du fichier zip non spécifié.");
                }

                // Mettre à jour le numéro de version local
                version = File.ReadLines(FileTempName).First();
                string json = JsonSerializer.Serialize(this, JSONoptions);
                File.WriteAllText(fileName, json);
            }
            catch (Exception e)
            {
                Log(e.Message);

            }
        }

        public void Log(string msg, bool abort = false)
        {
            File.AppendAllText(FileLogName, msg + $" {DateTime.Now}\n");
            if (abort)
            {
                Environment.Exit(0);
            }
        }
    }
}
