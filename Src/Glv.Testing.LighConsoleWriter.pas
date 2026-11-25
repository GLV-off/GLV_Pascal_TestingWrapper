unit Glv.Testing.LighConsoleWriter;

{$I 'glv_test_cross.inc'}

interface

uses
  SysUtils,
  Classes,
  fpcunit,
  consoletestrunner,
  fpcunitreport,
  plaintestreport;

type
  { Custom writer in console }
  TLightResultsWriter = class(TCustomResultsWriter)
  strict private
    procedure SkipLvl(var f: Text; const InLvl: Integer);
  protected
    procedure SetSkipAddressInfo(AValue: Boolean); override;
    procedure SetSparse(AValue: Boolean); override;

    procedure WriteTestHeader(ATest: TTest; ALevel: integer; ACount: integer); override;
    procedure WriteTestFooter(ATest: TTest; ALevel: integer; ATiming: TDateTime); override;

    procedure WriteSuiteHeader(ATestSuite: TTestSuite; ALevel: integer); override;

    procedure WriteSuiteFooter(ATestSuite: TTestSuite; ALevel: integer;
      ATiming: TDateTime; ANumRuns: integer; ANumErrors: integer;
      ANumFailures: integer; ANumIgnores: integer); override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;
    procedure WriteHeader; override;
    procedure WriteResult(aResult: TTestResult); override;
  end;

implementation

procedure TLightResultsWriter.SkipLvl(var f: Text; const InLvl: Integer);
var
  I: Integer;
begin
  for I := 0 to InLvl - 1 do
    Write(f, ' ');
end;

procedure TLightResultsWriter.SetSkipAddressInfo(AValue: Boolean);
begin
  //inherited SetSkipAddressInfo(AValue);
end;

procedure TLightResultsWriter.SetSparse(AValue: Boolean);
begin
  inherited SetSparse(AValue);
end;

procedure TLightResultsWriter.WriteTestHeader(ATest: TTest; ALevel: integer;
  ACount: integer);
var
  F: Text;
begin
  System.Assign(f, FileName);
  ReWrite(F);
  SkipLvl(F, ALevel);
  WriteLn(F, 'WriteTestHeader: CN = ', ATest.CountTestCases, ',TN = ',
    ATest.TestName, ', LVL=', ALevel, ', C=', ACount);
  Close(F);
end;

procedure TLightResultsWriter.WriteTestFooter(ATest: TTest; ALevel: integer;
  ATiming: TDateTime);
//var
//  f: text;
begin
  //system.Assign(f, FileName);
  //rewrite(f);
  //SkipLvl(f, ALevel);
  //writeln(f, 'WriteTestFooter: LVL=', ALevel, ', Timing=', DateTimeToStr(ATiming));
  //close(f);
end;

procedure TLightResultsWriter.WriteSuiteHeader(ATestSuite: TTestSuite;
  ALevel: integer);
var
  f: text;
begin
  System.Assign(f, FileName);
  rewrite(f);
  SkipLvl(f, ALevel);

  //Write(f, ATestSuite.TestSuiteName);
  //ATestSuite.TestName:=;
  writeln(f, 'WriteSuiteHeader: TN = ', ATestSuite.TestName, ',LVL=', ALevel);
  close(f);
end;

procedure TLightResultsWriter.WriteSuiteFooter(ATestSuite: TTestSuite;
  ALevel: integer; ATiming: TDateTime; ANumRuns: integer; ANumErrors: integer;
  ANumFailures: integer; ANumIgnores: integer);
var
  f: text;
begin
  system.Assign(f, FileName);
  rewrite(f);
  SkipLvl(f, ALevel);
  writeln(f, 'WriteSuiteFooter -- here');
  close(f);
end;

constructor TLightResultsWriter.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
end;

destructor TLightResultsWriter.Destroy;
begin
  inherited Destroy;
end;

procedure TLightResultsWriter.WriteHeader;
var
  f: text;
begin
  system.Assign(f, FileName);
  rewrite(f);
  writeln(f, 'Tests');
  close(f);
end;

procedure TLightResultsWriter.WriteResult(aResult: TTestResult);
var
  f: text;
begin
  system.Assign(f, FileName);
  rewrite(f);
  writeln(f, 'start testing report');
  //aResult.
  close(f);
end;

end.

