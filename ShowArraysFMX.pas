unit ShowArraysFMX;

interface

uses
  Data.Bind.Components, Data.Bind.Grid, FMX.Controls, 
  FMX.Controls.Presentation, FMX.Dialogs, FMX.Edit, FMX.Forms, FMX.Graphics, 
  FMX.Grid, FMX.Grid.Style, FMX.Layouts, FMX.ListBox, FMX.Memo, FMX.ScrollBox, 
  FMX.StdCtrls, FMX.Text, FMX.Types, MyTypes, System.Classes, System.SysUtils, 
  System.Types, System.UITypes, System.Rtti, FMX.ComboEdit;


type
    TArrays = class(TForm)
    ArrayGrid1: TStringGrid;
    StatusCombo: TComboEdit;
    Label1: TLabel;
    SaveArraysButton: TButton;
    DefaultsButton: TButton;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;

    procedure FormCreate(Sender: TObject);
    procedure FillGridInt(Name : String; const Working_Array: array of Integer);
    procedure FillGridInt7x2(Name : String; const Working_Array: T7x2DIM_Array);
    procedure FillGridInt7x4(Name : String; const Working_Array: T7x4DIM_Array);
    procedure FillGridInt2Dim(Name : String; const Working_Array: T2DIM_Array);
    procedure FillGridStr(Name : String; const Working_Array: array of String);
    procedure StatusComboChange(Sender: TObject);
    procedure StatusComboEnter(Sender: TObject);
    procedure SaveArraysButtonClick(Sender: TObject);
    procedure SaveDefaultsButtonClick(Sender: TObject);
    Procedure Output_Arrays(const Array_Name: array of String);

    Procedure Output_Arrays2(const Array_Name: array of Integer);
    Procedure Output_ArraysFirst(const Array_Name: array of String);

    Procedure Output_Arrays2Dim(const Array_Name: array of T2DIM_Array);
    Procedure Output_Arrays7x2(const Array_Name: array of T7x2DIM_Array);
    Procedure Output_Arrays7x4(const Array_Name: array of T7x4DIM_Array);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Arrays1: TArrays;
  var iRow : integer;
  var sArray_Value : String;
  var sArray_Text : String;

implementation

{$R *.FMX}

USES  Main_FormFMX, Constants, Arrays, DecodeFMX, Camera_Parameters;



procedure TArrays.FormCreate(Sender: TObject);


    begin
      iRow := 1;

      If StatusCombo.ItemIndex = -1 then StatusCombo.ItemIndex := 1;            //   Point at 'Decoded' in the list


      // Setup Headers
      ArrayGrid1.Cells[0,0] := ('Array');


      // Show Titles
      for var N  := 0 to 6 do
      begin
         ArrayGrid1.Cells[N+1,0] := CustomText[N];
         ArrayGrid1.Cells[8,0] :=  'Status Flag'

      end;


      // Fill Grid

         FillGridInt('User Profiles' ,  Custom_Value);


//         FillGridInt('PASM Mode' , PASMMode_Value);
//         FillGridInt('Aspect Ratio' , AspectRatio_Value);



// Image Tab

//         FillGridInt('ISO' ,  ISO_Value);
//         FillGridInt('Exp Comp' , Exp_Comp_Value);
//         FillGridInt('JPG Res' , JPG_Res_Value);
//         FillGridInt('DNG Res' , DNG_Res_Value);
//         FillGridInt('Meter Mode' , MeterMode_Value);
////
//         FillGridInt('IBIS' , IBIS_Value);
//         FillGridInt('Panning' , Panning_Value);
//         FillGridInt('Noise Red JPG' , Noise_JPG_value);
//         FillGridInt('Noise Reduction' , NMode_Value);
//         FillGridInt('Long Exp NR' , Noise_LE_Value);
//
////  AF/MF Tab
//
//         FillGridInt('Focus MODE' , Focus_Value);
//         FillGridInt('AF Method' , AFMethod_Value);
//         FillGridInt('Drive Mode' , DriveMode_Value);
//
//// Camera Settings
//
//         FillGridSTR('Copyright' , Copyright_Value);
//         FillGridSTR('Artist' , Artist_Value);
//         FillGridInt('Sensor Format' , SensorFormat_Value);
//         FillGridInt('Shutter Mode' , Shutter_Value);
//
//// Film Style Tab
//         FillGridInt('Film Selected' , FS_Selector_Value);
//         FillGridInt('FilmStyle' , FilmStyle_Value);
//         FillGridInt('White Balance' , WhiteBalance_Value);
//         FillGridInt('JS AF' , JSAFMode_Value);
//         FillGridInt('JS MF' , JSMFMode_Value);
//         FillGridInt('JS Lock' , JSLock_Value);
//         FillGridInt('JS OP Mode' , JSOPMode_Value);

