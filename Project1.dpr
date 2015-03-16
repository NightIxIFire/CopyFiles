program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {CopyFiles},
  Unit2 in 'Unit2.pas' {Copy};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'CopyFiles';
  Application.CreateForm(TCopyFiles, CopyFiles);
  Application.CreateForm(TCopy, Copy);
  Application.Run;
end.
