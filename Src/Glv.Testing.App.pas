unit Glv.Testing.App;

{$I 'glv_test_cross.inc'}
{$M+}

interface

procedure Run(const AName: UnicodeString = '');

implementation

uses
  SysUtils,
  Glv.Testing.AppWrapper
{$IFDEF DUNITX},Glv.Testing.DunitXAppWrapper{$ENDIF DUNITX}
{$IFDEF FPUNIT},Glv.Testing.FPUnitAppWrapper{$ENDIF FPUNIT}
;
type
  TUnimplementedTestApp = class(TTestApp)
  strict private
    FName: UnicodeString;
  public
    constructor Create(const AName: UnicodeString);
    procedure Run; override;
  end;

procedure Run(const AName: UnicodeString = '');
var
  CL: TTestAppCLass;
  A: TTestApp;
begin
{$IFDEF DUNITX}
  CL := TDUnitXTestApp;
{$ELSE}
{$IFDEF FPUNIT}
  CL := TFPUnitTestApp;
{$ELSE}
  CL := TUnimplementedTestApp;
{$ENDIF}
{$ENDIF}
  A := CL.Create;
  A.Name := AName;
  try
    try
      A.Run();
    except
       on E: Exception do
         WriteLn(E.Classname, ': ', E.Message);
    end;
  finally
     FreeAndNil(A);
  end;
end;

{ TUnimplementedTestApp }

constructor TUnimplementedTestApp.Create(const AName: UnicodeString);
begin
  FName := AName;
end;

procedure TUnimplementedTestApp.Run;
begin
  WriteLn('Not implemented app type with text: [', FName, ']');
end;

end.
