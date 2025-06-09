{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit GlvTestCross;

{$warn 5023 off : no warning about unused units}
interface

uses
  Glv.Testing.Cross, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('GlvTestCross', @Register);
end.
