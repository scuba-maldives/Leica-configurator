unit ShowWheelsFMX;

interface

uses
  Camera_Parameters, Data.Bind.Components, Data.Bind.Grid, DisplayArrayFMX,
  FMX.Controls, FMX.Controls.Presentation, FMX.Dialogs, FMX.Edit, FMX.Forms, 
  FMX.Graphics, FMX.Grid, FMX.Grid.Style, FMX.Layouts, FMX.ListBox, FMX.Memo, 
  FMX.ScrollBox, FMX.StdCtrls, FMX.Text, FMX.Types, System.Classes, 
  System.Notification, System.Rtti, System.SysUtils, System.Types, 
  System.UITypes, System.Variants;

type
    TDialsForm = class(TForm)
    RightGrid: TStringGrid;
    BackGrid: TStringGrid;
    LeftGrid: TStringGrid;
    Photo_Film3: TLabel;
    Label10: TLabel;
    Button: TSwitch;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
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

    procedure FormCreate(Sender: TObject);
    procedure LeftGridSelectCell(Sender: TObject; ACol, ARow: LongInt;

    var CanSelect: Boolean);
    procedure RightGridDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure BackGridDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure LeftGridDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure BackGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure RightGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure ButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DialsForm: TDialsForm;

implementation

{$R *.FMX}

USES  Constants, arrays, DecodeFMX;

procedure TDialsForm.ButtonClick(Sender: TObject);

var i,j : integer;

begin
    if Button.IsChecked = True  then
         begin
          Photo_Film3.Text := 'Video';                                       // Populate String Arrays

          for i:= 1 to 7   do
            begin

              LeftGrid.Cells[i, P] := (Wheel_Text_Full[LeftDial_Video_Value[i-1,P]]);
              BackGrid.Cells[i, P] := (Wheel_Text_Full[RearDial_Video_Value[i-1,P]]);
              RightGrid.Cells[i, P] := (Wheel_Text_Full[RightDial_Video_Value[i-1,P]]);

              LeftGrid.Cells[i, A] := (Wheel_Text_Full[LeftDial_Video_Value[i-1,A]]);
              BackGrid.Cells[i, A] := (Wheel_Text_Full[RearDial_Video_Value[i-1,A]]);
              RightGrid.Cells[i, A] := (Wheel_Text_Full[RightDial_Video_Value[i-1,A]]);

              LeftGrid.Cells[i, S] := (Wheel_Text_Full[LeftDial_Video_Value[i-1,S]]);
              BackGrid.Cells[i, S] := (Wheel_Text_Full[RearDial_Video_Value[i-1,S]]);
              RightGrid.Cells[i, S] := (Wheel_Text_Full[RightDial_Video_Value[i-1,S]]);

              LeftGrid.Cells[i, M] := (Wheel_Text_Full[LeftDial_Video_Value[i-1,M]]);
              BackGrid.Cells[i, M] := (Wheel_Text_Full[RearDial_Video_Value[i-1,M]]);
              RightGrid.Cells[i, M] := (Wheel_Text_Full[RightDial_Video_Value[i-1,M]]);

              end;

         end

    else
       if Button.IsChecked = False  then
         begin
          Photo_Film3.Text := 'Photo';                                       // Populate String Arrays

            for i:= 1 to 7   do
            begin

            LeftGrid.Cells[i, P] := (Wheel_Text_Full[LeftDial_Photo_Value[i-1,P]]);
            BackGrid.Cells[i, P] := (Wheel_Text_Full[RearDial_Photo_Value[i-1,P]]);
            RightGrid.Cells[i, P] := (Wheel_Text_Full[RightDial_Photo_Value[i-1,P]]);

            LeftGrid.Cells[i, A] := (Wheel_Text_Full[LeftDial_Photo_Value[i-1,A]]);
            BackGrid.Cells[i, A] := (Wheel_Text_Full[RearDial_Photo_Value[i-1,A]]);
            RightGrid.Cells[i, A] := (Wheel_Text_Full[RightDial_Photo_Value[i-1,A]]);

            LeftGrid.Cells[i, S] := (Wheel_Text_Full[LeftDial_Photo_Value[i-1,S]]);
            BackGrid.Cells[i, S] := (Wheel_Text_Full[RearDial_Photo_Value[i-1,S]]);
            RightGrid.Cells[i, S] := (Wheel_Text_Full[RightDial_Photo_Value[i-1,S]]);

            LeftGrid.Cells[i, M] := (Wheel_Text_Full[LeftDial_Photo_Value[i-1,M]]);
            BackGrid.Cells[i, M] := (Wheel_Text_Full[RearDial_Photo_Value[i-1,M]]);
            RightGrid.Cells[i, M] := (Wheel_Text_Full[RightDial_Photo_Value[i-1,M]]);

              end;


         end;

