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

procedure TFakeTestCase.TestHookUp;
begin
  Fail('Напишите ваш тест');
end;

procedure TFakeTestCase.SetUp;
begin

end;

procedure TFakeTestCase.TearDown;
begin

end;

initialization

CrossRegTest(TFakeTestCase);

end.

