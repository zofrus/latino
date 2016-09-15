; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Latino"
#define MyAppVersion "0.7.0"
#define MyAppPublisher "Lenguaje Latino"
#define MyAppURL "http://lenguaje-latino.org/"
#define MyAppExeName "latino.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{887BAB8B-D5EC-4D62-8224-DC99F3629CB4}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=C:\src\latino\LICENCIA.txt
OutputDir=C:\src\latino\InnoSetup
OutputBaseFilename=setup
SetupIconFile=C:\src\latino\InnoSetup\latino.ico
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes

[CustomMessages]
AppAddPath=Agregar aplicacion a la variable de entorno PATH (requerido)

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\src\latino\visualstudio\bin\Release\latino.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\src\latino\ejemplos\*"; DestDir: "{app}\ejemplos\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\src\latino\InnoSetup\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\src\latino\InnoSetup\*.ico"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\latino.ico"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\latino.ico"; Tasks: desktopicon


[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}"

[Tasks]
Name: modifypath; Description:{cm:AppAddPath}; 

[Code]

const
    ModPathName = 'modifypath';
    ModPathType = 'system';

function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 1)
    Result[0] := ExpandConstant('{app}');
end;

#include "modpath.iss"