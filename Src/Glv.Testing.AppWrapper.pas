unit Glv.Testing.AppWrapper;

{$I 'glv_test_cross.inc'}
{$M+}

interface

type
  TTestApp = class(TInterfacedObject)
  strict protected
    function GetName: UnicodeString; virtual; abstract;
    procedure SetName(const AName: UnicodeString); virtual; abstract;
  public
    procedure Run; virtual; abstract;
    property Name: UnicodeString read GetName write SetName;
  end;

  TTestAppClass = class of TTestApp;

implementation

end.