//         FillGridInt('Contrast_0',   Contrast0_Value);
//         FillGridInt('Sharpness_0',  Sharpness0_Value);
//         FillGridInt('Highlight_0',  Highlight0_Value);
//         FillGridInt('Shadows_0',    Shadow0_Value);
//         FillGridInt('Saturation_0', Saturation0_Value);
//
//         FillGridInt('Contrast_1',   Contrast1_Value);
//         FillGridInt('Sharpness_1',  Sharpness1_Value);
//         FillGridInt('Highlight_1',  Highlight1_Value);
//         FillGridInt('Shadows_1',    Shadow1_Value);
//         FillGridInt('Saturation_1', Saturation1_Value);
//
//         FillGridInt('Contrast_2',   Contrast2_Value);
//         FillGridInt('Sharpness_2',  Sharpness2_Value);
//         FillGridInt('Highlight_2',  Highlight2_Value);
//         FillGridInt('Shadows_2',    Shadow2_Value);
//         FillGridInt('Saturation_2', Saturation2_Value);
//
//         FillGridInt('Contrast_3',   Contrast3_Value);
//         FillGridInt('Sharpness_3',  Sharpness3_Value);
//         FillGridInt('Highlight_3',  Highlight3_Value);
//         FillGridInt('Shadows_3',    Shadow3_Value);
//
//         FillGridInt('Contrast_4',   Contrast4_Value);
//         FillGridInt('Sharpness_4',  Sharpness4_Value);
//         FillGridInt('Highlight_4',  Highlight4_Value);
//         FillGridInt('Shadows_4',    Shadow4_Value);


// Video Tab

//         FillGridInt('Vid Profile',  VidPro_Value);
//         FillGridInt7x4('Vid Format',   Vid_Format_Value);
//         FillGridInt7x4('Vid Resolution',  Vid_Resolution_Value);
//         FillGridInt7x4('Vid FrameRate',Vid_FrameRate_Value);
//         FillGridInt7x4('Vid Codec',    Vid_Codec_Value);
//         FillGridInt7x4('Vid Compression', Vid_Compression_Value);
//         FillGridInt7x4('Vid YUV',      Vid_YUV_Value);
//         FillGridInt7x4('Vid Bit Rate', Vid_BitRate_Value);
//         FillGridInt7x4('Vid Log',      Vid_Log_Value);
//         FillGridInt7x4('Vid Sensor',   Vid_Sensor_Value);
//         FillGridInt7x4('Vid Audio',    Vid_Audio_Value);
//         FillGridInt7x4('Vid Medium',   Vid_Medium_Value);


// Button Tab

//       FillGridInt7x2('Button3 Photo' , Button3_Value);
//       FillGridInt7x2('Button4 Photo' , Button4_Value);
//       FillGridInt7x2('Button9 Photo' , Button9_Value);
//       FillGridInt7x2('Button10 Photo' , Button10_Value);
//       FillGridInt7x2('Button20 Photo' , Button20_Value);
//       FillGridInt7x2('FNButton Photo' , FnButton_Value);
//
//       FillGridInt7x2('Button3 Video' , Button3_Value);
//       FillGridInt7x2('Button4 Video' , Button4_Value);
//       FillGridInt7x2('Button9 Video' , Button9_Value);
//       FillGridInt7x2('Button10 Video' , Button10_Value);
//       FillGridInt7x2('Button20 Video' , Button20_Value);
//       FillGridInt7x2('FNButton Video' , FnButton_Value);


