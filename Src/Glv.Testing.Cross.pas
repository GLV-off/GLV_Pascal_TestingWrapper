{
  ������:      Glv.Testing.Cross
  ��������:
  �����������:
  ���������:
}
unit Glv.Testing.Cross;

{$I 'glv_test_cross.inc'}
{$M+}

interface

uses
{$IFDEF FPC}
  Glv.Testing.AttributesWrapper,
  FpcUnit,
  TestRegistry;
{$ELSE FPC}
{$IFDEF DUNITX}
  DUnitX.TestFramework;
{$ELSE DUNITX}
  Glv.Testing.AttributesWrapper,
  TestFramework;
{$ENDIF DUNITX}

{$ENDIF FPC}

type

{$IFNDEF DUNITX}
{$IFNDEF FPC}
  Assert = Glv.Testing.Assertion.TAssertWrapper;
  TestAttribute = Glv.Testing.AttributeWrapper.TestAttribute;
  TestFixtureAttribute = Glv.Testing.AttributeWrapper.TestFixtureAttribute;
  CategoryAttribute = Glv.Testing.AttributeWrapper.CategoryAttribute;
  SetupAttribute = Glv.Testing.AttributeWrapper.SetupAttribute;
  TeardownAttribute = Glv.Testing.AttributeWrapper.TeardownAttribute;
  IgnoreAttribute = Glv.Testing.AttributeWrapper.IgnoreAttribute;
{$ENDIF FPC}
{$ELSE DUNITX}
  Assert = DUnitX.Assert;
  TestAttribute = DUnitX.TestFramework.TestAttribute;
  TestFixtureAttribute = DUnitX.TestFramework.TestFixtureAttribute;
  CategoryAttribute = DUnitX.TestFramework.CategoryAttribute;
  SetupAttribute = DUnitX.TestFramework.SetupAttribute;
  TeardownAttribute = DUnitX.TestFramework.TeardownAttribute;
  IgnoreAttribute = DUnitX.TestFramework.IgnoreAttribute;
{$ENDIF DUNITX}

{$IFNDEF DUNITX}
{$IFDEF FPC}
  TCrossTestCase = TTestCase;
  TCrossTestCaseClass = class of TTestCase;
{$ELSE FPC}
  TCrossTestCase = TTestCase;
  TCrossTestCaseClass = class of TTestCase;
{$ENDIF FPC}
{$ELSE DUNITX}
  TSimpleTestCase = class(TObject)
  protected
    procedure SetUp; virtual;
    procedure TearDown; virtual;
  public
    procedure CheckTrue(const AExpr: Boolean; const AMsg: string = '');
    procedure CheckFalse(const AExpr: Boolean; const AMsg: string = '');
    procedure CheckEquals(const AExpected, AActual: UnicodeString; const AMsg: string = ''); overload;
    procedure CheckEquals(const AExpected, AActual: Int64; const AMsg: string = ''); overload;
    procedure CheckEquals(const AExpected, AActual: Integer; const AMsg: string = ''); overload;
    procedure CheckNotNull(const AObj: TObject; const AMSg: UnicodeString = '');
    procedure CheckNull(const AObj: TObject; const AMSg: UnicodeString = '');
    procedure Fail(const AMsg: string);
  end;

  TCrossTestCase = TSimpleTestCase;

  TCrossTestCaseClass = class of TCrossTestCase;

{$ENDIF DUNITX}

procedure CrossRegTest(const ClassOfTest: TCrossTestCaseClass; const Subpath: string = '');

implementation

procedure CrossRegTest(const ClassOfTest: TCrossTestCaseClass; const Subpath: string);
begin
{$IFDEF FPC}
  RegisterTest(Subpath, ClassOfTest);
{$ELSE FPC}
{$IFDEF DUNITX}
  TDUnitx.RegisterTestFixture(ClassOfTest, Subpath);
{$ELSE DUNITX}
  RegisterTest(ClassOfTest.Suite);
{$ENDIF DUNITX}
{$ENDIF FPC}
end;

{$IFDEF DUNITX}

{ TSimpleTestCase }

procedure TSimpleTestCase.Setup;
begin
end;

procedure TSimpleTestCase.TearDOwn;
begin
end;

procedure TSimpleTestCase.CheckNotNull(const AObj: TObject;
  const AMSg: UnicodeString);
begin
  ASsert.IsNotNull(AObj, AMsg);
end;

procedure TSimpleTestCase.CheckNull(const AObj: TObject;
  const AMSg: UnicodeString);
begin
  Assert.IsNull(AObj, AMsg);
end;

procedure TSimpleTestCase.CheckTrue(const AExpr: Boolean; const AMsg: string);
begin
  Assert.IsTrue(AExpr, AMsg);
end;

procedure TSimpleTestCase.Fail(const AMsg: string);
begin
  ASsert.Fail(AMsg);
end;

procedure TSimpleTestCase.CheckEquals(const AExpected, AActual: UnicodeString;
  const AMsg: string);
begin
  Assert.AreEqual(AExpected, AActual, AMsg);
end;

procedure TSimpleTestCase.CheckEquals(const AExpected, AActual: Int64;
  const AMsg: string);
begin
  Assert.AreEqual(AExpected, AActual, AMsg);
end;

procedure TSimpleTestCase.CheckEquals(const AExpected, AActual: Integer;
  const AMsg: string);
begin
  Assert.AreEqual(AExpected, AActual, AMsg);
end;

procedure TSimpleTestCase.CheckFalse(const AExpr: Boolean; const AMsg: string);
begin
  Assert.IsFalse(AExpr, AMsg);
end;

{$ENDIF DUNITX}

end.
