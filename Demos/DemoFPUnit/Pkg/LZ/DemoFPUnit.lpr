program DemoFPUnit;

{$IFDEF FPC}
{$MODE DELPHI}{$H+}{$M+}
{$ENDIF FPC}
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
