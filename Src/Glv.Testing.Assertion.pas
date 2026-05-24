unit Glv.Testing.Assertion;

{$I 'glv_test_cross.inc'}

interface

type
  TAssertWrapper = class
  public
    class procedure IsTrue(const AValue: Boolean; const AMsg: string = ''); static;
    class procedure IsFalse(const AValue: Boolean; const AMsg: string = ''); static;
    class procedure AreEqual(const AExpected, AActual: Int64; const AMsg: string = ''); static; overload;
    class procedure AreEqual(const AExpected, AActual: UnicodeString; const AMsg: string = ''); static; overload;
  end;

implementation

uses
  FpcUnit;

class procedure TAssertWrapper.IsTrue(const AValue: Boolean; const AMsg: string = '');
begin
  TAssert.CheckTrue(AValue, AMsg);
end;

class procedure TAssertWrapper.IsFalse(const AValue: Boolean; const AMsg: string = '');
begin
  TAssert.CheckFalse(AValue, AMsg);
end;

class procedure TAssertWrapper.AreEqual(const AExpected, AActual: Int64; const AMsg: string);
begin
  TAssert.CheckEquals(AExpected, AActual, AMsg);
end;

class procedure TAssertWrapper.AreEqual(const AExpected, AActual: UnicodeString; const AMsg: string);
begin
  TAssert.CheckEquals(AExpected, AActual, AMsg);
end;

end.

