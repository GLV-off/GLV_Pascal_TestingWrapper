unit Glv.Testing.Assertion;

{$I 'glv_test_cross.inc'}

interface

type
  TAssertWrapper = class
  public
    class procedure AreEqual(const AExpected, AActual: UnicodeString; const AMsg: string = ''); static;
  end;

implementation

uses
  FpcUnit;

class procedure TAssertWrapper.AreEqual(const AExpected, AActual: UnicodeString; const AMsg: string = ''); static;
begin
  TAssert.CheckEquals(AExpected, AActual, AMsg);
end;

end.