end;

procedure TDialsForm.FormCreate(Sender: TObject);

var i,j : integer;

    begin

    LeftGrid.visible := LeftDial;
    BackGrid.visible := RearDial;

    //Showmessage('Reached Start of ShowWheels');

      // Setup Headers
        LeftGrid.Columns[0].Header :=  ('Left Dial');
        BackGrid.Columns[0].Header :=  ('BackDial');
        RightGrid.Columns[0].Header :=  ('Right Dial');

        for var N  := 0 to 6 do
        begin
        LeftGrid.Columns[N+1].Header := CustomText[N];
        BackGrid.Columns[N+1].Header := CustomText[N];
        RightGrid.Columns[N+1].Header := CustomText[N];
        end;



          LeftGrid.Cells[0,0] := 'Program';
          BackGrid.Cells[0,0] := 'Program';
          RightGrid.Cells[0,0] := 'Program';

          LeftGrid.Cells[0,1] := 'Aperture';
          BackGrid.Cells[0,1] := 'Aperture';
          RightGrid.Cells[0,1] := 'Aperture';

          LeftGrid.Cells[0,2] := 'Shutter';
          BackGrid.Cells[0,2] := 'Shutter';
          RightGrid.Cells[0,2] := 'Shutter';

          LeftGrid.Cells[0,3] := 'Manual';
          BackGrid.Cells[0,3] := 'Manual';
          RightGrid.Cells[0,3] := 'Manual';

          for i:= 1 to 7   do
          begin

          LeftGrid.Cells[i, P] := (Wheel_Text_Full[LeftDial_Photo_Value[i-1,P]]);
          BackGrid.Cells[i, P] := (Wheel_Text_Full[RearDial_Photo_Value[i-1,P]]);
          RightGrid.Cells[i, P] := (Wheel_Text_Full[RightDial_Photo_Value[i-1,P]]);

          LeftGrid.Cells[i, A] := (Wheel_Text_Full[LeftDial_Photo_Value[i-1,A]]);
          BackGrid.Cells[i, A] := (Wheel_Text_Full[RearDial_Photo_Value[i-1,A]]);
          RightGrid.Cells[i, A] := (Wheel_Text_Full[RightDial_Photo_Value[i-1,A]]);

          LeftGrid.Cells[i, S] := (Wheel_Text_Full[LeftDial_Photo_Value[i-1,S]]);
          BackGrid.Cells[i, S] := (Wheel_Text_Full[RearDial_Photo_Value[i-1,S]]);
          RightGrid.Cells[i, S] := (Wheel_Text_Full[RightDial_Photo_Value[i-1,S]]);

          LeftGrid.Cells[i, M] := (Wheel_Text_Full[LeftDial_Photo_Value[i-1,M]]);
          BackGrid.Cells[i, M] := (Wheel_Text_Full[RearDial_Photo_Value[i-1,M]]);
          RightGrid.Cells[i, M] := (Wheel_Text_Full[RightDial_Photo_Value[i-1,M]]);
          end;




    end;





  procedure TDialsForm.LeftGridDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);

    begin
//      with Sender as TStringgrid do
//      begin
//          if (gdSelected in State) then
//          begin
//              Canvas.Brush.Color := Color;
//              Canvas.Font.Color := Font.Color;
//              Canvas.TextRect(Rect, Rect.Left +2,Rect.Top +2, Cells[Col,Row]);
//          end;
//      end;
    end;

procedure TDialsForm.RightGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
  var CanSelect: Boolean);
    begin
       CanSelect := False
    end;

procedure TDialsForm.BackGridDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
    begin
//      with Sender as TStringgrid do
//      begin
//          if (gdSelected in State) then
//          begin
//              Canvas.Brush.Color := Color;
//              Canvas.Font.Color := Font.Color;
//              Canvas.TextRect(Rect, Rect.Left +2,Rect.Top +2, Cells[Col,Row]);
//          end;
//      end;
    end;

procedure TDialsForm.BackGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    begin
      CanSelect := False
    end;

procedure TDialsForm.RightGridDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
    begin
//        with Sender as TStringgrid do
//        begin
//            if (gdSelected in State) then
//            begin
//                Canvas.Brush.Color := Color;
//                Canvas.Font.Color := Font.Color;
//                Canvas.TextRect(Rect, Rect.Left +2,Rect.Top +2, Cells[Col,Row]);
//            end;
//        end;
    end;

procedure TDialsForm.LeftGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
    var CanSelect: Boolean);
    begin
      CanSelect := False
    end;



end.


