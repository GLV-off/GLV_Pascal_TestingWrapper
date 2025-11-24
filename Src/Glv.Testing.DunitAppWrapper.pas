unit Glv.Testing.DunitAppWrapper;

{$I 'glv_test_cross.inc'}
{$M+}

interface

uses
  Glv.Testing.AppWrapper;

type
  TDUnitTestApp = class(TTestApp)
  strict protected
    function GetName: UnicodeString; override;
    procedure SetName(const AName: UnicodeString); override;
  public
    procedure Run; override;
  end;

implementation

uses
  SysUtils;
//{$IFDEF TESTINSIGHT}
//  TestInsight.DUnitX,
//{$ELSE}
//  DUnitX.Loggers.Console,
//  DUnitX.Loggers.Xml.NUnit,
//{$ENDIF }
//  DUnitX.TestFramework;

procedure TDUnitTestApp.Run;
begin
  //
end;

function TDUnitTestApp.GetName: UnicodeString;
begin
  Result := '';
end;

procedure TDUnitTestApp.SetName(const AName: UnicodeString);
begin
end;

end.

