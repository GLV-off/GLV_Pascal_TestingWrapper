unit Glv.Testing.App;

{$I 'glv_test_cross.inc'}
{$M+}

interface

procedure Run;

implementation

uses
  SysUtils,
  StrUtils,
  Glv.Testing.AppWrapper
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

procedure Run;
var
  CL: TTestAppCLass;
  A: TTestApp;
begin
{$IFDEF DUNITX}
  CL := TDUnitXTestApp;
{$ELSE DUNITX}
  CL := TUnimplementedTestApp;
{$ENDIF DUNITX}

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
