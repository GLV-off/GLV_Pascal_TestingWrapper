unit Glv.Testing.FPUnitAppWrapper;

{$I 'glv_test_cross.inc'}
{$M+}

interface

uses
  Glv.Testing.AppWrapper;

type
  TFPUnitTestApp = class(TTestApp)
  public
    procedure Run; override;
  end;

implementation

uses
  Classes,
  consoletestrunner,
  //Demo.TestCase,
  glvtestcross;

type

  { TMyTestRunner }

  TMyTestRunner = class(TTestRunner)
  protected
  // override the protected methods of TTestRunner to customize its behavior
  end;


procedure TFPUnitTestApp.Run;


var
  Application: TMyTestRunner;

begin
  DefaultRunAllTests:=True;
  DefaultFormat:=fPlain;
  Application := TMyTestRunner.Create(nil);
  Application.Initialize;
  Application.Title := 'FPCUnit Console test runner';
  Application.Run;
  Application.Free;
  ReadlN;
end;

end.

