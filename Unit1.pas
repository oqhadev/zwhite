unit Unit1  ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, ShellAPI, sSkinManager, ComCtrls,
  sPageControl, sGroupBox, sStatusBar,ras, ExtCtrls, sCheckBox, sEdit,
  sComboBox, sLabel, sButton,winsock, Buttons, sSpeedButton, sMemo,
  GIFImage, acPNG, Menus, sPanel,Tlhelp32, sListBox, sRadioButton,
  IdBaseComponent, IdComponent, IdTCPServer, IdMappedPortTCP, sDialogs;
 Const
WM_CAllBack = WM_USER;

type
  TForm1 = class(TForm)
    lblportssh: TLabel;
    btnload: TButton;
    btnSave: TButton;
    btnLogin: TButton;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    sSkinManager1: TsSkinManager;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
    btnDial: TsButton;
    lblStatus: TsLabel;
    lblIP1: TsLabel;
    edtIPHunter: TsEdit;
    chkIPHunter: TsCheckBox;
    Timer2: TTimer;
    tmr1: TTimer;
    btnSetParams: TsButton;
    sLabel1: TsLabel;
    btnGetEntries: TsButton;
    btnGetParams: TsButton;
    lstentries: TsComboBox;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    sMemo1: TsMemo;
    sButton1: TsButton;
    sButton3: TsButton;
    sComboBox1: TsComboBox;
    sLabel2: TsLabel;
    sLabel4: TsLabel;
    Timer1: TTimer;
    sEdit1: TsEdit;
    sLabel3: TsLabel;
    edtuser: TsEdit;
    edtpass: TsEdit;
    edtserver: TsEdit;
    edtportssh: TsEdit;
    User: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    edtproxyIP: TsEdit;
    edtproxyPort: TsEdit;
    sTabSheet4: TsTabSheet;
    Image2: TImage;
    Image3: TImage;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    Label1: TLabel;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    chkproxy: TsCheckBox;
    Show1: TMenuItem;
    sSpeedButton5: TsSpeedButton;
    sTabSheet5: TsTabSheet;
    cbbtypeproxy: TsComboBox;
    cbbMULTI: TsComboBox;
    Respon: TsLabel;
    sButton2: TsButton;
    sButton4: TsButton;
    sButton5: TsButton;
    listen: TsEdit;
    sLabel13: TsLabel;
    sListBox1: TsListBox;
    sPanel3: TsPanel;
    Shape1: TShape;
    Shape2: TShape;
    sPanel4: TsPanel;
    pfportable: TsCheckBox;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    sLabel17: TsLabel;
    IdMappedPortTCP1: TIdMappedPortTCP;
    sOpenDialog1: TsOpenDialog;
    sLabel12: TsLabel;
    DownText: TsLabel;
    Timer3: TTimer;
    uploadText: TsLabel;
    sLabel18: TsLabel;
    TDText: TsLabel;
    TUText: TsLabel;
    Timer4: TTimer;

    procedure btnSaveClick(Sender: TObject);
    procedure btnloadClick(Sender: TObject);
    procedure chkproxyClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure simpandata;
    procedure cekdata;
    procedure IPHunter;
    procedure getprofileinjek;
    Procedure LedBlinkOnline;
Procedure LedBlinkOfline;

    procedure btnDialClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btnSetParamsClick(Sender: TObject);
    procedure btnGetEntriesClick(Sender: TObject);
    procedure btnGetParamsClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sEdit1Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure WM_CALLBACKPRO(var msg : TMessage); message wm_callBack;
    procedure Button1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure ngumpet;
    procedure Show1Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure pfportableClick(Sender: TObject);
    procedure IdMappedPortTCP1Execute(AThread: TIdMappedPortThread);
    procedure IdMappedPortTCP1OutboundData(AThread: TIdMappedPortThread);
    procedure sListBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);

  private
    dialparams: TRasDialParams;
    hras: THRasConn;
    sysdir: array [0..144] of char;
    site: string;
    status : Boolean;

    { Private declarations }
  public
    { Public declarations }
procedure WMSysCommand
     (var Msg: TWMSysCommand) ;
message WM_SYSCOMMAND;

  end;

var
  Form1: TForm1;
  kecil : HICON;
  TrayIcon : TNotifyIconData;
  listen,r1,rb1,ra1,r2,rb2,ra2,r3,rb3,ra3,r4,rb4,ra4,r5,rb5,ra5,iproxy,iport,payload,userid, pass, host, ipproxy, portSSH, portProxy, typeproxy :string;
  namasb,ipsb,statusi,statuss:string;
  bv,up : Boolean;
  intMulti, intType : Integer;
    TD, Download : Integer;
   TU,Upload : Integer;

  implementation
    Uses comobj;
    procedure TForm1.WM_CALLBACKPRO(var msg : TMessage);
var
p : TPoint;
begin
case msg.LParam of
WM_LBUTTONDOWN :
begin
Shell_NotifyIcon(NIM_DELETE,@TrayIcon);
Form1.Visible := True;
end;
WM_RBUTTONDOWN :
begin
GetCursorPos(p);
PopupMenu1.Popup(p.X,p.Y);
end;
end;
end;

{$R *.dfm}
Function GetUserFromWindows: string;
Var
   UserName : string;
   UserNameLen : Dword;
Begin
   UserNameLen := 255;
   SetLength(userName, UserNameLen) ;
   If GetUserName(PChar(UserName), UserNameLen) Then
     Result := Copy(UserName,1,UserNameLen - 1)
   Else
     Result := 'Unknown';
End;

procedure TForm1.LedBlinkOnline;
begin
shape1.Refresh; //biar gak debug


if shape1.brush.color=clSilver then
begin
shape1.brush.color:=clLime;
end else
begin
shape1.brush.color:=clSilver;
end;
end;


procedure TForm1.LedBlinkOfline;
begin
shape1.Refresh; //biar gak debug


if shape2.brush.color=clSilver then
begin
shape2.brush.color:=clYellow;
end else
begin
shape2.brush.color:=clSilver;
end;
end;


function KillTask(ExeFileName: string): Integer;
const PROCESS_TERMINATE = $0001;
var ContinueLoop: BOOL;
FSnapshotHandle: THandle;
FProcessEntry32: TProcessEntry32;
begin
Result := 0;
FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
while Integer(ContinueLoop) <> 0 do begin
if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
UpperCase(ExeFileName))) then
Result := Integer(TerminateProcess( OpenProcess(PROCESS_TERMINATE,
BOOL(0), FProcessEntry32.th32ProcessID), 0));
ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
end;
CloseHandle(FSnapshotHandle);
end;



procedure ExecNewProcess(ProgramName : String; Wait: Boolean);
var
  StartInfo : TStartupInfo;
  ProcInfo : TProcessInformation;
  CreateOK : Boolean;
