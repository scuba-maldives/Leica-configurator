unit With_ProgFMX;

interface

uses
  Data.Bind.Components, Data.Bind.Grid, FMX.Controls, 
  FMX.Controls.Presentation, FMX.Dialogs, FMX.Edit, FMX.Forms, FMX.Graphics, 
  FMX.Grid, FMX.Layouts, FMX.ListBox, FMX.Memo, FMX.StdCtrls, FMX.Text, 
  FMX.Types, System.Classes, System.Notification, System.SysUtils, 
  System.Types, System.UITypes, System.Variants;


type
    TWith_Prog = class(TForm)
    NewStaticText: TLabel;
    NewStaticText1: TLabel;
    NewStaticText2: TLabel;
    NewStaticText3: TLabel;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  With_Prog1: TWith_Prog;

implementation

{$R *.FMX}
{$R *.Macintosh.fmx MACOS}

end.
