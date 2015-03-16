unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvBaseDlg, JvSelectDirectory, JvDialogs;

type
  TCopyFiles = class(TForm)
    OpenDialog: TJvOpenDialog;
    SelectDirectory: TJvSelectDirectory;
    OpenButton: TButton;
    SaveToButton: TButton;
    CopyFilesButton: TButton;
    procedure OpenButtonClick(Sender: TObject);
    procedure SaveToButtonClick(Sender: TObject);
    procedure CopyFilesButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CopyFiles: TCopyFiles;

implementation


uses Unit2;

{$R *.dfm}



procedure TCopyFiles.OpenButtonClick(Sender: TObject);
begin
try
OpenDialog.Execute;
finally

end;



end;

procedure TCopyFiles.SaveToButtonClick(Sender: TObject);
begin
SelectDirectory.Execute;
end;

procedure TCopyFiles.CopyFilesButtonClick(Sender: TObject);
begin
Copy.ShowModal;
end;

end.
