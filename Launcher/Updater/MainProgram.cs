using System;
using System.Collections.Generic;
using System.IO.Enumeration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Updater
{
    /// <summary>
    /// Cette classe est en fait un bootstrapper qui permettra plus tard de mettre à jour le launcher pour en avoir un avec une interface graphique et différentes fonctionnalités.
    /// </summary>


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
