{
  Модуль:      Glv.Testing.AttributesWrapper
  Описание:
  Разработчик:
  Изменения:
}
unit Glv.Testing.AttributesWrapper;

{$I 'glv_test_cross.inc'}
{$M+}

interface

uses
  SysUtils,

  Classes;

type
{$IFDEF FPC}
  TCustomAttribute = class
  end;

{$ENDIF FPC}


  TestAttribute = class(TCustomAttribute)
  public
    constructor Create(const AText: string);
  end;

  TestFixtureAttribute = class(TCustomAttribute)
  public
    constructor Create(const AText: string);
  end;

  CategoryAttribute = class(TCustomAttribute)
  public
    constructor Create(const AText: string);
  end;

  SetupAttribute = class(TCustomAttribute)
  public
  end;

  TeardownAttribute = class(TCustomAttribute)
  public
  end;

  IgnoreAttribute = class(TCustomAttribute)
  public
    constructor Create(const AText: string);
  end;

implementation

{ TestAttribute }

constructor TestAttribute.Create(const AText: string);
begin
end;

{ TestFixtureAttribute }

constructor TestFixtureAttribute.Create(const AText: string);
begin

end;

{ IgnoreAttribute }

constructor IgnoreAttribute.Create(const AText: string);
begin

end;

{ CategoryAttribute }

constructor CategoryAttribute.Create(const AText: string);
begin

end;

end.
