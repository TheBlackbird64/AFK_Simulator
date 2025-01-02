using System;
using System.Collections.Generic;
using System.IO.Enumeration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Updater
{
    public class MainProgram
    {
        public static async Task Main ()
        {
            const string updateFile = "updateLauncher.json";


            Updater bootstrapper = Updater.UpdaterFromFile(updateFile);

            await bootstrapper.Run();
        }
    }
}
