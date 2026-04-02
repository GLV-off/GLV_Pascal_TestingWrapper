unit Demo.TestCase;

{$IFDEF FPC}
{$MODE DELPHI}{$H+}{$M+}
{$ENDIF FPC}

interface

uses
  Classes,
  SysUtils,
  Glv.Testing.Cross;

type

  TFakeTestCase= class(TCrossTestCase)
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestHookUp;
  end;

implementation

procedure TFakeTestCase.SetUp;
begin
end;

procedure TFakeTestCase.TearDown;
begin
end;

procedure TFakeTestCase.TestHookUp;
begin
  Assert.AreEqual('first', 'first', 'Thouse strings not match!');
end;

initialization

CrossRegTest(TFakeTestCase, 'Unit');

end.

