unit SplashscreenFMX;

interface

uses
  Data.Bind.Components, Data.Bind.Grid, FMX.Controls, FMX.Dialogs, 
  FMX.ExtCtrls, FMX.Forms, FMX.Graphics, FMX.Objects, FMX.Types, 
  System.Classes, System.SysUtils, System.Types, System.UITypes, 
  System.Variants, FMX.StdCtrls;

type
  TSplash = class(TForm)
    ImageControl1: TImageControl;

  procedure FormShow(Sender: TObject);

    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    Completed: Boolean;
  end;

var
  Splash: TSplash;

implementation

{$R *.FMX}

  procedure TSplash.FormCreate(Sender: TObject);
begin
   //Showmessage('Splash Screen Started');
end;

procedure TSplash.FormShow(Sender: TObject);
  begin
//    OnShow := nil;
//    Completed := False;
//    Timer1.Enabled := True;
//    Showmessage('Timer Started');
  end;



  end.




