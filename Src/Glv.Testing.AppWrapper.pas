unit Glv.Testing.AppWrapper;

{$I 'glv_test_cross.inc'}
{$M+}

interface

type
  TTestApp = class(TInterfacedObject)
  public
    procedure Run; virtual; abstract;
  end;

  TTestAppClass = class of TTestApp;

implementation

end.
