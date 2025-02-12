unit ShowProfilesFMX;

interface

uses
  Data.Bind.Components, Data.Bind.Grid, FMX.Controls, 
  FMX.Controls.Presentation, FMX.Dialogs, FMX.Edit, FMX.Forms, FMX.Graphics, 
  FMX.Grid, FMX.Grid.Style, FMX.Layouts, FMX.ListBox, FMX.Memo, FMX.ScrollBox, 
  FMX.StdCtrls, FMX.Text, FMX.Types, System.Classes, System.Notification, 
  System.Rtti, System.SysUtils, System.Types, System.UITypes, System.Variants;

type
  TProfiles = class(TForm)
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Profiles: TProfiles;

implementation

{$R *.FMX}

USES  Main_FormFMX, Constants, Arrays, DecodeFMX, Camera_Parameters;




procedure TProfiles.FormCreate(Sender: TObject);
  begin

      begin

      //Showmessage('Reached Start of Show Profiles');

      // Setup Headers
        StringGrid1.Columns[0].Header :=  ('Film Style');

        for var N  := 0 to 4 do
        begin
        StringGrid1.Columns[N+1].Header := FilmStyle_Text[N];

        end;


        StringGrid1.Cells[0,0] := 'Contrast';
        StringGrid1.Cells[0,1] := 'Sharpness';
        StringGrid1.Cells[0,2] := 'Highlights';
        StringGrid1.Cells[0,3] := 'Shadows';
        StringGrid1.Cells[0,4] := 'Saturation';

      // Fill Grid with Data


            begin

                begin
                StringGrid1.Cells[1, 0] := Search_Array(Contrast0_Value[0],   FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[1, 1] := Search_Array(Sharpness0_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[1, 2] := Search_Array(Highlight0_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[1, 3] := Search_Array(Shadow0_Value[0],     FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[1, 4] := Search_Array(Saturation0_Value[0], FilmStyleSetting_Code, FilmStyleSetting_Text);

                StringGrid1.Cells[2, 0] := Search_Array(Contrast1_Value[0],   FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[2, 1] := Search_Array(Sharpness1_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[2, 2] := Search_Array(Highlight1_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[2, 3] := Search_Array(Shadow1_Value[0],     FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[2, 4] := Search_Array(Saturation1_Value[0], FilmStyleSetting_Code, FilmStyleSetting_Text);

                StringGrid1.Cells[3, 0] := Search_Array(Contrast2_Value[0],   FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[3, 1] := Search_Array(Sharpness2_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[3, 2] := Search_Array(Highlight2_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[3, 3] := Search_Array(Shadow2_Value[0],     FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[3, 4] := Search_Array(Saturation2_Value[0], FilmStyleSetting_Code, FilmStyleSetting_Text);

                StringGrid1.Cells[4, 0] := Search_Array(Contrast3_Value[0],   FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[4, 1] := Search_Array(Sharpness3_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[4, 2] := Search_Array(Highlight3_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[4, 3] := Search_Array(Shadow3_Value[0],     FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[4, 4] := 'Null';

                StringGrid1.Cells[5, 0] := Search_Array(Contrast4_Value[0],   FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[5, 1] := Search_Array(Sharpness4_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[5, 2] := Search_Array(Highlight4_Value[0],  FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[5, 3] := Search_Array(Shadow4_Value[0],     FilmStyleSetting_Code, FilmStyleSetting_Text);
                StringGrid1.Cells[5, 4] := 'Null';

                end;

            end;


      end;

  end;

end.




