using System;
using System.Collections.Generic;
using System.IO.Enumeration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Updater;


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
