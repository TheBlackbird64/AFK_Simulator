using System;
using System.Collections.Generic;
using System.IO.Enumeration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Updater;

/// <summary>
/// Ce projet contiendra le launcher complet avec une interface graphique. 
/// Pour l'instant il ne sert pas car le bootstrapper (le progr&amme cencé mettre à jour le launcher) démarre directement le jeu.
/// </summary>

namespace Launcher
{
    public class MainProgram
    {
        public static async Task Main ()
        {
            const string updateFile = "update.json";


            Updater.Updater launcher = Updater.Updater.UpdaterFromFile(updateFile);

            await launcher.Run();
        }
    }
}
