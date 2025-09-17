unit Glv.Testing.App;

{$I 'glv_test_cross.inc'}
{$M+}

interface

procedure Run;

implementation

uses
  SysUtils,
  Glv.Testing.AppWrapper
{$IFDEF DUNITX},Glv.Testing.DunitXAppWrapper{$ENDIF DUNITX}
{$IFDEF FPUNIT},Glv.Testing.FPUnitAppWrapper{$ENDIF FPUNIT}
;
type
  TUnimplementedTestApp = class(TTestApp)
  public
    procedure Run; override;
  end;

procedure Run;
var
  CL: TTestAppCLass;
  A: TTestApp;
begin

{$IFDEF DUNITX}
  CL := TDUnitXTestApp;
{$ELSE}
{$IFDEF FPUNIT}
  CL :=TFPUnitTestApp;
{$ELSE}
  CL := TUnimplementedTestApp;
{$ENDIF}
{$ENDIF}

  A := CL.Create;
  try
    A.Run();
  finally
     FreeAndNil(A);
  end;
end;

{ TUnimplementedTestApp }

procedure TUnimplementedTestApp.Run;
begin
  WriteLn('Not implemented app type!');
  ReadLn;
end;

end.