begin
    { fill with known state }
  FillChar(StartInfo,SizeOf(TStartupInfo),#0);
  FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
  StartInfo.cb := SizeOf(TStartupInfo);
  CreateOK := CreateProcess(nil, PChar(ProgramName), nil, nil,False,
              CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS,
              nil, nil, StartInfo, ProcInfo);
    { check to see if successful }
  if CreateOK then
    begin
        //may or may not be needed. Usually wait for child processes
      if Wait then
        WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    end
  else
    begin
      ShowMessage('Unable to run '+ProgramName);
     end;

  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
end;

procedure TForm1.Ngumpet;
begin
Form1.Visible := False;
Kecil := application.Icon.Handle;
Trayicon.cbSize := SizeOf(TNotifyIconData);
Trayicon.Wnd := handle;
Trayicon.szTip := 'zakura White';
Trayicon.uID := 1;
TrayIcon.hIcon := Kecil;
TrayIcon.uCallbackMessage := WM_CAllBack;
Trayicon.uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
Shell_NotifyIcon(NIM_ADD,@trayicon);


end;

procedure TForm1.WMSysCommand;
begin
   if (Msg.CmdType = SC_MINIMIZE)
      then
      begin
ngumpet;
end
else if (Msg.CmdType = SC_CLOSE)
      then
      begin
close;
end
else
begin
 DefaultHandler(Msg) ;
end;
end;


function GetComputerNameFromWindows: string;
var

  iLen: Cardinal;
begin
  iLen := MAX_COMPUTERNAME_LENGTH + 1;         // From Windows.pas
  Result := StringOfChar(#0, iLen);
  GetComputerName(PChar(Result), iLen);
  SetLength(Result, iLen);
end;
function GetCurrentUserName : string;
const
  cnMaxUserNameLen = 254;
var
  sUserName     : string;
  dwUserNameLen : DWord;
begin
  dwUserNameLen := cnMaxUserNameLen-1;
  SetLength( sUserName, cnMaxUserNameLen );
  GetUserName(PChar( sUserName ),dwUserNameLen );
  SetLength( sUserName, dwUserNameLen );
  Result := sUserName;
end;

procedure RunDosInMemo(DosApp:String;AMemo:TMemo) ;
  const
     ReadBuffer = 2400;
  var
   Security : TSecurityAttributes;
   ReadPipe,WritePipe : THandle;
   start : TStartUpInfo;
   ProcessInfo : TProcessInformation;
   Buffer : Pchar;
   BytesRead : DWord;
   Apprunning : DWord;
  begin
   With Security do begin
    nlength := SizeOf(TSecurityAttributes) ;
    binherithandle := true;
    lpsecuritydescriptor := nil;
   end;
   if Createpipe (ReadPipe, WritePipe,
                  @Security, 0) then begin
    Buffer := AllocMem(ReadBuffer + 1) ;
    FillChar(Start,Sizeof(Start),#0) ;
    start.cb := SizeOf(start) ;
    start.hStdOutput := WritePipe;
    start.hStdInput := ReadPipe;
    start.dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW;
    start.wShowWindow := SW_HIDE;

    if CreateProcess(nil,
           PChar(DosApp),
           @Security,
           @Security,
           true,
           NORMAL_PRIORITY_CLASS,
           nil,
           nil,
           start,
           ProcessInfo)
    then
    begin
     repeat
      Apprunning := WaitForSingleObject
                   (ProcessInfo.hProcess,100) ;
      Application.ProcessMessages;
     until (Apprunning <> WAIT_TIMEOUT) ;
      Repeat
        BytesRead := 0;
        ReadFile(ReadPipe,Buffer[0], ReadBuffer,BytesRead,nil) ;
        Buffer[BytesRead]:= #0;
        OemToAnsi(Buffer,Buffer) ;
        AMemo.Text := AMemo.text + String(Buffer) ;
      until (BytesRead < ReadBuffer) ;
   end;
   FreeMem(Buffer) ;
   CloseHandle(ProcessInfo.hProcess) ;
   CloseHandle(ProcessInfo.hThread) ;
   CloseHandle(ReadPipe) ;
   CloseHandle(WritePipe) ;
   end;
  end;

function StatusString(state: TRasConnState; error: Longint): String;
  var
    c: Array[0..100] of Char;
    s: String;
begin
  if error <> 0 then begin
    RasGetErrorString(error, c, 100);
    Result := c;
    //frmtest.btnDial.Click;
  end else begin
    s := '';
    case State of
      RASCS_OpenPort:
        s := 'Opening port';
      RASCS_PortOpened:
        s := 'Port opened';
      RASCS_ConnectDevice:
        s := 'Connecting device';
      RASCS_DeviceConnected:
        s := 'Device connected';
      RASCS_AllDevicesConnected:
        s := 'All devices connected';
      RASCS_Authenticate:
        s := 'Authenticating';
      RASCS_AuthNotify:
        s := 'Authentication: notify';
      RASCS_AuthRetry:
        s := 'Authentication: retry';
      RASCS_AuthCallback:
        s := 'Authentication: callback';
      RASCS_AuthChangePassword:
        s := 'Authentication: change password';
      RASCS_AuthProject:
        s := 'Authentication: projecting';
      RASCS_AuthLinkSpeed:
        s := 'Authentication: link speed';
      RASCS_AuthAck:
        s := 'Authentication acknowledged';
      RASCS_ReAuthenticate:
        s := ' Reauthenticating';
      RASCS_Authenticated:
        s := 'Authenticated. Logging on network';
      RASCS_PrepareForCallback:
        s := 'Preparing for callback';
      RASCS_WaitForModemReset:
        s := 'Waiting for modem reset';
      RASCS_WaitForCallback:
        s := 'Waiting for callback';
      RASCS_Projected:
        s := 'Projected';
      RASCS_StartAuthentication:
        s := 'Authenticating';
      RASCS_CallbackComplete:
        s := 'Callback complete';
      RASCS_LogonNetwork:
        s := 'Logging on network';
      RASCS_Interactive:
        s := 'Interactive';
      RASCS_RetryAuthentication:
        s := 'Retry Authentication';
      RASCS_CallbackSetByCaller:
        s := 'Callback set by caller';
      RASCS_PasswordExpired:
        s := 'Password expired';
      RASCS_Connected:
        s := 'Connected';
      RASCS_Disconnected:
        s := 'Disconnected';
    end;
    Result := s;
  end;
end;



procedure RasCallback(msg: Integer; state: TRasConnState;
    error: Longint); stdcall
begin
 form1.lblstatus.caption := statusstring(state, error);
 if strcomp(pchar(statusstring(state, error)), 'Connected')= 0 then begin
  // ShellExecute (form1.handle, 'Open', pchar(form1.site),nil, nil, SW_SHOWMAXIMIZED);
   form1.timer2.enabled:=true;
 end;
 if Pos('Connected',form1.lblStatus.Caption)<> 0 then begin
   if form1.chkIPHunter.Checked=True then begin
    Sleep(1000);
    form1.IPhunter;
   end
 end;
end;

procedure Tform1.IPHunter;
var
  ListIP : TStringList;
  i : Integer;
  curIP : string;
begin
  curIP := lblIP1.Caption;   { local ipnya}
  ListIP := TStringList.Create;
  ListIP.Text := edtIPHunter.Text;
  ListIP.Text := StringReplace(ListIP.Text,';',#13#10,[rfReplaceAll]);

  for i:=0 to ListIP.Count - 1 do begin
    if Pos(ListIP[i],curIP) <> 0 then begin
      status := True;
     // MessageBox(Self.Handle, 'IP Found', 'ip hunter', MB_OK + MB_ICONINFORMATION);
      Application.MessageBox('IP Address Found', 'ip hunter');
      Exit;
    end;
  end;

  if not status then
  form1.lblStatus.Caption:='';
  btnDial.Click;
  form1.tmr1.Enabled:=True;
end;


Function GetIPAddress():String;
type
  pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  namebuf : Array[0..255] of char;
begin
  If WSAStartup($101,varTWSAData) <> 0 Then
    Result := 'No. IP Address'
  Else Begin
    gethostname(namebuf,sizeof(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    //Result := 'My IP: '+inet_ntoa(varTInAddr);
    Result := inet_ntoa(varTInAddr);
  End;
  WSACleanup;
end;


procedure TForm1.btnSaveClick(Sender: TObject);
var myINI : TINIFile;
namafile : string;
begin
  with dlgSave1 do begin
    InitialDir:=ExtractFilePath(Application.ExeName);
    Filter:='zWhite (*.zw)|*.zw';
  end;

   if dlgSave1.Execute then begin
    namafile := dlgSave1.FileName;
    if Pos('.zw',namafile) = 0 then namafile := namafile + '.zw';
    myINI := TINIFile.Create(namafile);
    myINI.WriteString('Config', 'User', Trim(edtuser.Text));
    myINI.WriteString('Config', 'Pass', Trim(edtpass.Text));
    myINI.WriteString('Config', 'Host', Trim(edtserver.Text));
    myINI.WriteString('Config', 'Port', Trim(edtportssh.Text));
    myINI.WriteString('Config', 'Multi', IntToStr(cbbMULTI.ItemIndex));
    if chkproxy.Checked then myINI.WriteString('Config', 'Proxy', '1')
    else myINI.WriteString('Config', 'Proxy', '0');
    myINI.WriteString('Config', 'ProxyIP', Trim(edtproxyIP.Text));
    myINI.WriteString('Config', 'ProxyPort', Trim(edtproxyPort.Text));
    myINI.WriteString('Config', 'ProxyType', IntToStr(cbbtypeproxy.ItemIndex));
    if pfportable.Checked then myINI.WriteString('Config', 'PF Portable', '1')
    else myINI.WriteString('Config', 'PF Portable', '0');

    myINI.Free;
  end;
end;
procedure TForm1.btnloadClick(Sender: TObject);
var myINI,aku : TINIFile;
namafile : string;
begin
with dlgOpen1 do begin
    InitialDir:=ExtractFilePath(Application.ExeName);
    Filter:='zWhite (*.zw)|*.zw';
end;
  if dlgOpen1.Execute then begin
    namafile := dlgOpen1.FileName;
    myINI := TINIFile.Create(namafile);
    edtuser.Text := myINI.ReadString('Config', 'User', '');
    edtpass.Text := myINI.ReadString('Config', 'Pass', '');
    edtserver.Text := myINI.ReadString('Config', 'Host', '');
    edtportssh.Text := myINI.ReadString('Config', 'Port', '');
    cbbMULTI.ItemIndex := StrToInt(myINI.ReadString('Config', 'Multi', ''));
    chkproxy.Checked := myINI.ReadString('Config', 'Proxy', '') = '1';
    edtproxyIP.Text := myINI.ReadString('Config', 'ProxyIP', '');
    edtproxyPort.Text := myINI.ReadString('Config', 'ProxyPort', '');
    cbbtypeproxy.ItemIndex := StrToInt(myINI.ReadString('Config', 'ProxyType','0'));
    myINI.Free;
        aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
aku.WriteString('SSH', 'Last Load', namafile);
aku.Free;

  end;


  end;

procedure TForm1.chkproxyClick(Sender: TObject);
begin
if chkproxy.Checked = true then
begin
edtproxyIP.Enabled:=true;
edtproxyPort.Enabled:=true;
cbbtypeproxy.Enabled:=true;
end
else
begin
edtproxyIP.Enabled:=false;
edtproxyPort.Enabled:=false;
cbbtypeproxy.Enabled:=false;
end;

end;

procedure TForm1.simpandata;
begin
  userid := Trim(edtuser.text);
  pass := Trim(edtpass.Text);
  host := Trim(edtserver.Text);
  portSSH := Trim(edtportssh.Text);
  ipproxy := Trim(edtproxyIP.Text);
  portProxy := Trim(edtproxyPort.Text);
  typeproxy := Trim(cbbtypeproxy.Text);
  intMulti := cbbMULTI.ItemIndex;
  up := chkproxy.Checked;
end;

procedure Tform1.cekdata;
begin
  if (userid <> Trim(edtuser.text)) or
  (pass <> Trim(edtpass.Text)) or
  (host <> Trim(edtserver.Text)) or
  (portSSH <> Trim(edtportssh.Text)) or
  (ipproxy <> Trim(edtproxyIP.Text)) or
  (portProxy <> Trim(edtproxyPort.Text)) or
  (typeproxy <> Trim(cbbtypeproxy.Text)) or
  (up <> chkproxy.Checked) or
  (intMulti <> cbbMULTI.ItemIndex) then bv := False;
end;

procedure TForm1.btnLoginClick(Sender: TObject);
var
  multi,a : Integer;
  st, ProxyType : string;
begin

if btnLogin.Caption = 'Login' then begin
statuss:='SSH : ON';
  btnLogin.Caption := 'Logout';
  KillTask('bvssh.exe');
KillTask('Proxifier.exe');
    multi := cbbMULTI.ItemIndex + 1;
    ProxyType := cbbtypeproxy.Text;
    for a := 1 to multi do begin
      st := ' -profile='+ExtractFilePath(ParamStr(0))+'zdata\' + inttostr(a) + '.bscp -user=' + edtuser.Text + ' -password=' + edtpass.Text + ' -host=' + edtserver.Text + ' -port=' + edtportssh.Text;
      if not chkproxy.Checked then
      begin
       st := st + ' -proxy=n'
      end
      else begin
      st := st + ' -proxy=y -proxyType=' + cbbtypeproxy.Text + ' -proxyServer=' + edtproxyIP.Text + ' -proxyPort=' + edtproxyPort.Text;
      end;
      st := st + ' -hide=main,trayWRC,traySFTP,trayRDP,trayPopups -Title=zWhite' + IntToStr(a) +' -loginOnStartup';
      ExecNewProcess('zdata/bvssh.exe'+PAnsiChar(st),false);
      //      ShellExecute(Handle,'open','zdata\bvssh.exe',PAnsiChar(st),nil,SW_HIDE);
      st := ExtractFilePath(ParamStr(0))+'zdata\zwhite' + inttostr(multi) + '.ppx silent-load';
   end;
   if pfportable.Checked = true then
   begin
      ExecNewProcess('zdata\Proxifier.exe '+PAnsiChar(st),false);
   // ShellExecute(Handle,'open','zdata\Proxifier.exe',PAnsiChar(st),nil,SW_SHOWMINIMIZED);
   end
   else
   begin
      ExecNewProcess('C:\Program Files\Proxifier\proxifier.exe '+PAnsiChar(st),false);
   end;
end else begin
  btnLogin.Caption := 'Login';
  statuss:='SSH : OFF';

  //kill
KillTask('bvssh.exe');
KillTask('Proxifier.exe');

end;
end;
procedure TForm1.FormCreate(Sender: TObject);
var myINI,aku : TINIFile;
lastloadfile,z:string;
begin
  bv := False;
  hras:=0;
btngetentries.click;
btngetparams.click;
cbbMULTI.ItemIndex:=0;
getprofileinjek;

//getnamafile
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
lastloadfile:=aku.ReadString('SSH', 'Last Load','');
listen.Text:=aku.ReadString('z', 'listen','2424');
TD:=aku.ReadInteger('z', 'Total Download',0);
TU:=aku.ReadInteger('z', 'Total Upload',0);
edtIPHunter.Text:=aku.ReadString('z', 'Last IP Hunter','');
spagecontrol1.TabIndex:=aku.ReadInteger('z', 'Last TAB',4);
slistbox1.ItemIndex:=aku.ReadInteger('z', 'Last Injek',0);
z:='INJEK'+inttostr(slistbox1.ItemIndex+1);
payload:=aku.ReadString(z, 'payload', 'z');
iproxy:=aku.ReadString(z, 'proxy', 'z');
iport:=aku.ReadString(z, 'port', 'z');
r1:=aku.ReadString(z, 'r1', '');
rb1:=aku.ReadString(z, 'rb1', '');
ra1:=aku.ReadString(z, 'ra1', '');
r2:=aku.ReadString(z, 'r2', '');
rb2:=aku.ReadString(z, 'rb2', '');
ra2:=aku.ReadString(z, 'ra2', '');
r3:=aku.ReadString(z, 'r3', '');
rb3:=aku.ReadString(z, 'rb3', '');
ra3:=aku.ReadString(z, 'ra3', '');

//if namafile ada then
if FileExists(lastloadfile) = true then
begin

    myINI := TINIFile.Create(lastloadfile);
    edtuser.Text := myINI.ReadString('Config', 'User', '');
    edtpass.Text := myINI.ReadString('Config', 'Pass', '');
    edtserver.Text := myINI.ReadString('Config', 'Host', '');
    edtportssh.Text := myINI.ReadString('Config', 'Port', '');
    cbbMULTI.ItemIndex := StrToInt(myINI.ReadString('Config', 'Multi', ''));
    chkproxy.Checked := myINI.ReadString('Config', 'Proxy', '') = '1';
    edtproxyIP.Text := myINI.ReadString('Config', 'ProxyIP', '');
    edtproxyPort.Text := myINI.ReadString('Config', 'ProxyPort', '');
    cbbtypeproxy.ItemIndex := StrToInt(myINI.ReadString('Config', 'ProxyType','0'));
    pfportable.Checked := myINI.ReadString('Config', 'PF Portable', '') = '1';
    myINI.Free;
end;
namasb:=GetUserFromWindows;
statuss:='SSH : OFF';
statusi:='INJEK : OFF';
end;

procedure TForm1.btnDialClick(Sender: TObject);
  var
    r: integer;
    c: Array[0..100] of Char;
begin

  if btnDial.Caption='Dial' then begin

    //lblstatus.caption :='';
    btnDial.Caption:='Dialing...';
    FillChar(dialparams, SizeOf(TRasDialParams), 0);
    with dialparams do
    begin
      dwSize := Sizeof(TRasDialParams);
      StrPCopy(szEntryName, lstEntries.Items[lstEntries.ItemIndex]);
      // You can override phone number here...
    end;
    hRas := 0;
    r := RasDial(nil,   // This field is ignored in Windows95
        nil,  // Phonebook: use default (not used on Win95)
        dialparams,
        0, // use callback function of type RASDIALFUNC
        @RasCallback,   // callback function
        hRas);
    //    btnSetParams.Click;
    if r <> 0 then begin
      RasGetErrorString(r, c, 100);
      lblstatus.caption:= c;
    end;
  end else begin
    if  hRas = 0 then
     exit;
    if RasHangUp(hRas) <> 0 then
    begin
     MessageDlg('Error : Cannot hangup connection.', mtCustom,[mbOK] ,0);
    end;
  end;

end;



procedure TForm1.Timer2Timer(Sender: TObject);
  var
    bufsize: Longint;
    numEntries: Longint;
    x: Integer;
    entries: Array[1..100] of TRasConn;
    stat: TRasConnStatus;
begin

  lblIP1.Caption:= GetIPAddress;
  entries[1].dwSize := SizeOf(TRasConn);
  bufsize := SizeOf(TRasConn) * 100;
  FillChar(stat, Sizeof(TRasConnStatus), 0);
  stat.dwSize := Sizeof(TRasConnStatus);
  if RasEnumConnections(@entries[1], bufsize, numEntries) = 0 then begin
      if numEntries > 0 then begin
        for x := 1 to numEntries do
          with form1, entries[x] do
          begin
            hras := hrasconn;
            RasGetConnectStatus(hras, stat);
            lblstatus.caption := StatusString(stat.rasconnstate, stat.dwError) ;
            btnDial.Caption:='Hang up';
            lstentries.Enabled:=False;
          end;
      end else begin
        timer2.enabled:=false;
        lblstatus.caption :='Not connected';
        btnDial.Caption:='Dial';
        lstentries.enabled:=true;
      end;
  end else
  Messagedlg ('Error : Cannot retrieve connection details ', mtCustom,[mbOK] ,0);
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  if (pos('Connected',lblStatus.Caption)<>0) or (pos('Not connected',lblStatus.Caption)<>0) then
  begin
  btnDial.Click;
  tmr1.Enabled:=False;
  end;

end;

procedure TForm1.btnSetParamsClick(Sender: TObject);
var
    bufsize: Longint;
    numEntries: Longint;
    entries: Array[1..12] of TRasEntryName;
    x: Integer;
begin
  entries[1].dwSize := SizeOf(TRasEntryName);
  bufsize := SizeOf(TRasEntryName) * 12;
  if RasEnumEntries(nil, nil, @entries[1], bufsize, numEntries) = 0 then
    begin
    if numEntries > 0 then
      begin
      for x := 1 to numEntries do
        lstEntries.Items.Add(entries[x].szEntryName);
        lstEntries.ItemIndex := 0;
      end;
    end
  else
  MessageDlg('Error : Cannot retrieve entry names', mtCustom,[mbOK] ,0);
end;


procedure TForm1.btnGetEntriesClick(Sender: TObject);
 var
    bufsize: Longint;
    numEntries: Longint;
    entries: Array[1..12] of TRasEntryName;
    x: Integer;
begin
  entries[1].dwSize := SizeOf(TRasEntryName);
  bufsize := SizeOf(TRasEntryName) * 12;
  if RasEnumEntries(nil, nil, @entries[1], bufsize, numEntries) = 0 then
    begin
    if numEntries > 0 then
      begin
      for x := 1 to numEntries do
        lstEntries.Items.Add(entries[x].szEntryName);
        lstEntries.ItemIndex := 0;
      end;
    end
  else
  MessageDlg('Error : Cannot retrieve entry names', mtCustom,[mbOK] ,0);
end;

procedure TForm1.btnGetParamsClick(Sender: TObject);
 var
    fp: LongBool;
    r: Longint;
    c: Array[0..100] of Char;
  begin
  if lstentries.itemindex=-1 then
   exit;

  FillChar(dialparams, SizeOf(TRasDialParams), 0);
  with dialparams do
    begin
    dwSize := Sizeof(TRasDialParams);
    StrPCopy(szEntryName, lstEntries.Items[lstEntries.ItemIndex]);
    end;

  r := RasGetEntryDialParams(nil, dialparams, fp);
  if r = 0 then
    with dialparams do
      begin
      if fp then
      end
  else
    begin
    RasGetErrorString(r, c, 100);
    MessageDlg(('Error : ' + c), mtCustom,[mbOK] ,0);
    end;
  end;

procedure TForm1.sSpeedButton1Click(Sender: TObject);
begin
spagecontrol1.ActivePageIndex:=0;
end;

procedure TForm1.sSpeedButton2Click(Sender: TObject);
begin
spagecontrol1.ActivePageIndex:=1;
end;

procedure TForm1.sSpeedButton3Click(Sender: TObject);
begin
spagecontrol1.ActivePageIndex:=2;
end;

procedure TForm1.sButton1Click(Sender: TObject);
var n:string;
begin
n:=GetIPAddress;
smemo1.Clear;
if (scombobox1.Text = 'Operator') then
begin
showmessage('Pilih dulu Operatornya');
end
else
begin
  if scombobox1.Text = 'XL' then begin
  RunDosInMemo('route.exe add 202.152.240.50 mask 255.255.255.255 ' + n,sMemo1) ;
  end
  else if scombobox1.Text = 'INDOSAT' then begin
  RunDosInMemo('route.exe add 10.19.19.19 mask 255.255.255.255 ' + n,sMemo1) ;
  end
  else if scombobox1.Text = 'MANUAL' then begin
  RunDosInMemo('route.exe add '+sedit1.Text+' mask 255.255.255.255 ' + n,sMemo1) ;
 end;
end;

end;
procedure TForm1.sButton3Click(Sender: TObject);
begin
smemo1.Clear;
RunDosInMemo('route.exe print',sMemo1) ;

end;

procedure TForm1.sButton2Click(Sender: TObject);
begin
if (slistbox1.ItemIndex < -1) or (slistbox1.Items.Strings[slistbox1.ItemIndex]='----------------------------')  then
begin
showmessage('Pilih Profilnya dulu')
end
else
begin
if sbutton2.caption = 'Start' then
begin
statusi:='INJEK : ON';
    IdMappedPortTCP1.Bindings.Add.IP := '127.0.0.1';
    IdMappedPortTCP1.Bindings.Add.Port := strtoint(listen.Text);
    IdMappedPortTCP1.MappedHost := iproxy;
    IdMappedPortTCP1.MappedPort := strtoint(iport);
    IdMappedPortTCP1.Active := True;
    sbutton4.Enabled:=false;
    sbutton5.Enabled:=false;
    listen.Enabled:=false;
    slistbox1.Enabled:=false;
    sbutton2.caption:='Stop';
    end
    else
    begin
      IdMappedPortTCP1.Active := false;
  IdMappedPortTCP1.Bindings.Clear;
  sbutton2.caption:='Start';
  listen.Enabled:=true;
    slistbox1.Enabled:=true;
    sbutton4.Enabled:=true;
    sbutton5.Enabled:=true;
    statusi:='INJEK : OFF';
  end;
end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
slabel2.Caption:=getipaddress();
end;

procedure TForm1.sComboBox1Change(Sender: TObject);
begin
if scombobox1.Text = 'MANUAL' then
begin
sedit1.Visible:=true;
end
else
begin
sedit1.Visible:=false;
end;
end;

procedure TForm1.sEdit1Click(Sender: TObject);
begin
sedit1.Clear;
end;

procedure TForm1.sSpeedButton5Click(Sender: TObject);
begin
spagecontrol1.ActivePageIndex:=4;

end;

procedure TForm1.Image3Click(Sender: TObject);
begin
ShellExecute(0, 'OPEN', PChar('http://oqhatime.blospot.com'), '', '', SW_SHOWNORMAL);
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
ShellExecute(0, 'OPEN', PChar('http://www.fb.com/isdemoners'), '', '', SW_SHOWNORMAL);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Form1.Visible := False;
Kecil := application.Icon.Handle;
Trayicon.cbSize := SizeOf(TNotifyIconData);
Trayicon.Wnd := handle;
Trayicon.szTip := 'Aplikasi Tray Icon // Double Click For Show';
Trayicon.uID := 1;
TrayIcon.hIcon := Kecil;
TrayIcon.uCallbackMessage := WM_CAllBack;
Trayicon.uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
Shell_NotifyIcon(NIM_ADD,@trayicon);
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
Halt;
end;

procedure TForm1.Show1Click(Sender: TObject);
begin
Shell_NotifyIcon(NIM_DELETE,@TrayIcon);
Form1.Visible := True;

end;

procedure TForm1.sSpeedButton4Click(Sender: TObject);
begin
spagecontrol1.ActivePageIndex:=3;

end;

procedure TForm1.pfportableClick(Sender: TObject);
begin
if pfportable.Checked=false then
 begin
if FileExists('C:\Program Files\Proxifier\proxifier.exe') = false then
begin
showmessage('gk ada Proxifier biasanya');
pfportable.Checked:=true;
end;
end;
end;

procedure TForm1.IdMappedPortTCP1Execute(AThread: TIdMappedPortThread);
var a,b,c:string;
begin
LedBlinkOnline;
b:=athread.NetData;
 if Pos ('HTTP/1.0'+#13#10, AThread.NetData) <>0 then begin
  b := StringReplace(b,'HTTP/1.0'+#13#10,'HTTP/1.0',[rfReplaceAll]);
  end;
c:=athread.NetData;
 if Pos ('HTTP/1.0'+#13#10#13#10, AThread.NetData) <>0 then begin
c := StringReplace(c,'HTTP/1.0'+#13#10#13#10,'HTTP/1.0',[rfReplaceAll]);
end;

a:=payload;
a:=StringReplace(a,'#z',#13#10,[rfReplaceAll]);
a:=StringReplace(a,'#jones',athread.NetData,[rfReplaceAll]);
a:=StringReplace(a,'#jjones',b,[rfReplaceAll]);
a:=StringReplace(a,'#jjjones',c,[rfReplaceAll]);

if (Pos('GET', AThread.NetData)) or (Pos('POST', AThread.NetData)) or (Pos('CONNECT', AThread.NetData)) <> 0 then
begin
athread.NetData:=a;
end;
upload := upload+Length(AThread.NetData);
TU := TU+Length(AThread.NetData);
end;

procedure TForm1.IdMappedPortTCP1OutboundData(
  AThread: TIdMappedPortThread);
begin

LedBlinkOfline;
//replace
if r1 = 'yaps' then
begin
     if Pos (rb1, AThread.NetData) <>0 then begin
  AThread.NetData := StringReplace(athread.NetData,rb1,ra1,[rfReplaceAll]);
       end;
end;

if r2 = 'yaps' then
begin
     if Pos (rb2, AThread.NetData) <>0 then begin
  AThread.NetData := StringReplace(athread.NetData,rb2,ra2,[rfReplaceAll]);
       end;
end;

if r3 = 'yaps' then
begin
     if Pos (rb3, AThread.NetData) <>0 then begin
  AThread.NetData := StringReplace(athread.NetData,rb3,ra3,[rfReplaceAll]);
       end;
end;

if r4 = 'yaps' then
begin
     if Pos (rb4, AThread.NetData) <>0 then begin
  AThread.NetData := StringReplace(athread.NetData,rb4,ra4,[rfReplaceAll]);
       end;
end;

if r5 = 'yaps' then
begin
     if Pos (rb5, AThread.NetData) <>0 then begin
  AThread.NetData := StringReplace(athread.NetData,rb5,ra5,[rfReplaceAll]);
       end;

       end;

  if Pos ('HTTP/1.1 ', AThread.NetData) <>0 then begin
respon.Caption:=athread.netdata;
       end;


download := download+Length(AThread.NetData);
TD := TD+Length(AThread.NetData);
end;

procedure TForm1.sListBox1Click(Sender: TObject);
var aku:TINIFile;
begin
if slistbox1.ItemIndex = 0 then
begin
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
slistbox1.Items.Strings[0]:= aku.ReadString('INJEK1', 'Nama', 'z');
payload:=aku.ReadString('INJEK1', 'payload', 'z');
iproxy:=aku.ReadString('INJEK1', 'proxy', 'z');
iport:=aku.ReadString('INJEK1', 'port', 'z');
r1:=aku.ReadString('INJEK1', 'r1', '');
rb1:=aku.ReadString('INJEK1', 'rb1', '');
ra1:=aku.ReadString('INJEK1', 'ra1', '');
r2:=aku.ReadString('INJEK1', 'r2', '');
rb2:=aku.ReadString('INJEK1', 'rb2', '');
ra2:=aku.ReadString('INJEK1', 'ra2', '');
r3:=aku.ReadString('INJEK1', 'r3', '');
rb3:=aku.ReadString('INJEK1', 'rb3', '');
ra3:=aku.ReadString('INJEK1', 'ra3', '');
aku.Free;
end;

if slistbox1.ItemIndex = 1 then
begin
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
slistbox1.Items.Strings[1]:= aku.ReadString('INJEK2', 'Nama', 'z');
payload:=aku.ReadString('INJEK2', 'payload', 'z');
iproxy:=aku.ReadString('INJEK2', 'proxy', 'z');
iport:=aku.ReadString('INJEK2', 'port', 'z');
r1:=aku.ReadString('INJEK2', 'r1', '');
rb1:=aku.ReadString('INJEK2', 'rb1', '');
ra1:=aku.ReadString('INJEK2', 'ra1', '');
r2:=aku.ReadString('INJEK2', 'r2', '');
rb2:=aku.ReadString('INJEK2', 'rb2', '');
ra2:=aku.ReadString('INJEK2', 'ra2', '');
r3:=aku.ReadString('INJEK2', 'r3', '');
rb3:=aku.ReadString('INJEK2', 'rb3', '');
ra3:=aku.ReadString('INJEK2', 'ra3', '');

aku.Free;
end;

if slistbox1.ItemIndex = 2 then
begin
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
slistbox1.Items.Strings[2]:= aku.ReadString('INJEK3', 'Nama', 'z');
payload:=aku.ReadString('INJEK3', 'payload', 'z');
iproxy:=aku.ReadString('INJEK3', 'proxy', 'z');
iport:=aku.ReadString('INJEK3', 'port', 'z');
r1:=aku.ReadString('INJEK3', 'r1', '');
rb1:=aku.ReadString('INJEK3', 'rb1', '');
ra1:=aku.ReadString('INJEK3', 'ra1', '');
r2:=aku.ReadString('INJEK3', 'r2', '');
rb2:=aku.ReadString('INJEK3', 'rb2', '');
ra2:=aku.ReadString('INJEK3', 'ra2', '');
r3:=aku.ReadString('INJEK3', 'r3', '');
rb3:=aku.ReadString('INJEK3', 'rb3', '');
ra3:=aku.ReadString('INJEK3', 'ra3', '');

aku.Free;
end;

if slistbox1.ItemIndex = 3 then
begin
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
slistbox1.Items.Strings[3]:= aku.ReadString('INJEK4', 'Nama', 'z');
payload:=aku.ReadString('INJEK4', 'payload', 'z');
iproxy:=aku.ReadString('INJEK4', 'proxy', 'z');
iport:=aku.ReadString('INJEK4', 'port', 'z');
r1:=aku.ReadString('INJEK4', 'r1', '');
rb1:=aku.ReadString('INJEK4', 'rb1', '');
ra1:=aku.ReadString('INJEK4', 'ra1', '');
r2:=aku.ReadString('INJEK4', 'r2', '');
rb2:=aku.ReadString('INJEK4', 'rb2', '');
ra2:=aku.ReadString('INJEK4', 'ra2', '');
r3:=aku.ReadString('INJEK4', 'r3', '');
rb3:=aku.ReadString('INJEK4', 'rb3', '');
ra3:=aku.ReadString('INJEK4', 'ra3', '');

aku.Free;
end;

if slistbox1.ItemIndex = 4 then
begin
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
slistbox1.Items.Strings[4]:= aku.ReadString('INJEK5', 'Nama', 'z');
payload:=aku.ReadString('INJEK5', 'payload', 'z');
iproxy:=aku.ReadString('INJEK5', 'proxy', 'z');
iport:=aku.ReadString('INJEK5', 'port', 'z');
r1:=aku.ReadString('INJEK5', 'r1', '');
rb1:=aku.ReadString('INJEK5', 'rb1', '');
ra1:=aku.ReadString('INJEK5', 'ra1', '');
r2:=aku.ReadString('INJEK5', 'r2', '');
rb2:=aku.ReadString('INJEK5', 'rb2', '');
ra2:=aku.ReadString('INJEK5', 'ra2', '');
r3:=aku.ReadString('INJEK5', 'r3', '');
rb3:=aku.ReadString('INJEK5', 'rb3', '');
ra3:=aku.ReadString('INJEK5', 'ra3', '');

aku.Free;
end;

if slistbox1.ItemIndex = 5 then
begin
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
slistbox1.Items.Strings[5]:= aku.ReadString('INJEK6', 'Nama', 'z');
payload:=aku.ReadString('INJEK6', 'payload', 'z');
iproxy:=aku.ReadString('INJEK6', 'proxy', 'z');
iport:=aku.ReadString('INJEK6', 'port', 'z');
r1:=aku.ReadString('INJEK6', 'r1', '');
rb1:=aku.ReadString('INJEK6', 'rb1', '');
ra1:=aku.ReadString('INJEK6', 'ra1', '');
r2:=aku.ReadString('INJEK6', 'r2', '');
rb2:=aku.ReadString('INJEK6', 'rb2', '');
ra2:=aku.ReadString('INJEK6', 'ra2', '');
r3:=aku.ReadString('INJEK6', 'r3', '');
rb3:=aku.ReadString('INJEK6', 'rb3', '');
ra3:=aku.ReadString('INJEK6', 'ra3', '');

aku.Free;
end;


end;
procedure TForm1.getprofileinjek;
var aku:TINIFile;
begin
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
//asd
slistbox1.Items.Strings[5]:= aku.ReadString('INJEK6', 'Nama', 'z');
payload:=aku.ReadString('INJEK6', 'payload', 'z');
iproxy:=aku.ReadString('INJEK6', 'proxy', 'z');
iport:=aku.ReadString('INJEK6', 'port', 'z');
r1:=aku.ReadString('INJEK6', 'r1', '');
rb1:=aku.ReadString('INJEK6', 'rb1', '');
ra1:=aku.ReadString('INJEK6', 'ra1', '');
r2:=aku.ReadString('INJEK6', 'r2', '');
rb2:=aku.ReadString('INJEK6', 'rb2', '');
ra2:=aku.ReadString('INJEK6', 'ra2', '');
r3:=aku.ReadString('INJEK6', 'r3', '');
rb3:=aku.ReadString('INJEK6', 'rb3', '');
ra3:=aku.ReadString('INJEK6', 'ra3', '');

slistbox1.Items.Strings[4]:= aku.ReadString('INJEK5', 'Nama', 'z');
payload:=aku.ReadString('INJEK5', 'payload', 'z');
iproxy:=aku.ReadString('INJEK5', 'proxy', 'z');
iport:=aku.ReadString('INJEK5', 'port', 'z');
r1:=aku.ReadString('INJEK5', 'r1', '');
rb1:=aku.ReadString('INJEK5', 'rb1', '');
ra1:=aku.ReadString('INJEK5', 'ra1', '');
r2:=aku.ReadString('INJEK5', 'r2', '');
rb2:=aku.ReadString('INJEK5', 'rb2', '');
ra2:=aku.ReadString('INJEK5', 'ra2', '');
r3:=aku.ReadString('INJEK5', 'r3', '');
rb3:=aku.ReadString('INJEK5', 'rb3', '');
ra3:=aku.ReadString('INJEK5', 'ra3', '');

slistbox1.Items.Strings[3]:= aku.ReadString('INJEK4', 'Nama', 'z');
payload:=aku.ReadString('INJEK4', 'payload', 'z');
iproxy:=aku.ReadString('INJEK4', 'proxy', 'z');
iport:=aku.ReadString('INJEK4', 'port', 'z');
r1:=aku.ReadString('INJEK4', 'r1', '');
rb1:=aku.ReadString('INJEK4', 'rb1', '');
ra1:=aku.ReadString('INJEK4', 'ra1', '');
r2:=aku.ReadString('INJEK4', 'r2', '');
rb2:=aku.ReadString('INJEK4', 'rb2', '');
ra2:=aku.ReadString('INJEK4', 'ra2', '');
r3:=aku.ReadString('INJEK4', 'r3', '');
rb3:=aku.ReadString('INJEK4', 'rb3', '');
ra3:=aku.ReadString('INJEK4', 'ra3', '');


slistbox1.Items.Strings[2]:= aku.ReadString('INJEK3', 'Nama', 'z');
payload:=aku.ReadString('INJEK3', 'payload', 'z');
iproxy:=aku.ReadString('INJEK3', 'proxy', 'z');
iport:=aku.ReadString('INJEK3', 'port', 'z');
r1:=aku.ReadString('INJEK3', 'r1', '');
rb1:=aku.ReadString('INJEK3', 'rb1', '');
ra1:=aku.ReadString('INJEK3', 'ra1', '');
r2:=aku.ReadString('INJEK3', 'r2', '');
rb2:=aku.ReadString('INJEK3', 'rb2', '');
ra2:=aku.ReadString('INJEK3', 'ra2', '');
r3:=aku.ReadString('INJEK3', 'r3', '');
rb3:=aku.ReadString('INJEK3', 'rb3', '');
ra3:=aku.ReadString('INJEK3', 'ra3', '');


slistbox1.Items.Strings[1]:= aku.ReadString('INJEK2', 'Nama', 'z');
payload:=aku.ReadString('INJEK2', 'payload', 'z');
iproxy:=aku.ReadString('INJEK2', 'proxy', 'z');
iport:=aku.ReadString('INJEK2', 'port', 'z');
r1:=aku.ReadString('INJEK2', 'r1', '');
rb1:=aku.ReadString('INJEK2', 'rb1', '');
ra1:=aku.ReadString('INJEK2', 'ra1', '');
r2:=aku.ReadString('INJEK2', 'r2', '');
rb2:=aku.ReadString('INJEK2', 'rb2', '');
ra2:=aku.ReadString('INJEK2', 'ra2', '');
r3:=aku.ReadString('INJEK2', 'r3', '');
rb3:=aku.ReadString('INJEK2', 'rb3', '');
ra3:=aku.ReadString('INJEK2', 'ra3', '');


slistbox1.Items.Strings[0]:= aku.ReadString('INJEK1', 'Nama', 'z');
payload:=aku.ReadString('INJEK1', 'payload', 'z');
iproxy:=aku.ReadString('INJEK1', 'proxy', 'z');
iport:=aku.ReadString('INJEK1', 'port', 'z');
r1:=aku.ReadString('INJEK1', 'r1', '');
rb1:=aku.ReadString('INJEK1', 'rb1', '');
ra1:=aku.ReadString('INJEK1', 'ra1', '');
r2:=aku.ReadString('INJEK1', 'r2', '');
rb2:=aku.ReadString('INJEK1', 'rb2', '');
ra2:=aku.ReadString('INJEK1', 'ra2', '');
r3:=aku.ReadString('INJEK1', 'r3', '');
rb3:=aku.ReadString('INJEK1', 'rb3', '');
ra3:=aku.ReadString('INJEK1', 'ra3', '');


end;

procedure TForm1.FormDestroy(Sender: TObject);
var myINI : TINIFile;
begin
myINI := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');
myINI.WriteString('z', 'listen', listen.Text);
myINI.WriteInteger('z', 'Total Download', TD);
myINI.WriteInteger('z', 'Total Upload', TU);
myINI.WriteString('z','Last IP Hunter', edtIPHunter.Text);
myINI.WriteInteger('z', 'Last TAB', spagecontrol1.TabIndex);
myINI.WriteInteger('z', 'Last Injek', slistbox1.ItemIndex);

myINI.Free;

  KillTask('bvssh.exe');
KillTask('Proxifier.exe');

end;

procedure TForm1.sButton5Click(Sender: TObject);
var myINI : TINIFile;
a:string;
begin
myINI := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');

a:='INJEK'+inttostr(slistbox1.ItemIndex+1);
 myINI.WriteString(a, 'Nama', '----------------------------');
  myINI.WriteString(a, 'Payload', '');
  myINI.WriteString(a, 'Proxy', '');
  myINI.WriteString(a, 'Port', '');
   myINI.WriteString(a,'r1', '');
   myINI.WriteString(a,'rb1', '');
   myINI.WriteString(a,'ra1', '');
   myINI.WriteString(a,'r2', '');
   myINI.WriteString(a,'rb2', '');
   myINI.WriteString(a,'ra2', '');
   myINI.WriteString(a,'r3', '');
   myINI.WriteString(a,'rb3', '');
   myINI.WriteString(a,'ra3', '');

   getprofileinjek;

end;

procedure TForm1.sButton4Click(Sender: TObject);
var myINI,aku : TINIFile;
namafile : string;
begin
with sOpenDialog1 do begin
    InitialDir:=ExtractFilePath(Application.ExeName);
    Filter:='zWhite (*.zw)|*.zw';
end;
  if sOpenDialog1.Execute then begin
	namafile := sOpenDialog1.FileName;
	myINI := TINIFile.Create(namafile);
aku := TINIFile.Create(ExtractFilePath(Application.ExeName)+'zdata\zwhite.ini');


//ififif
if slistbox1.Items.Strings[0] = '----------------------------' then
begin
//addline0
aku.WriteString('INJEK1', 'Nama', myINI.ReadString('zwhite', 'Nama', ''));
aku.WriteString('INJEK1', 'Payload', myINI.ReadString('zwhite', 'Payload', ''));
aku.WriteString('INJEK1', 'Proxy', myINI.ReadString('zwhite', 'Proxy', ''));
aku.WriteString('INJEK1', 'Port', myINI.ReadString('zwhite', 'Port', ''));
aku.WriteString('INJEK1', 'r1', myINI.ReadString('zwhite', 'r1', ''));
aku.WriteString('INJEK1', 'rb1', myINI.ReadString('zwhite', 'rb1', ''));
aku.WriteString('INJEK1', 'ra1', myINI.ReadString('zwhite', 'ra1', ''));
aku.WriteString('INJEK1', 'r2', myINI.ReadString('zwhite', 'r2', ''));
aku.WriteString('INJEK1', 'rb2', myINI.ReadString('zwhite', 'rb2', ''));
aku.WriteString('INJEK1', 'ra2', myINI.ReadString('zwhite', 'ra2', ''));
aku.WriteString('INJEK1', 'r3', myINI.ReadString('zwhite', 'r3', ''));
aku.WriteString('INJEK1', 'rb3', myINI.ReadString('zwhite', 'rb3', ''));
aku.WriteString('INJEK1', 'ra3', myINI.ReadString('zwhite', 'ra3', ''));


end
else
begin
//lineberikutnya
    if slistbox1.Items.Strings[1] = '----------------------------' then
begin
//addline1
aku.WriteString('INJEK2', 'Nama', myINI.ReadString('zwhite', 'Nama', ''));
aku.WriteString('INJEK2', 'Payload', myINI.ReadString('zwhite', 'Payload', ''));
aku.WriteString('INJEK2', 'Proxy', myINI.ReadString('zwhite', 'Proxy', ''));
aku.WriteString('INJEK2', 'Port', myINI.ReadString('zwhite', 'Port', ''));
aku.WriteString('INJEK2', 'r1', myINI.ReadString('zwhite', 'r1', ''));
aku.WriteString('INJEK2', 'rb1', myINI.ReadString('zwhite', 'rb1', ''));
aku.WriteString('INJEK2', 'ra1', myINI.ReadString('zwhite', 'ra1', ''));
aku.WriteString('INJEK2', 'r2', myINI.ReadString('zwhite', 'r2', ''));
aku.WriteString('INJEK2', 'rb2', myINI.ReadString('zwhite', 'rb2', ''));
aku.WriteString('INJEK2', 'ra2', myINI.ReadString('zwhite', 'ra2', ''));
aku.WriteString('INJEK2', 'r3', myINI.ReadString('zwhite', 'r3', ''));
aku.WriteString('INJEK2', 'rb3', myINI.ReadString('zwhite', 'rb3', ''));
aku.WriteString('INJEK2', 'ra3', myINI.ReadString('zwhite', 'ra3', ''));

end
else
begin
//lineberikutnya
        if slistbox1.Items.Strings[2] = '----------------------------' then
begin
//addline2
aku.WriteString('INJEK3', 'Nama', myINI.ReadString('zwhite', 'Nama', ''));
aku.WriteString('INJEK3', 'Payload', myINI.ReadString('zwhite', 'Payload', ''));
aku.WriteString('INJEK3', 'Proxy', myINI.ReadString('zwhite', 'Proxy', ''));
aku.WriteString('INJEK3', 'Port', myINI.ReadString('zwhite', 'Port', ''));
aku.WriteString('INJEK3', 'r1', myINI.ReadString('zwhite', 'r1', ''));
aku.WriteString('INJEK3', 'rb1', myINI.ReadString('zwhite', 'rb1', ''));
aku.WriteString('INJEK3', 'ra1', myINI.ReadString('zwhite', 'ra1', ''));
aku.WriteString('INJEK3', 'r2', myINI.ReadString('zwhite', 'r2', ''));
aku.WriteString('INJEK3', 'rb2', myINI.ReadString('zwhite', 'rb2', ''));
aku.WriteString('INJEK3', 'ra2', myINI.ReadString('zwhite', 'ra2', ''));
aku.WriteString('INJEK3', 'r3', myINI.ReadString('zwhite', 'r3', ''));
aku.WriteString('INJEK3', 'rb3', myINI.ReadString('zwhite', 'rb3', ''));
aku.WriteString('INJEK3', 'ra3', myINI.ReadString('zwhite', 'ra3', ''));


end
else
begin
//lineberikutnya
if slistbox1.Items.Strings[3] = '----------------------------' then
begin
//addline3
aku.WriteString('INJEK4', 'Nama', myINI.ReadString('zwhite', 'Nama', ''));
aku.WriteString('INJEK4', 'Payload', myINI.ReadString('zwhite', 'Payload', ''));
aku.WriteString('INJEK4', 'Proxy', myINI.ReadString('zwhite', 'Proxy', ''));
aku.WriteString('INJEK4', 'Port', myINI.ReadString('zwhite', 'Port', ''));
aku.WriteString('INJEK4', 'r1', myINI.ReadString('zwhite', 'r1', ''));
aku.WriteString('INJEK4', 'rb1', myINI.ReadString('zwhite', 'rb1', ''));
aku.WriteString('INJEK4', 'ra1', myINI.ReadString('zwhite', 'ra1', ''));
aku.WriteString('INJEK4', 'r2', myINI.ReadString('zwhite', 'r2', ''));
aku.WriteString('INJEK4', 'rb2', myINI.ReadString('zwhite', 'rb2', ''));
aku.WriteString('INJEK4', 'ra2', myINI.ReadString('zwhite', 'ra2', ''));
aku.WriteString('INJEK4', 'r3', myINI.ReadString('zwhite', 'r3', ''));
aku.WriteString('INJEK4', 'rb3', myINI.ReadString('zwhite', 'rb3', ''));
aku.WriteString('INJEK4', 'ra3', myINI.ReadString('zwhite', 'ra3', ''));




end
else
begin
//lineberikutnya
    if slistbox1.Items.Strings[4] = '----------------------------' then
begin
//addline4
aku.WriteString('INJEK5', 'Nama', myINI.ReadString('zwhite', 'Nama', ''));
aku.WriteString('INJEK5', 'Payload', myINI.ReadString('zwhite', 'Payload', ''));
aku.WriteString('INJEK5', 'Proxy', myINI.ReadString('zwhite', 'Proxy', ''));
aku.WriteString('INJEK5', 'Port', myINI.ReadString('zwhite', 'Port', ''));
aku.WriteString('INJEK5', 'r1', myINI.ReadString('zwhite', 'r1', ''));
aku.WriteString('INJEK5', 'rb1', myINI.ReadString('zwhite', 'rb1', ''));
aku.WriteString('INJEK5', 'ra1', myINI.ReadString('zwhite', 'ra1', ''));
aku.WriteString('INJEK5', 'r2', myINI.ReadString('zwhite', 'r2', ''));
aku.WriteString('INJEK5', 'rb2', myINI.ReadString('zwhite', 'rb2', ''));
aku.WriteString('INJEK5', 'ra2', myINI.ReadString('zwhite', 'ra2', ''));
aku.WriteString('INJEK5', 'r3', myINI.ReadString('zwhite', 'r3', ''));
aku.WriteString('INJEK5', 'rb3', myINI.ReadString('zwhite', 'rb3', ''));
aku.WriteString('INJEK5', 'ra3', myINI.ReadString('zwhite', 'ra3', ''));



end
else
begin
//lineberikutnya
if slistbox1.Items.Strings[5] = '----------------------------' then
begin
//addline5

aku.WriteString('INJEK6', 'Nama', myINI.ReadString('zwhite', 'Nama', ''));
aku.WriteString('INJEK6', 'Payload', myINI.ReadString('zwhite', 'Payload', ''));
aku.WriteString('INJEK6', 'Proxy', myINI.ReadString('zwhite', 'Proxy', ''));
aku.WriteString('INJEK6', 'Port', myINI.ReadString('zwhite', 'Port', ''));
aku.WriteString('INJEK6', 'r1', myINI.ReadString('zwhite', 'r1', ''));
aku.WriteString('INJEK6', 'rb1', myINI.ReadString('zwhite', 'rb1', ''));
aku.WriteString('INJEK6', 'ra1', myINI.ReadString('zwhite', 'ra1', ''));
aku.WriteString('INJEK6', 'r2', myINI.ReadString('zwhite', 'r2', ''));
aku.WriteString('INJEK6', 'rb2', myINI.ReadString('zwhite', 'rb2', ''));
aku.WriteString('INJEK6', 'ra2', myINI.ReadString('zwhite', 'ra2', ''));
aku.WriteString('INJEK6', 'r3', myINI.ReadString('zwhite', 'r3', ''));
aku.WriteString('INJEK6', 'rb3', myINI.ReadString('zwhite', 'rb3', ''));
aku.WriteString('INJEK6', 'ra3', myINI.ReadString('zwhite', 'ra3', ''));


end
else
begin
showmessage('Slot Penuh, Delete dolo');
end;

end;

end;

end;

end;

end;

end;
//reload profile
getprofileinjek;

end;
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if FileExists('C:\Program Files\Proxifier\proxifier.exe') = false then
begin
showmessage('wow');
end;

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
showmessage(r1+rb1+ra1);
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
 downText.Caption := FormatFloat('##0.## KB/s',download/1024);
  uploadText.Caption := FormatFloat('##0.## KB/s',upload/1024);
  download := 0;
  upload := 0;
  TDText.Caption:=FormatFloat('##0.## MB',TD/1048576);
  TUText.Caption:=FormatFloat('##0.## MB',TU/1048576);
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
ipsb:=GetIPAddress();
spanel4.Caption:=namasb+'@'+ipsb+' || '+statuss+' || '+statusi
end;

end.
