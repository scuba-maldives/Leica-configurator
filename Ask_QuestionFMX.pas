unit Ask_QuestionFMX;

interface

uses
  arrays, Constants, customFMX, Data.Bind.Components, Data.Bind.Grid, FandPs,
  FMX.ComboEdit, FMX.Controls, FMX.Controls.Presentation, FMX.Dialogs, 
  FMX.DialogService, FMX.Edit, FMX.ExtCtrls, FMX.Forms, FMX.Graphics, FMX.Grid, 
  FMX.Layouts, FMX.ListBox, FMX.Memo, FMX.StdCtrls, FMX.Text, FMX.Types, 
  MyTypes, Quick.Logger, Quick.Logger.Provider.Files, ShowWheelsFMX,
  System.Classes, System.SysUtils, System.Types, System.UITypes, FMX.Memo.Types,
  FMX.ScrollBox;

type
    TAsk = class(TForm)
    Advice: TLabel;
    OK_Button: TButton;
    Cancel_Button: TButton;
    Memo1: TMemo;
    procedure OK_ButtonClick(Sender: TObject);
    procedure Cancel_ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ask: TAsk;

implementation

USES  Main_FormFMX, Common_Parameters, Camera_Parameters;

{$R *.FMX}

procedure TAsk.Cancel_ButtonClick(Sender: TObject);
begin
    Field_Changed := False;
    Ask.Close;
end;

procedure TAsk.FormActivate(Sender: TObject);
begin
     Memo1.Text := str;
end;

procedure TAsk.FormCreate(Sender: TObject);
begin
    Memo1.Text := str;
end;

procedure TAsk.OK_ButtonClick(Sender: TObject);
begin


      Answer:= QuestionChanges('Are you sure you wish to overwrite the Name?');

        begin
          if Answer = 'true' Then
            Begin
                 Field_Changed := True;
                 str := '';
                 Ask.Close;
            End

          else
            Field_Changed := False;
            str := '';
        end;


end;

end.
