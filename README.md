# GLV Testing wrappers

## What is it

This project contains library for FPC and Delphi projects that need to be compatible at project level. If you have code base that have need to build in FPC and delphi environment and want test it in semi unified way that project aims to solve this problem.

## Hot use

Project sugest use project structure

```
<project with tests>
  pkg
    lz # lazarus
    ct # code typhon
  pkg
    delphi # delphi
  src
    <autotests unit's>.pas
```

All entry point project files *dpr, *lpr *ctp should contain
simple runner execution logic from Glv.Testing.App module.

``` pascal
// 
program Testrunnner;

uses
  Glv.Testing.App,
  My_Test in '..\..\src\My_Test.pas';

begin
  Glv.Testing.App.Run();
end;
```

Module with auto tests sugested structure.

cross.inc - sugesting this file contains cross environment or crossplatform defines

``` pascal
// cross.inc
{$IFDEF FPC}
{$MODE DELPHI}{$H+}
{$ENDIF FPC}
```

``` pascal
unit My_Test;

{$I 'cross.inc'}

interface

uses
  Glv.Testing.Cross;

type
  TMyTest = class(TCrossTestCase)
  published 
    procedure TestSimple;
  end;

implementation

procedure TMyTest.TestSimple;
begin
  Assert.AreEqual(4, 2  + 2, 'This should work!');
end;

initialization

CrossRegTest(TMyTest, 'Unit');

end.
```

Now we have project structure ready for use in Delphi and FPC compatible IDE (Lazarus, Code Typhon).
