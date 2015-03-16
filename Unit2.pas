unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvProgressBar, JvDBProgressBar, StdCtrls,
  ExtCtrls, IBQuery, IBDatabase, DB, IBCustomDataSet, IBTable, Grids,
  DBGrids;

type
  TCopy = class(TForm)
    ProgressBar2: TJvDBProgressBar;
    ProgressBar1: TJvProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    Button1: TButton;
    IBDatabase1: TIBDatabase;
    IBTable1: TIBTable;
    DS1: TDataSource;
    IBTransaction1: TIBTransaction;
    IBQ1: TIBQuery;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCopyThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

var
  Copy: TCopy;
  bCancelCopy: BOOL;
  TimeCopy:integer;
  CopyThread: TCopyThread;

implementation

uses Unit1;

{$R *.dfm}

function CopyProgressFuncCount( CurentFileCount: Integer;
                                TotalFileCount: Integer ):DWORD; stdcall;
                                Begin
                                Copy.ProgressBar1.Position := 100 * CurentFileCount div TotalFileCount;
                                Application.ProcessMessages;
                                CopyProgressFuncCount := PROGRESS_CONTINUE;
                                end;

function CopyProgressFuncSize( TotalFileSize: Int64;
                               TotalBytesTransferred: Int64;
                               StreamSize: Int64;
                               StreamBytesTransferred: Int64;
                               dwStreamNumber: DWORD;
                               dwCallbackReason: DWORD;
                               hSourseFile: THandle;
                               hDestinationFile: THandle;
                               lpData: Pointer): DWORD; stdcall;
                               begin
                                 Copy.Label6.Caption:= inttostr(TotalFileSize)+' байт';
                                 Copy.ProgressBar2.Position := 100 * TotalBytesTransferred div TotalFileSize;
                                 Application.ProcessMessages;
                                 CopyProgressFuncSize := PROGRESS_CONTINUE;
                               end;

procedure TCopyThread.Execute;
var i,lastsec:integer;
begin

  bCancelCopy := False;

  Copy.IBQ1.Close;
  Copy.IBQ1.SQL.Clear;
  Copy.IBQ1.SQL.Text:='Delete from files';
  Copy.IBQ1.ExecSQL;
  Copy.IBTransaction1.Commit;

for i:=0 to CopyFiles.OpenDialog.Files.Count-1 do
Begin
  lastsec:=strtoint(Copy.Label4.Caption);
  CopyProgressFuncCount(i+1,CopyFiles.OpenDialog.Files.Count);
  Copy.Label5.Caption:=extractfilename(CopyFiles.OpenDialog.Files[i]);
  if CopyFileEx(PAnsiChar(CopyFiles.OpenDialog.Files[i]), PAnsiChar(CopyFiles.SelectDirectory.Directory+'\'+extractfilename(CopyFiles.OpenDialog.Files[i])), Addr(CopyProgressFuncSize),
                nil, Addr(bCancelCopy), COPY_FILE_FAIL_IF_EXISTS) = False
  then
    MessageBox(Handle, 'Не получилось!', 'Копирование', MB_ICONEXCLAMATION);

    Copy.IBQ1.Close;
    Copy.IBQ1.SQL.Clear;
    Copy.IBQ1.SQL.Add('Insert into files (name, sizefile, timecopy) values ('''+Copy.Label5.Caption+''','''+Copy.Label6.Caption+''','''+inttostr(strtoint(Copy.Label4.Caption)-lastsec)+''')');
    Copy.IBQ1.ExecSQL;
    Copy.IBTable1.Active:=False;
    Copy.IBTable1.Active:=True;

  if CopyThread.Terminated then
    Begin
      Copy.Timer1.Enabled:=False;
      break;
    end;
end;
Copy.Timer1.Enabled:=False;
MessageBox(Handle, 'Все операции завершены!', 'Копирование', MB_ICONASTERISK);
end;

procedure TCopy.FormActivate(Sender: TObject);
begin
Timer1.Enabled:=True;
TimeCopy:=0;
CopyThread:=TCopyThread.Create(False);
end;

procedure TCopy.Timer1Timer(Sender: TObject);
begin
TimeCopy:=TimeCopy+1;
Label4.Caption:=inttostr(TimeCopy div 100);
end;

procedure TCopy.Button1Click(Sender: TObject);
begin
CopyThread.Terminate;
end;

end.
