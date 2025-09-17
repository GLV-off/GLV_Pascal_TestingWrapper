unit Glv.Testing.App;

{$I 'glv_test_cross.inc'}
{$M+}

interface

uses
  Glv.Testing.AppWrapper;

function CreateApp(const AAppID: UnicodeString): TTestApp;

implementation

uses
  SysUtils,
  StrUtils
{$IFDEF DUNITX}
  ,Glv.Testing.DunitXAppWrapper;
{$ELSE DUNITX}
  ;
{$ENDIF DUNITX}

type
  TUnimplementedTestApp = class(TTestApp)
  public
    procedure Run; override;
  end;

function CreateApp(const AAppID: UnicodeString): TTestApp;
const
  IDS: TArray<UnicodeString> = ['dunitx'];
var
  CL: TTestAppClass;
  TmpAppID: UnicodeString;
begin
  TmpAppID := LowerCase(AAppID);
  case IndexStr(TmpAppID, IDS) of
{$IFDEF DUNITX}
    00: CL := TDUnitXTestApp;
{$ELSE DUNITX}
    00: CL := TUnimplementedTestApp;
{$ENDIF DUNITX}
    else CL := TUnimplementedTestApp;
  end;
  Result := CL.Create;
end;

{ TUnimplementedTestApp }

procedure TUnimplementedTestApp.Run;
begin
  WriteLn('Not implemented app type!');
  ReadLn;
end;

end.
