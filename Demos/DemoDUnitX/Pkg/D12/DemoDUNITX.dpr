program DemoDUNITX;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}


uses
  Glv.Testing.App,
  Demo.FakeTest in '..\..\Src\Demo.FakeTest.pas';

begin
  Glv.Testing.App.Run();
end.
