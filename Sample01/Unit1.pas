unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPSComponent, uPSCompiler, uPSRuntime, uPSUtils, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    CE: TPSScript;
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure CECompile(Sender: TPSScript);
    procedure CEExecute(Sender: TPSScript);
    procedure Button1Click(Sender: TObject);
    procedure CELine(Sender: TObject);
  private
    { Private declarations }
    procedure MyProc(const Msg: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  MyVar: Integer = 333;

procedure TForm1.MyProc(const Msg: string);
begin
  Memo1.Lines.Append(Msg);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
  Messages: string;
  Compiled: Boolean;
begin
  CE.Script.Text := Memo2.Text;
  Compiled := CE.Compile;
  Memo1.Clear;
  for I := 0 to CE.CompilerMessageCount - 1 do
    Memo1.Lines.Append(CE.CompilerMessages[I].MessageToString + #13#10);
  if Compiled then
    if not CE.Execute then
      Memo1.Lines.Append(CE.ExecErrorToString);
end;

procedure TForm1.CECompile(Sender: TPSScript);
begin
  Sender.AddMethod(Self, @TForm1.MyProc, 'procedure MyProc(const Msg: string);');
  Sender.AddRegisteredPTRVariable('MyVar', 'Integer');
end;

procedure TForm1.CEExecute(Sender: TPSScript);
begin
  Sender.SetPointerToData('MyVar', @MyVar, Sender.FindBaseType(bts32));
end;

procedure TForm1.CELine(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.