// Dial Tab

       FillGridInt2Dim('Left Dial Photo' , LeftDial_Photo_Value);
       FillGridInt2Dim('Left Dial Video' , LeftDial_Video_Value);

       FillGridInt2Dim('Back Dial Photo' , RearDial_Photo_Value);
       FillGridInt2Dim('Back Dial Video' , RearDial_Video_Value);

       FillGridInt2Dim('Right Dial Photo' , RightDial_Photo_Value);
       FillGridInt2Dim('Right Dial Video' , RightDial_Video_Value);
//
//       FillGridInt('Left Dial Rot' , LeftDial_Rotation_Value);
//       FillGridInt('Back Dial Rot' , RearDial_Rotation_Value);
//       FillGridInt('Right Dial Rot', RightDial_Rotation_Value);



    end;


  procedure TArrays.SaveDefaultsButtonClick(Sender: TObject);

    var sText : String;

    begin
         sArray_Value:= 'CustomText'              ;   Output_ArraysFirst(CustomText);        // Text Output
         sArray_Value:= 'Copyright_Value'         ;   Output_Arrays(Copyright_Value);
         sArray_Value:= 'Artist_Value'            ;   Output_Arrays(Artist_Value);

         sArray_Value:= 'Custom_Value'            ;   Output_Arrays2(Custom_Value);          // Text[Values]
         sArray_Value:= 'ISO_Value'               ;   Output_Arrays2(ISO_Value);
         sArray_Value:= 'FS_Selector_Value'       ;   Output_Arrays2(FS_Selector_Value);
         sArray_Value:= 'FilmStyle_Value'         ;   Output_Arrays2(FilmStyle_Value);
         sArray_Value:= 'Exp_Comp_Value'          ;   Output_Arrays2(Exp_Comp_Value);
         sArray_Value:= 'IBIS_Value'              ;   Output_Arrays2(IBIS_Value);
         sArray_Value:= 'Panning_Value'           ;   Output_Arrays2(Panning_Value);
         sArray_Value:= 'NMode_Value'                ;   Output_Arrays2(NMode_Value);
         sArray_Value:= 'Noise_JPG_value'         ;   Output_Arrays2(Noise_JPG_value);
         sArray_Value:= 'JPG_Res_Value'           ;   Output_Arrays2(JPG_Res_Value);
         sArray_Value:= 'DNG_Res_Value'           ;   Output_Arrays2(DNG_Res_Value);
         sArray_Value:= 'WhiteBalance_Value'      ;   Output_Arrays2(WhiteBalance_Value);
         sArray_Value:= 'PASMMode_Value'          ;   Output_Arrays2(PASMMode_Value);
         sArray_Value:= 'DriveMode_Value'         ;   Output_Arrays2(DriveMode_Value);
         sArray_Value:= 'Focus_Value'             ;   Output_Arrays2(Focus_Value);
         sArray_Value:= 'AFMethod_Value'          ;   Output_Arrays2(AFMethod_Value);
         sArray_Value:= 'SensorFormat_Value'      ;   Output_Arrays2(IBIS_Value);
         sArray_Value:= 'SensorFormat'            ;   Output_Arrays2(SensorFormat_Value);
         sArray_Value:= 'AspectRatio_Value'       ;   Output_Arrays2(AspectRatio_Value);
         sArray_Value:= 'MeterMode_Value'         ;   Output_Arrays2(MeterMode_Value);
         sArray_Value:= 'Noise_LE_Value'          ;   Output_Arrays2(Noise_LE_Value);
         sArray_Value:= 'Shutter_Value'           ;   Output_Arrays2(Shutter_Value);
         sArray_Value:= 'JSAFMode_Value'          ;   Output_Arrays2(JSAFMode_Value);
         sArray_Value:= 'JSMFMode_Value'          ;   Output_Arrays2(JSMFMode_Value);
         sArray_Value:= 'JSLock_Value'            ;   Output_Arrays2(JSLock_Value);
         sArray_Value:= 'JSOPMode_Value'          ;   Output_Arrays2(JSOPMode_Value);

         sArray_Value:= 'Vid Profile'             ;   Output_Arrays2(VidPro_Value);
         sArray_Value:= 'Format'                  ;   Output_Arrays7x4(Vid_Format_Value);
         sArray_Value:= 'Resolution'              ;   Output_Arrays7x4(Vid_Resolution_Value);
         sArray_Value:= 'FrameRate'               ;   Output_Arrays7x4(Vid_FrameRate_Value);
         sArray_Value:= 'Codec'                   ;   Output_Arrays7x4(Vid_Codec_Value);
         sArray_Value:= 'Compression'             ;   Output_Arrays7x4(Vid_Compression_Value);
         sArray_Value:= 'YUV'                     ;   Output_Arrays7x4(Vid_YUV_Value);
         sArray_Value:= 'Bit Rate'                ;   Output_Arrays7x4(Vid_BitRate_Value);
         sArray_Value:= 'Log'                     ;   Output_Arrays7x4(Vid_Log_Value);
         sArray_Value:= 'Sensor'                  ;   Output_Arrays7x4(Vid_Sensor_Value);
         sArray_Value:= 'Audio'                   ;   Output_Arrays7x4(Vid_Audio_Value);
         sArray_Value:= 'Medium'                  ;   Output_Arrays7x4(Vid_Medium_Value);

         sArray_Value:= 'LeftDial_Rotation_Value' ;   Output_Arrays2(LeftDial_Rotation_Value);
         sArray_Value:= 'RearDial_Rotation_Value' ;   Output_Arrays2(RearDial_Rotation_Value);
         sArray_Value:= 'RightDial_Rotation_Value';   Output_Arrays2(RightDial_Rotation_Value);

