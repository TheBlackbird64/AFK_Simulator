
dotnet publish -c Release -r win-x64 /p:AssemblyName="AFK Simulator Launcher" --self-contained
dotnet publish -c Release -r linux-x64 /p:AssemblyName="AFK Simulator Launcher" --self-contained
dotnet publish -c Release -r osx-x64 /p:AssemblyName="AFK Simulator Launcher" --self-contained