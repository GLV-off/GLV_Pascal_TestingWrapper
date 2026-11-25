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
  fpcunitreport,
  plaintestreport,
{$IFDEF WINDOWS}
  WIndows,
{$ENDIF WINDOWS}
  glvtestcross,
  GLV.Testing.LighConsoleWriter;

type
  TMyTestRunner = class(TTestRunner)
  protected
    function GetResultsWriter: TCustomResultsWriter; override;
  end;

function TMyTestRunner.GetResultsWriter: TCustomResultsWriter;
begin
  //case FormatParam of
  //  fPlain:
  //    begin
  //      Result := TLightResultsWriter.Create(nil);
  //      Result.SkipTiming := True;
  //      Result.Sparse := True; { sparce == no exception }
  //      Result.SkipAddressInfo := True;
  //    end;
  //  else Result := inherited GetResultsWriter;
  //end;
  Result := inherited GetResultsWriter;
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
{$IFDEF WINDOWS}
  SetConsoleCP(CP_UTF8);
  SetConsoleOutputCP(CP_UTF8);
{$ENDIF WINDOWS}
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