//         sArray_Value:= 'Button3_Value' ;   Output_Arrays7x2(  Button3_Value);
//         sArray_Value:= 'Button3_Value' ;   Output_Arrays7x2(  Button3_Value);
//         sArray_Value:= 'Button4 Photo' ;   Output_Arrays7x2(  Button4_Value);
//         sArray_Value:= 'Button4 Video' ;   Output_Arrays7x2(  Button4_Value);
//         sArray_Value:= 'Button9 Photo' ;   Output_Arrays7x2(  Button9_Value);
//         sArray_Value:= 'Button9 Video' ;   Output_Arrays7x2(  Button9_Value);
//
//         sArray_Value:= 'Left Dial Photo' ;   Output_Arrays2Dim(  LeftDial_Photo_Value);
//         sArray_Value:= 'Left Dial Video' ;   Output_Arrays2Dim(  LeftDial_Video_Value);


    end;

  procedure TArrays.SaveArraysButtonClick(Sender: TObject);



    begin
         sArray_Value:= 'CustomText'              ;   Output_ArraysFirst(CustomText);
         sArray_Value:= 'Copyright_Value'         ;   Output_Arrays(Copyright_Value);
         sArray_Value:= 'Artist_Value'            ;   Output_Arrays(Artist_Value);
         sArray_Value:= 'Custom_Value'            ;   Output_Arrays2(Custom_Value);
         sArray_Value:= 'ISO_Value'               ;   Output_Arrays2(ISO_Value);
         sArray_Value:= 'FS_Selector_Value'       ;   Output_Arrays2(FS_Selector_Value);
         sArray_Value:= 'FilmStyle_Value'         ;   Output_Arrays2(FilmStyle_Value);
         sArray_Value:= 'Exp_Comp_Value'          ;   Output_Arrays2(Exp_Comp_Value);
         sArray_Value:= 'IBIS_Value'              ;   Output_Arrays2(IBIS_Value);
         sArray_Value:= 'Panning_Value'           ;   Output_Arrays2(Panning_Value);
         sArray_Value:= 'NMode_Value'             ;   Output_Arrays2(NMode_Value);
         sArray_Value:= 'Noise_JPG_value'         ;   Output_Arrays2(Noise_JPG_value);
         sArray_Value:= 'JPG_Res_Value'           ;   Output_Arrays2(JPG_Res_Value);
         sArray_Value:= 'DNG_Res_Value'           ;   Output_Arrays2(DNG_Res_Value);
         sArray_Value:= 'WhiteBalance_Value'      ;   Output_Arrays2(WhiteBalance_Value);
         sArray_Value:= 'PASMMode_Value'          ;   Output_Arrays2(PASMMode_Value);
         sArray_Value:= 'DriveMode_Value'         ;   Output_Arrays2(DriveMode_Value);
         sArray_Value:= 'Focus_Value'             ;   Output_Arrays2(Focus_Value);
         sArray_Value:= 'AFMethod_Value'          ;   Output_Arrays2(AFMethod_Value);
         sArray_Value:= 'SensorFormat_Value'      ;   Output_Arrays2(IBIS_Value);
         sArray_Value:= 'SensorFormat'            ;   Output_Arrays2(SensorFormat_Value);
         sArray_Value:= 'AspectRatio_Value'       ;   Output_Arrays2(AspectRatio_Value);
         sArray_Value:= 'MeterMode_Value'         ;   Output_Arrays2(MeterMode_Value);
         sArray_Value:= 'Noise_LE_Value'          ;   Output_Arrays2(Noise_LE_Value);
         sArray_Value:= 'Shutter_Value'           ;   Output_Arrays2(Shutter_Value);
         sArray_Value:= 'JSAFMode_Value'          ;   Output_Arrays2(JSAFMode_Value);
         sArray_Value:= 'JSMFMode_Value'          ;   Output_Arrays2(JSMFMode_Value);
         sArray_Value:= 'JSLock_Value'            ;   Output_Arrays2(JSLock_Value);
         sArray_Value:= 'JSOPMode_Value'          ;   Output_Arrays2(JSOPMode_Value);

         sArray_Value:= 'LeftDial_Rotation_Value' ;   Output_Arrays2(LeftDial_Rotation_Value);
         sArray_Value:= 'RearDial_Rotation_Value' ;   Output_Arrays2(RearDial_Rotation_Value);
         sArray_Value:= 'RightDial_Rotation_Value';   Output_Arrays2(RightDial_Rotation_Value);

