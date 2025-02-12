unit ShowButtonsFMX;

interface

uses
  Data.Bind.Components, Data.Bind.Grid, FMX.Controls,
  FMX.Controls.Presentation, FMX.Dialogs, FMX.Edit, FMX.Forms, FMX.Graphics,
  FMX.Grid, FMX.Header, FMX.Layouts, FMX.ListBox, FMX.Memo, FMX.ScrollBox,
  FMX.StdCtrls, FMX.Text, FMX.Types, System.Classes, System.Notification,
  System.Rtti, System.SysUtils, System.Types, System.UITypes, System.Variants,
  FMX.Grid.Style;

// FMX.Grid.Style,

type
    TButtonsForm = class(TForm)
    ButtonGrid4: TStringGrid;
    ButtonGrid3: TStringGrid;
    ButtonGrid9: TStringGrid;
    ButtonGrid20: TStringGrid;
    ButtonGrid10: TStringGrid;
    ButtonGridFn: TStringGrid;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    StringColumn11: TStringColumn;
    StringColumn12: TStringColumn;
    StringColumn13: TStringColumn;
    StringColumn14: TStringColumn;
    StringColumn15: TStringColumn;
    StringColumn16: TStringColumn;
    StringColumn17: TStringColumn;
    StringColumn18: TStringColumn;
    StringColumn19: TStringColumn;
    StringColumn20: TStringColumn;
    StringColumn21: TStringColumn;
    StringColumn22: TStringColumn;
    StringColumn23: TStringColumn;
    StringColumn24: TStringColumn;
    StringColumn25: TStringColumn;
    StringColumn26: TStringColumn;
    StringColumn27: TStringColumn;
    StringColumn28: TStringColumn;
    StringColumn29: TStringColumn;
    StringColumn30: TStringColumn;
    StringColumn31: TStringColumn;
    StringColumn32: TStringColumn;
    StringColumn33: TStringColumn;
    StringColumn34: TStringColumn;
    StringColumn35: TStringColumn;
    StringColumn36: TStringColumn;
    StringColumn37: TStringColumn;
    StringColumn38: TStringColumn;
    StringColumn39: TStringColumn;
    StringColumn40: TStringColumn;
    StringColumn41: TStringColumn;
    StringColumn42: TStringColumn;
    StringColumn43: TStringColumn;
    StringColumn44: TStringColumn;
    StringColumn45: TStringColumn;
    StringColumn46: TStringColumn;
    StringColumn47: TStringColumn;
    StringColumn48: TStringColumn;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;

    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ButtonsForm: TButtonsForm;

implementation

{$R *.FMX}

USES  Main_FormFMX, Constants, Arrays, DecodeFMX, Camera_Parameters;



procedure TButtonsForm.FormCreate(Sender: TObject);

var ColIndex, RowIndex: integer;

    begin

      ButtonGrid3.visible    := Button3v;                                       // Turn on or off dependant on specific camera type
      ButtonGrid4.visible    := Button4v;
      ButtonGrid9.visible    := Button9v;
      ButtonGrid10.visible   := Button10v;
      ButtonGrid20.visible   := Button20v;
      ButtonGridFn.visible   := ButtonFnv;

    // Setup Headers

      //Showmessage('Reached Start of ShowButtons');

      ButtonGrid3.Columns[0].Header := ('Button 3');
      ButtonGrid4.Columns[0].Header := ('Button 4');
      ButtonGrid9.Columns[0].Header := ('Button 9');
      ButtonGrid10.Columns[0].Header := ('Button 10');
      ButtonGrid20.Columns[0].Header := ('Button 20');
      ButtonGridFN.Columns[0].Header := ('Function Button');

      ButtonGrid3.Cells[0,0] := 'Photo';
      ButtonGrid4.Cells[0,0] := 'Photo';
      ButtonGrid9.Cells[0,0] := 'Photo';
      ButtonGrid10.Cells[0,0] := 'Photo';
      ButtonGrid20.Cells[0,0] := 'Photo';
      ButtonGridFn.Cells[0,0] := 'Photo';

      ButtonGrid3.Cells[0,1] := 'Video';
      ButtonGrid4.Cells[0,1] := 'Video';
      ButtonGrid9.Cells[0,1] := 'Video';
      ButtonGrid10.Cells[0,1] := 'Video';
      ButtonGrid20.Cells[0,1] := 'Video';
      ButtonGridFn.Cells[0,1] := 'Video';




      for var N  := 0 to 6 do
      begin
      ButtonGrid3.Columns[N+1].Header:= CustomText[N];;
      ButtonGrid4.Columns[N+1].Header:= CustomText[N];
      ButtonGrid9.Columns[N+1].Header:= CustomText[N];
      ButtonGrid10.Columns[N+1].Header:= CustomText[N];
      ButtonGrid20.Columns[N+1].Header:= CustomText[N];
      ButtonGridFn.Columns[N+1].Header:= CustomText[N];
      end;


    // Fill Grid with Data


        for ColIndex:= 1 to 7   do
          begin
            for RowIndex := 0 to 1  do
              begin
              ButtonGrid3.Cells[ColIndex, RowIndex] := Search_Array(Button3_Value[ColIndex-1,RowIndex],  Button_Code, Button_Text);
              ButtonGrid4.Cells[ColIndex, RowIndex] := Search_Array(Button4_Value[ColIndex-1,RowIndex],  Button_Code, Button_Text);
              ButtonGrid9.Cells[ColIndex, RowIndex] := Search_Array(Button9_Value[ColIndex-1,RowIndex],  Button_Code, Button_Text);
              ButtonGrid10.Cells[ColIndex, RowIndex] := Search_Array(Button10_Value[ColIndex-1,RowIndex],  Button_Code, Button_Text);
              ButtonGrid20.Cells[ColIndex, RowIndex] := Search_Array(Button20_Value[ColIndex-1,RowIndex],  Button_Code, Button_Text);
              ButtonGridFn.Cells[ColIndex, RowIndex] := Search_Array(FnButton_Value[ColIndex-1,RowIndex],  Button_Code, Button_Text);
              end;

          end;


    end;



end.
