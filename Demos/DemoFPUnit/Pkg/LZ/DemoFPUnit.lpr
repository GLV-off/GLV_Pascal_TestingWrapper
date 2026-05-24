program DemoFPUnit;

{$I 'demo.inc'}
{$DEFINE FPUNIT}

uses
  Demo.TestCase,
  Glv.Testing.App;

begin
  Glv.Testing.App.Run;
{$IFDEF DEBUG}
  ReadLn;
{$ENDIF DEBUG}
end.