//         sArray_Value:= 'Button3_Value'           ;   Output_Arrays7x2(Button3_Value);
//         sArray_Value:= 'Button3_Value'           ;   Output_Arrays7x2(Button3_Value);
//         sArray_Value:= 'Button4 Photo'           ;   Output_Arrays7x2(Button4_Value);
//         sArray_Value:= 'Button4 Video'           ;   Output_Arrays7x2(Button4_Value);
//         sArray_Value:= 'Button9 Photo'           ;   Output_Arrays7x2(Button9_Value);
//         sArray_Value:= 'Button9 Video'           ;   Output_Arrays7x2(Button9_Value);
//
//         sArray_Value:= 'Left Dial Photo'         ;   Output_Arrays2Dim(sArray_Value  LeftDial_Photo_Value);
//         sArray_Value:= 'Left Dial Video'         ;   Output_Arrays2Dim(sArray_Value  LeftDial_Video_Value);


    end;

   Procedure TArrays.Output_ArraysFirst(const Array_Name: array of String);
   begin
            // Write all the array values to a text file

      var myfile    : Textfile;
      var Index     : Integer := 0;


        begin


         assignfile ( myfile, 'Arrays.txt');

         rewrite (myfile);


         writeln (myfile,'var ' + sArray_Value + ': array [0..6] of String =  ('

         , #39 + Array_Name[index] + #39 + ',',
         #39 + Array_Name[index+1] + #39 + ',',
         #39 + Array_Name[index+2] + #39 + ',',
         #39 + Array_Name[index+3] + #39 + ',',
         #39 + Array_Name[index+4] + #39 + ',',
         #39 + Array_Name[index+5] + #39 + ',',
         #39 + Array_Name[index+6] + #39 + ',',
         #39 + '0' + #39 +
         ')'+ ';' );                                                            // Zero  to represent Status_Flag position


         //writeln(myfile);

         Closefile(myfile);

        end;
   end;





   Procedure TArrays.Output_Arrays(const Array_Name: array of String);
   begin
            // Write all the array values to a text file

      var myfile    : Textfile;
      var Index     : Integer := 0;


        begin


         assignfile ( myfile, 'Arrays.txt');

         Append (myfile);


         writeln (myfile,'var ' + sArray_Value + ': array [0..7] of String =  (',

         #39 + Array_Name[index] + #39 + ',',
         #39 + Array_Name[index+1] + #39 + ',',
         #39 + Array_Name[index+2] + #39 + ',',
         #39 + Array_Name[index+3] + #39 + ',',
         #39 + Array_Name[index+4] + #39 + ',',
         #39 + Array_Name[index+5] + #39 + ',',
         #39 + Array_Name[index+6] + #39 + ',',
         #39 + '0' + #39 +  ')'+ ';' );                                         // Zero  to represent Status_Flag position



         //writeln(myfile);

         Closefile(myfile);

        end;
   end;

   Procedure TArrays.Output_Arrays2(const Array_Name: array of Integer);
   begin
            // Write all the array values to a text file

      var myfile    : Textfile;
      var Index     : Integer := 0;


        begin


         assignfile ( myfile, 'Arrays.txt');

         Append (myfile);


         writeln (myfile,'var ' + sArray_Value + ': array [0..7] of Integer =  (',

         inttostr(Array_Name[index])  + ',',
         inttostr(Array_Name[index+1])+ ',',
         inttostr(Array_Name[index+2])+ ',',
         inttostr(Array_Name[index+3])+ ',',
         inttostr(Array_Name[index+4])+ ',',
         inttostr(Array_Name[index+5])+ ',',
         inttostr(Array_Name[index+6])+ ',',
         '0' + ')' + ';' );                                                     // Zero  to represent Status_Flag position



         //writeln(myfile);

         Closefile(myfile);

        end;



   end;

  Procedure TArrays.Output_Arrays2Dim(const Array_Name: array of T2DIM_Array);
   begin
            // Write all the array values to a text file

      var myfile    : Textfile;
      var Index     : Integer := 0;


        begin


         assignfile ( myfile, 'Arrays.txt');

         Append (myfile);


         writeln (myfile,'var ' + sArray_Value + ': array [0..7] of Integer =  ('   ) ;
//
//         ,inttostr(Array_Name[index])+',',
//         inttostr(Array_Name[index+1])+',',
//         inttostr(Array_Name[index+2])+ ',',
//         inttostr(Array_Name[index+3])+ ',',
//         inttostr(Array_Name[index+4])+ ',',
//         inttostr(Array_Name[index+5])+ ',',
//         inttostr(Array_Name[index+6])+ ',',
//        '0' + ')' + ';' );                                                     // Zero  to represent Status_Flag position


         //writeln(myfile);

         Closefile(myfile);

        end;



   end;


  Procedure TArrays.Output_Arrays7x2(const Array_Name: array of T7x2DIM_Array);
   begin
            // Write all the array values to a text file

      var myfile    : Textfile;
      var Index     : Integer := 0;


        begin


         assignfile ( myfile, 'Arrays.txt');

         Append (myfile);


         writeln (myfile,'var ' + sArray_Value + ': array [0..7] of Integer =  ('   ) ;
//
//         ,inttostr(Array_Name[index)+',',
//         inttostr(Array_Name[index+1])+',',
//         inttostr(Array_Name[index+2])+ ',',
//         inttostr(Array_Name[index+3])+ ',',
//         inttostr(Array_Name[index+4])+ ',',
//         inttostr(Array_Name[index+5])+ ',',
//         inttostr(Array_Name[index+6])+ ',',
//          '0' + ')' + ';' );                                                     // Zero  to represent Status_Flag position

         //writeln(myfile);

         Closefile(myfile);

        end;

   end;


  Procedure TArrays.Output_Arrays7x4(const Array_Name: array of T7x4DIM_Array);
   begin
            // Write all the array values to a text file

      var myfile    : Textfile;
      var Index     : Integer := 0;


        begin


         assignfile ( myfile, 'Arrays.txt');

         Append (myfile);


         writeln (myfile,'var ' + sArray_Value + ': array [0..7] of Integer =  ('   ) ;
//
//         ,inttostr(Array_Name[index)+',',
//         inttostr(Array_Name[index+1])+',',
//         inttostr(Array_Name[index+2])+ ',',
//         inttostr(Array_Name[index+3])+ ',',
//         inttostr(Array_Name[index+4])+ ',',
//         inttostr(Array_Name[index+5])+ ',',
//         inttostr(Array_Name[index+6])+ ',',
//          '0' + ')' + ';' );                                                     // Zero  to represent Status_Flag position

         //writeln(myfile);

         Closefile(myfile);

        end;

   end;

procedure TArrays.StatusComboChange(Sender: TObject);

    var c, r: Integer;

    begin

          begin
            for c := 0 to 8 do
              for r := 0 to 124 do
                ArrayGrid1.Cells[c, r] := '';
          end;

        FormCreate(Sender);
    end;




procedure TArrays.StatusComboEnter(Sender: TObject);
begin
      StatusCombo.ItemIndex := 1;
end;

  procedure TArrays.FillGridInt(Name : String; const Working_Array: array of Integer);

    begin

      if (Working_Array[Status_Flag]) = StatusCombo.ItemIndex  then
          begin
            ArrayGrid1.Cells[0,iRow] := Name;
            for var i := 0 to 7 do
                 ArrayGrid1.Cells[i+1,iRow] := inttostr(Working_Array[i]);

            iRow := iRow +1;
          end;

    end;

  procedure TArrays.FillGridSTR(Name : String; const Working_Array: array of String);

    begin

    //showmessage('Status Combo is ' +  inttostr((StatusCombo.ItemIndex)));

      if (Working_Array[Status_Flag])  = inttostr(StatusCombo.ItemIndex)  then
          begin
            ArrayGrid1.Cells[0,iRow] := Name;
            for var i := 0 to 7 do
                 ArrayGrid1.Cells[i+1,iRow] := Working_Array[i];

            iRow := iRow +1;
          end;

    end;


  procedure TArrays.FillGridInt7x2(Name : String;  const Working_Array: T7x2DIM_Array);

    begin

      if (Working_Array[Status_Flag,0])  = StatusCombo.ItemIndex   then
          begin
            ArrayGrid1.Cells[0,iRow] := Name;
            for var i := 0 to 7 do
                 ArrayGrid1.Cells[i+1,iRow] := inttostr(Working_Array[i,0]);

            iRow := iRow +1;
          end;

    end;


  procedure TArrays.FillGridInt7x4(Name : String;  const Working_Array: T7x4DIM_Array);

    begin

      if (Working_Array[Status_Flag,0])  = StatusCombo.ItemIndex   then
          begin
            ArrayGrid1.Cells[0,iRow] := Name;
            for var i := 0 to 7 do
                 ArrayGrid1.Cells[i+1,iRow] := inttostr(Working_Array[i,0]);

            iRow := iRow +1;
          end;

    end;


  procedure TArrays.FillGridInt2Dim(Name : String; const Working_Array: T2DIM_Array);

    begin

      if (Working_Array[Status_Flag,0])  = StatusCombo.ItemIndex   then         // Only show items as selected in Status Combobox
          begin
            ArrayGrid1.Cells[0,iRow] := Name;

            for var PASM := 0 to 3 do
              begin

                   for var i := 0 to 7 do
                   ArrayGrid1.Cells[i+1,iRow] := inttostr(Working_Array[i,PASM]);

                   iRow := iRow +1;
              end;
          end;

    end;

end.
