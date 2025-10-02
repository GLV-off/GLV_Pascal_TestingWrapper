unit Glv.Testing.FPUnitAppWrapper;

{$I 'glv_test_cross.inc'}
{$M+}

interface

uses
  Glv.Testing.AppWrapper;

type
  TFPUnitTestApp = class(TTestApp)
  strict private
    FName: UnicodeString;
  strict protected
    function GetName: UnicodeString; override;
    procedure SetName(const AName: UnicodeString); override;
  public
    constructor Create(const AName: UnicodeString);
    destructor Destroy; override;
    procedure Run; override;
  end;

implementation

uses
  Classes,
  consoletestrunner,
  glvtestcross;

type
  TMyTestRunner = class(TTestRunner)
  protected
  end;

  
constructor TFPUnitTestApp.Create;
begin
  inherited Create;
  FName := '';
end;

destructor TFPUnitTestApp.Destroy;
begin
  FName := '';
  inherited Destroy;
end;

procedure TFPUnitTestApp.Run;
var
  Application: TMyTestRunner;
begin
  DefaultRunAllTests := True;
  DefaultFormat := fPlain;
  Application := TMyTestRunner.Create(nil);
  try
    Application.Initialize();
    if FName <> '' then
      Application.Title := UTF8Encode(FName)
    else
      Application.Title := 'Testing runner';
    Application.Run();
  finally
    Application.Free();
  end;
end;

function TFPUnitTestApp.GetName: UnicodeString;
begin
  Result := FName;
end;

procedure TFPUnitTestApp.SetName(const AName: UnicodeString);
begin
  FName := AName;
end;

end.

