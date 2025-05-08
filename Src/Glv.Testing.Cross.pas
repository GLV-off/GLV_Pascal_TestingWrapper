unit Glv.Testing.Cross;

{$I 'test.inc'}
{$M+}

interface

uses
{$IFDEF FPC}
  FpcUnit,
  TestRegistry;
{$ELSE FPC}
  TestFramework;
{$ENDIF FPC}

type
  TCrossTestCase = TTestCase;
  TCrossTestCaseClass = class of TTestCase;

procedure CrossRegTest(const ClassOfTest: TCrossTestCaseClass; const Subpath: string = '');

implementation

procedure CrossRegTest(const ClassOfTest: TCrossTestCaseClass; const Subpath: string);
begin
{$IFDEF FPC}
  RegisterTest(Subpath, ClassOfTest);
{$ELSE FPC}
  RegisterTest(ClassOfTest.Suite);
{$ENDIF FPC}
end;

end.
