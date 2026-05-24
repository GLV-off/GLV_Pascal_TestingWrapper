unit Demo.FakeTest;

{$I 'demo.inc'}

interface

uses
  Glv.Testing.Cross;

type
  [Category('Unit')]
  [TestFixture('FakeTest')]
  TFakeTest = class(TCrossTestCase)
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure Test1;

    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('TestA','1,2')]
    [TestCase('TestB','3,4')]
    procedure Test2(const AValue1 : Integer;const AValue2 : Integer);
  end;

implementation

procedure TFakeTest.Setup;
begin
end;

procedure TFakeTest.TearDown;
begin
end;

procedure TFakeTest.Test1;
begin
end;

procedure TFakeTest.Test2(const AValue1 : Integer;const AValue2 : Integer);
begin
end;

initialization

CrossRegTest(TFakeTest, 'Unit');

end.
