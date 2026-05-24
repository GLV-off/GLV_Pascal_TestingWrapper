unit Demo.TestCase;

{$I 'demo.inc'}

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
  Assert.IsTrue(true, 'this is IsTrue as');
  Assert.IsFalse(false, '');
  Assert.AreEqual(1, 1);
end;

initialization

CrossRegTest(TFakeTestCase, 'Unit');

end.

