unit DecodeFMX;


interface


uses
  Arrays, Constants, Data.Bind.Components, Data.Bind.Grid, FandPs, 
  FMX.Controls, FMX.Controls.Presentation, FMX.Dialogs, FMX.Forms, 
  FMX.Graphics, FMX.StdCtrls, FMX.Types, MyTypes, System.SysUtils, 
  System.Types, System.UITypes;



      //  System.Notification, System.Types, System.UITypes, System.Classes, System.Variants,

      procedure RunDecode(Status_Val : Integer);
      procedure UpdateApplication;


type
  TDecode = class(TForm)

 end;

 Var

  iSetting  : Integer;
  I         : Integer;
  rSetting  : Real;
  sFoundText: String ;
  sChar     : String;
  sText     : String;
  Asc       : Integer;
  iCount    : Integer = 1;         // count of the position in the search string
  iCount2   : Integer = 0;
  iIndex    : Integer = 0;
  iLocation : Integer = 0;

 Function Search_Array(iSearch_Item : Integer; const Search_Array1: array of Integer; const Search_Array2: array of String) : String;

 Function REV_Search(sSearch_Item : String; const Search_Array1: array of String; const Search_Array2: array of Integer) : Integer;

 Function Search_Text(sSearch_Item : String; Search_Start :Integer; Search_End : Integer) : Integer;
 Function Search_Number(const sSearch_Item: String; var Result_Array: array of Integer ) : Integer;
 Function Search_Number2Dim(const sSearch_Item: String; Mode: Integer;  var Result_Array: T2DIM_Array ) : Integer;
 Function Search_Number7x2(const sSearch_Item: String; Mode: Integer;  var Result_Array: T7x2DIM_Array ) : Integer;
 Function Search_Number7x4(const sSearch_Item: String; Mode: Integer;  var Result_Array: T7x4DIM_Array ) : Integer;

implementation

USES  Main_FormFMX, Common_Parameters, Camera_Parameters;



  ////////////////  Start of Procedures  /////////////////

procedure RunDecode(Status_Val : Integer);                                      // Status_Value determines if a re-read of the
  begin                                                                         // Camera Array should occur
                                                                                // or if parameter arrays should be left alone.

    if  checkFileHeader() = True then
    begin



          begin
            //ShowMessage('This is where Decode Runs');


              Custom_Offset := Custom_Index[0];       //Set to 14 to start with.    //Camera_array[CustomSetting];

              //ShowMessage('Offset = ' + inttostr(Custom_Offset));

              //checkCameraModel;
              //setCameraModel();

            if Status_Val = 0 then
              begin
                  Search_Custom_Text();                                             // Find all the names of the Custom modes from the Camera


                //showmessage('Searching for Copyright Text');

                sText := COPYRIGHT;
                  iLocation := Search_Text(sText, 0, Cusfilesize );                 //Extract the Copywrite from Array
                    if iLocation <> -1  then

                       begin
                        //Showmessage('Text Found at Postion ' + inttostr(iLocation) );

                        for var Letter_Index :=iLocation + 15 to iLocation + 24 do
                           begin
                            Asc := Ord(Camera_array[Letter_Index]);                 // Access Camera Array to
                            sChar := sChar + Char(Asc);
                           end;

                        sChar:=  (Trim(sChar));                                       // Remove aall control Chars
                        sChar := sChar.Replace(',', '', [rfReplaceAll, rfIgnoreCase]);// Remove all instances of , in str
                        sChar := sChar.Replace('"', '', [rfReplaceAll, rfIgnoreCase]);// Remove all instances of " in str

                        for var i := 0 to 6 do
                        Copyright_Value[i] :=  (sChar);                             // Add it to the Copywrite Array
                        Copyright_Value[Status_Flag] := '1';
                        sChar := '';
                        iLocation := 0;                                             // Clear Variables
                       end;



                  sText := ARTIST;
                    iLocation := Search_Text(sText, 0, Cusfilesize );               //Extract the Artist from Array
                    if iLocation <> -1  then

                       begin
                        //Showmessage('Text Found at Postion ' + inttostr(iLocation) );

                        for var Letter_Index :=iLocation + 15 to iLocation + 24 do
                           begin
                            Asc := Ord(Camera_array[Letter_Index]);                   // Access Camera Array to
                            sChar := sChar + Char(Asc);                               // Extract Artist Name from Array
                           end;

                        sChar:=  (Trim(sChar));                                       // Remove aall control Chars
                        sChar := sChar.Replace(',', '', [rfReplaceAll, rfIgnoreCase]);// Remove all instances of , in str
                        sChar := sChar.Replace('"', '', [rfReplaceAll, rfIgnoreCase]);// Remove all instances of " in str

                        for var i := 0 to 6 do
                        Artist_Value[i] :=  (sChar);                                  // Add it to the Copywrite Array
                        Artist_Value[Status_Flag] := '1';                             // Add it to the Artist Field
                        sChar := '';                                                  // Clear Variables
                        iLocation := 0;


                       end;


              end;

             if (vCameraModel ='LEICA SL3') or (vCameraModel = 'LEICA SL3-S') or (vCameraModel ='LEICA Fac') or (vCameraModel = 'LEICA SL2') or (vCameraModel = 'LEICA SL2-S') then
              begin
                  sText := FilmStyle;

                  iLocation := Search_Text(sText, 0, CusFileSize );                 //Extract the Filmstyle from the array


                  if iLocation <> -1  then


                     begin
                      //Showmessage('String Found at Postion ' + inttostr(iLocation) );

                         for var iIndex := 0 to NUMCUSTOMSETTINGS do
                         begin

                          Asc := Ord(Camera_array[iLocation + Custom_Index[iIndex]]);

                          //Showmessage('Value = ' + Char(Asc) +' found at Postion ' + inttostr(iLocation + Custom_Index[iIndex]) );
                          // Add it to the Variable Field


                          FilmStyle_Value[iIndex] := (Asc-48);
                          //Showmessage('FilmStyle Text = ' + FilmStyleText[FilmStyleCode_Value[iIndex]]);

                         end;

                        FilmStyle_Value[Status_Flag] := 1;

                      iLocation := 0;
                     end;

              end;

    // Wheels and Buttons

                     //LeftWheel_P  i.e. 'D229';
                     sText := LeftWheel_P_Photo ;

                     if (LeftDial_Photo_Value[Status_Flag,P]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,P, LeftDial_Photo_Value);
                       end;

                      //BackWheel_P  i.e. 'D1ED';
                     sText := BackWheel_P_Photo ;

                     if (RearDial_Photo_Value[Status_Flag,P]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,P, RearDial_Photo_Value);
                       end;


                     //RightWheel_P  i.e. 'D0D8';
                     sText := RightWheel_P_Photo ;

                     if (RightDial_Photo_Value[Status_Flag,P]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,P, RightDial_Photo_Value);
                       end;



                      //LeftWheel_A  i.e. 'D22A';
                     sText := LeftWheel_A_Photo ;

                     if (LeftDial_Photo_Value[Status_Flag,A]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,A, LeftDial_Photo_Value);
                       end;


                      //BackWheel_A  i.e. 'D1EF';
                     sText := BackWheel_A_Photo ;

                     if (RearDial_Photo_Value[Status_Flag,A]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,A, RearDial_Photo_Value);
                       end;


                     //RightWheel_A  i.e. 'D0DA';
                     sText := RightWheel_A_Photo ;

                     if (RightDial_Photo_Value[Status_Flag,A]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,A, RightDial_Photo_Value);
                       end;


                      //LeftWheel_S  i.e. 'D22B';
                     sText := LeftWheel_S_Photo ;

                     if (LeftDial_Photo_Value[Status_Flag,S]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,S, LeftDial_Photo_Value);
                       end;


                      //BackWheel_S  i.e. 'D1D0';
                     sText := BackWheel_S_Photo ;

                     if (RearDial_Photo_Value[Status_Flag,S]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,S, RearDial_Photo_Value);
                       end;



                     //RightWheel_S  i.e. 'D0DB';
                     sText := RightWheel_S_Photo ;

                     if (RightDial_Photo_Value[Status_Flag,S]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,S, RightDial_Photo_Value);
                       end;




                      //BackWheel_M  i.e. 'D1D1';
                     sText := BackWheel_M_Photo ;

                     if (RearDial_Photo_Value[Status_Flag,M]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,M, RearDial_Photo_Value);
                       end;


                     //RightWheel_M  i.e. 'D0DC';
                     sText := RightWheel_M_Photo ;

                     if (RightDial_Photo_Value[Status_Flag,M]) = Status_Val then               // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,M, RightDial_Photo_Value);
                       end;


                     //LeftWheel_M  i.e. 'D22C';
                     sText := LeftWheel_M_Photo ;

                     if (LeftDial_Photo_Value[Status_Flag,M]) = Status_Val then                // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number2Dim(sText,M, LeftDial_Photo_Value);
                       end;




    // Buttons in Photo Mode

                     //Button3  i.e. 'D195';
                     sText := Button3 ;

                     if (Button3_Value[Status_Flag,Photo]) = Status_Val then               // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Photo, Button3_Value);
                       end;


                     //Button4  i.e. 'D1D6';
                     sText := Button4 ;

                     if (Button4_Value[Status_Flag,Photo]) = Status_Val then               // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Photo, Button4_Value);
                       end;

                     //Button9  i.e. 'D1D7';
                     sText := Button9 ;

                     if (Button9_Value[Status_Flag,Photo]) = Status_Val then               // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Photo, Button9_Value);
                       end;

                     //Button10  i.e. 'D1DA';
                     sText := Button10 ;

                     if (Button10_Value[Status_Flag,Photo]) = Status_Val then              // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Photo, Button10_Value);
                       end;

                     //Button20  i.e. 'D193';
                     sText := Button20 ;

                     if (Button20_Value[Status_Flag,Photo]) = Status_Val then              // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Photo, Button20_Value);
                       end;

                     //FnButton  i.e. 'D191';
                     sText := FnButton ;

                     if (FnButton_Value[Status_Flag,Photo]) = Status_Val then              // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Photo, FnButton_Value);
                       end;

     // Buttons in VideoMode

                     //Button3  i.e. 'D195';
                     sText := Button3_Video ;

                     if (Button3_Value[Status_Flag,Video]) = Status_Val then               // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Video, Button3_Value);
                       end;


                     //Button4  i.e. 'D1D6';
                     sText := Button4_Video  ;

                     if (Button4_Value[Status_Flag,Video]) = Status_Val then               // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Video, Button4_Value);
                       end;

                     //Button9  i.e. 'D1D7';
                     sText := Button9_Video  ;

                     if (Button9_Value[Status_Flag,Video]) = Status_Val then               // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Video, Button9_Value);
                       end;

                     //Button10  i.e. 'D1DA';
                     sText := Button10_Video  ;

                     if (Button10_Value[Status_Flag,Video]) = Status_Val then              // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Video, Button10_Value);
                       end;

                     //Button20  i.e. 'D193';
                     sText := Button20_Video  ;

                     if (Button20_Value[Status_Flag,Video]) = Status_Val then              // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Video, Button20_Value);
                       end;

                     //FnButton  i.e. 'D191';
                     sText := FnButton_Video  ;

                     if (FnButton_Value[Status_Flag,Video]) = Status_Val then              // Is 'Read' flag set to false
                       begin
                       iLocation := Search_Number7x2(sText,Video, FnButton_Value);
                       end;


    // All other Functions and Settings

                     //ISO   i.e. 500F
                     sText := ISO;

                     if (ISO_Value[Status_Flag]) = Status_Val then                           // Is 'Read' flag set to false
                       begin
                         iLocation := Search_Number(sText, ISO_Value );
                         end;


                     //ExpComp   i.e. 5010
                     sText := ExpComp;

                     if (Exp_Comp_value[Status_Flag]) = Status_Val then                      // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, Exp_Comp_value );
                       end;


                     //WHITEBALANCE   i.e. 5005
                     sText := WHITEBALANCE;

                     if (WhiteBalance_Value[Status_Flag]) = Status_Val then                  // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, WhiteBalance_Value );
                       end;


                     //PASM_Mode   i.e. 500E
                     sText := PASM_Mode;

                     if (PASMMode_Value[Status_Flag]) = Status_Val then                      // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, PASMMode_Value );
                       end;



                       //DRIVEMODE       i.e.'5013';
                     sText := DRIVEMODE;

                     if (Drivemode_Value[Status_Flag]) = Status_Val then                     // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, Drivemode_Value );
                       end;



                     //AFMODE       i.e.'500A';
                     sText := Focus;

                     if (Focus_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, Focus_Value );
                       end;

                     //ISMODE  i.e. 'D046';
                     sText := IBIS;

                     if (IBIS_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, IBIS_Value );
                       end;


                     //NR_LE_onoff  i.e. 'D822';
                     sText := NR_LE_onoff;

                     if (Noise_LE_Value[Status_Flag]) = Status_Val then                            // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, Noise_LE_Value);
                       end;



                     //JPGRes  i.e. 'D00F';
                     sText := JPGRes;

                     if (JPG_Res_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, JPG_Res_Value);
                       end;

                     //DNG  i.e. 'D822';
                     sText := DNG;

                     if (DNG_Res_Value[Status_Flag]) = Status_Val then                           // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, DNG_res_Value);
                       end;

                      //ShowMessage('Here1');

                      //Aspect Ratio  i.e. 'D04F';
                     sText := AspectRatio;

                     if (AspectRatio_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, AspectRatio_Value);
                       end;


                     sText := FS_Selector;     // 'D13E';

                     if (FS_Selector_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,FS_Selector_Value);
                       end;


     // Film Styles

                     sText := Contrast0;     // 'D13E';

                     if (Contrast0_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Contrast0_Value);
                       end;

                     sText := Highlight0;     // 'D13E';

                     if (Highlight0_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Highlight0_Value);
                       end;

                     sText := Shadow0;     // 'D13E';

                     if (Shadow0_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Shadow0_Value);
                       end;

                     sText := Sharpness0;     // 'D13E';

                     if (Sharpness0_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Sharpness0_Value);
                       end;

                     sText :=Saturation0;     // 'D13E';

                     if (Saturation0_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Saturation0_Value);
                       end;

                     sText := Contrast1;     // 'D08D';

                     if (Contrast1_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Contrast1_Value);
                       end;


                     sText := Highlight1;     // 'D13E';

                     if (Highlight1_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Highlight1_Value);
                       end;

                     sText := Shadow1;     // 'D13E';

                     if (Shadow1_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Shadow1_Value);
                       end;

                     sText := Sharpness1;     // 'D13E';

                     if (Sharpness1_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Sharpness1_Value);
                       end;

                     sText :=Saturation1;     // 'D13E';

                     if (Saturation1_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Saturation1_Value);
                       end;

                     sText := Contrast2;     // 'D13E';

                     if (Contrast2_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Contrast2_Value);
                       end;

                     sText := Highlight2;     // 'D13E';

                     if (Highlight2_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Highlight2_Value);
                       end;

                     sText := Shadow2;     // 'D13E';

                     if (Shadow2_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Shadow2_Value);
                       end;

                     sText := Sharpness2;     // 'D13E';

                     if (Sharpness2_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Sharpness2_Value);
                       end;

                     sText :=Saturation2;     // 'D13E';

                     if (Saturation2_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Saturation2_Value);
                       end;



                     sText := Contrast3;     // 'D13E';

                     if (Contrast3_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Contrast3_Value);
                       end;

                     sText := Highlight3;     // 'D13E';

                     if (Highlight3_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Highlight3_Value);
                       end;

                     sText := Shadow3;     // 'D13E';

                     if (Shadow3_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Shadow3_Value);
                       end;

                     sText := Sharpness3;     // 'D13E';

                     if (Sharpness3_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Sharpness3_Value);
                       end;

                     sText := Contrast4;     // 'D13E';

                     if (Contrast4_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Contrast4_Value);
                       end;

                     sText := Highlight4;     // 'D13E';

                     if (Highlight4_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Highlight4_Value);
                       end;

                     sText := Shadow4;     // 'D13E';

                     if (Shadow4_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Shadow4_Value);
                       end;

                     sText := Sharpness4;     // 'D13E';

                     if (Sharpness4_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Sharpness4_Value);
                       end;


                     sText := Joystick_AF;      //'D02B';

                     if (JSAFMode_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,JSAFMode_Value);
                       end;

                     sText := Joystick_Manual;    //'D20C';

                     if (JSMFMode_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,JSMFMode_Value);
                       end;

                     sText := Joystick_Mode;    //'D0CE';

                     if (JSOPMode_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,JSOPMode_Value);
                       end;


                     sText := Joystick_Lock;  //'D02C';

                     if (JSLock_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,JSLock_Value);
                       end;

                     //SensorFormat  i.e. 'D822';
                     sText := SensorFormat;

                     if (SensorFormat_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText, SensorFormat_Value);
                       end;

                     sText :=NRJPeg;  //'D02C';

                     if (Noise_JPG_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Noise_JPG_Value);
                       end;


                     sText :=MtrMode;  //'D02C';

                     if (MeterMode_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,MeterMode_Value);
                       end;

                     sText :=NRMODE;  //'D02C';

                     if (NMode_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,NMode_Value);
                       end;

                     sText :=AFMethod;  //'D02C';

                     if (AFMethod_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,AFMethod_Value);
                       end;


                     sText :=Panning;  //'D02C';

                     if (Panning_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Panning_Value);
                       end;

                     sText :=Shutter;  //'D02C';

                     if (Shutter_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Shutter_Value);
                       end;

                      sText :=LeftWheel_Rotation;  //'D02C';

                     if (LeftDial_Rotation_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,LeftDial_Rotation_Value);
                       end;

                     sText :=BackWheel_Rotation;  //'D02C';

                     if (RearDial_Rotation_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,RearDial_Rotation_Value);
                       end;

                     sText :=RightWheel_Rotation;  //'D02C';

                     if (RightDial_Rotation_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,RightDial_Rotation_Value);
                       end;

                     sText :=Kelvin;  //'D014';

                     if (Kelvin_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,Kelvin_Value);
                       end;


                     sText :=VidProfile;  //'D33F';

                     if (VidPro_Value[Status_Flag]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number(sText,VidPro_Value);
                       end;


                     sText :=VFormat;  //'D02C';

                     if (Vid_Format_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_Format_Value);
                       end;

                     sText :=VResolution;  //'D02C';

                     if (Vid_Resolution_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_Resolution_Value);
                       end;

                     sText :=VFrameRate;  //'D02C';

                     if (Vid_FrameRate_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_FrameRate_Value);
                       end;

                     sText :=VCodec;  //'D02C';

                     if (Vid_Codec_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_Codec_Value);
                       end;

                     sText :=VCompression;  //'D02C';

                     if (Vid_Compression_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_Compression_Value);
                       end;


                     sText :=VYUV;  //'D02C';

                     if (Vid_YUV_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_YUV_Value);
                       end;

                     sText :=VBitRate;  //'D02C';

                     if (Vid_BitRate_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_BitRate_Value);
                       end;

                     sText :=VLog;  //'D02C';

                     if (Vid_Log_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_Log_Value);
                       end;

                     sText :=VSensor ;  //'D249';

                     if (Vid_Sensor_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_Sensor_Value);
                       end;

                     sText :=VAudio;  //'D02C';

                     if (Vid_Audio_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_Audio_Value);
                       end;

                     sText :=VMedium;  //'D02C';

                     if (Vid_Medium_Value[Status_Flag,VP_Offset]) = Status_Val then                        // Is 'Read' flag set to false

                       begin
                       iLocation := Search_Number7x4(sText,0,Vid_Medium_Value);
                       end;



              offset := 0 ;

              Populate_Fields_Text(offset, VP_offset);
              //ShowMessage('Reached Here');
         end
    end

        else

          ShowMessage('Incorrect File Format');
  end;



  ////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////                    Start of Functions                     /////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////





procedure UpdateApplication;
  // Updates (repaints where nesc) all windows of the app
  begin

  end;







  Function Search_Array(iSearch_Item : Integer; const Search_Array1: array of Integer; const Search_Array2: array of String) : String;

      // Searches through Search_Array1 until match found to iSearch_Item (Integer)
      // Returns Text from Search_Array2 in same (index) position.


      begin

        sFoundText := '****';

        for var iLoop  := 0 to Length(Search_Array1)-1 do

            begin

              if (Search_Array1[iLoop] = iSearch_Item) then                      // Look up Search Item

                  begin

                      //ShowMessage('Search found :- Search_Array[iLoop] & Found Text = '
                      //+ inttostr(Search_Array1[iLoop])
                      //+ ' ' +  Search_Array2[iLoop]);

                      sFoundText := Search_Array2[iLoop];

                      Result := sFoundText;
                      break
                  end

              else

            end;

            //ShowMessage('Search Found ' + sFoundText);

      end;



  Function REV_Search(sSearch_Item : String; const Search_Array1: array of String; const Search_Array2: array of Integer) : Integer;

      // Searches through Search_Array1 until match (Text) is found to sSearch_Item
      // Returns Code from Search_Array2 in same (index) position.


      begin

        iSetting := -1;

        for var iLoop  := 0 to Length(Search_Array1)-1 do

           Begin

                if SameText(Search_Array1[iLoop], sSearch_Item) then             // Look up Search Item

                  begin

                      iSetting := Search_Array2[iLoop];

                      //ShowMessage('REV Search Found Text =  ' + Search_Array1[iLoop] + ' using ' +  inttostr(iSetting) );

                      Result := iSetting;
                      exit
                  end

              else

           end;

          ShowMessage('Search Failed ' );
          Result := 0;

      end;






  Function Search_Text(sSearch_Item : String; Search_Start :Integer; Search_End : Integer ) : Integer;


      begin

      var iIndex2: Integer;

        //Showmessage('Searching for ' + sSearch_Item + ' From '+ inttostr(Search_Start) + ' to ' + inttostr(Search_End));

        iIndex2 := Find(sSearch_Item,Search_Start,Search_End);

        if iIndex2 <> -1  then                                                  // Look up Search Item

            begin
                //Showmessage('Search Text starts at ' + inttostr(iIndex));
                Result := iIndex2;
                exit
            end;

         Result := iIndex2;                                                     // Flag Failure
         //Showmessage('Search Text not Found');

  end;







  Function Search_Number(const sSearch_Item: String; var Result_Array: array of Integer ) : Integer;

  // Search for String of 'number' and return array[NUMCUSTOMSETTINGS]
  // Pass into Function, Search Item and array to pass back


    begin

    var trigger := '';
    var numofChars: Integer :=0;

      If Result_Array[Status_Flag] <> 4  then
        begin

        If sSearch_Item = trigger then
          begin
          Showmessage('Searching for ' + sSearch_Item );
          end;

          var iLocation := Find(sSearch_Item, 0, Cusfilesize);


            if iLocation <> -1  then                                                  // Look up start address of Search Item
                begin
                    If sSearch_Item = trigger then
                      begin
                      Showmessage('"Find" found ' + sSearch_Item );
                      end;


                    var iCount := 0;                                                // Find seven numbers to place in array
                    sChar := '';                                                    // Reset Char String var
                    var iIndex :=0;
                    iCount2 := 0;


                        for var iDigit :=iLocation to iLocation + 127 do            // Add all digits in group

                           begin
                              If sSearch_Item = trigger then
                                begin
                                  Showmessage('Now at ' + inttohex(iDigit+iIndex) + ' Moving to 0A');
                                end;

                              //Showmessage('Moving to 0A');
                              While (Camera_array[iDigit+iIndex] <> 10)  do     // Skip Forwad until we find '0a' in the array
                              begin

                                if (Camera_array[iDigit+iIndex] = 93) or (numofChars > 7) then        // ] indicates End of Record marker so exit
                                  begin
                                  If sSearch_Item = trigger then
                                        begin                                               // 5D 2C indicates end of Record
                                          Showmessage('At the end of the Record ' + inttohex(iDigit+iIndex) + ' and found ' + inttostr(Camera_array[iDigit+iIndex]));
                                        end;
                                    Result_Array[Status_Flag] := 1;             // Set 'Read' flag to true


                                    Result := iLocation;
                                    exit
                                  end;

                              inc(iIndex,1);                                        // Add one to lookup Index
                              end;

                              inc(iIndex,1);                                        // Step over '0a' to next digit
                              If sSearch_Item = trigger then
                                begin
                                  Showmessage('Steped over 0A to ' + inttohex(iDigit+iIndex));
                                end;


                                //Showmessage('Skip Spaces');
                                While (Char(Ord(Camera_array[iDigit+iIndex]))) = ' ' do     // Skip Spaces until we find first value
                                begin
                                inc(iIndex,1);                                              // Add one to lookup Index
                                end;

                                //Showmessage('End of Spaces at ' + inttohex(iDigit+iIndex));



                                if (Camera_array[iDigit+iIndex] > 41) then // Until at first required number in file
                                begin

                                  If sSearch_Item = trigger then
                                   begin
                                        Showmessage('Checking Number at ' + inttohex(iDigit+iIndex) + ' and found ' +
                                        inttohex(Camera_array[iDigit+iIndex]) +' which is =' + inttostr(Camera_array[iDigit+iIndex]-48));
                                   end;

                                    // Need to adjust this to cater for '-' ( Minus) Char.

                                    While   (Camera_array[iDigit+iIndex] = 45 ) or                                        // minus sign

                                    ((Camera_array[iDigit+iIndex] >47 ) and (Camera_array[iDigit+iIndex] < 58 ))  do         // 0 .. 9



                                    begin
                                      Asc := Ord(Camera_array[iDigit+iIndex]);          // Convert Byte Array to
                                      sChar := sChar + Char(Asc);                       // Extract 'ASCII' number from Array

                                      If sSearch_Item = trigger then
                                           begin
                                              ShowMessage('sChar = ' + sChar);
                                           end;

                                      inc(iIndex,1);                                      // add number found to end of String


                                        if  (Camera_array[iDigit+iIndex] = 44 ) or  (Camera_array[iDigit+iIndex] = 10 )   // Comma or LF
                                        or  (Camera_array[iDigit+iIndex] = 13 )
                                        then
                                          begin                                                     // End of Digits marker so write to array
//                                            If sSearch_Item = trigger then
//                                              begin
//                                              Showmessage('Char Count = ' + inttostr(numofChars));
//                                              end;
//
//
//                                                  If sSearch_Item = trigger then
//                                                   begin
//                                                    Showmessage('Found end of the Record at ' + inttohex(iDigit+iIndex));
//                                                    Showmessage('String writen to Array = ' + sChar);
//
//                                                    //Showmessage('iCount2 so far = ' + inttostr(iCount2));
//                                                    end;

                                                    Result_Array[iCount2] := StrtoInt(sChar);     // Convert ASCII to Dec number & add to Array
                                                                                                  // Reset Char count

                                                   inc(numofChars,1);

                                                    If sSearch_Item = trigger then
                                                      begin
                                                      Showmessage('Result at ' + sSearch_Item + ' passed to array = '
                                                      + inttostr(Result_Array[0]) + ',' + inttostr(Result_Array[1]) + ','  + inttostr(Result_Array[2]) + ','  + inttostr(Result_Array[3]) + ','
                                                      + inttostr(Result_Array[4]) + ','  + inttostr(Result_Array[5]) + ','  + inttostr(Result_Array[6]) + ','  + inttostr(Result_Array[7]));
                                                      end;


                                                  inc(iCount2,1);


                                              sChar := '';                      // Clear the String ready for the next number

                                            end;


                                    end;




                                end;

                           end;

                        //Result := iLocation;
                        //Showmessage('Search Text not Found '+ sSearch_Item);
                        //exit
                    end;



           Result := iLocation;                                                        // Flag Failure
           //Showmessage('Search Text not Found '+ sSearch_Item);
           end

        else
           begin
            //Showmessage('Search Item = 0 so search not undertaken for ' + sSearch_Item);
            Result_Array[Status_Flag] := 5;
           end;

    end;              // End of Function




Function Search_Number2Dim(const sSearch_Item: String; Mode: Integer;  var Result_Array: T2DIM_Array) : Integer;


  // Search for String of item to find and return 'Result Array'
  // Pass into Function, Search Item and array to pass back


    begin

    var numofChars: Integer :=0;


    If  Result_Array[Status_Flag,0] <> 4  then
      begin

        var iLocation := Find(sSearch_Item, 0, Cusfilesize);                      // Search whole Camera array

          if iLocation <> -1  then                                                  // Look up start address of Search Item
            begin
              var iCount := 0;                                                    // Find seven numbers to place in array
              sChar := '';                                                        // Reset Char String var
              var iIndex :=0;
              iCount2 := 0;

                      for var iDigit :=iLocation to iLocation + 118 do            // Add all digits in group

                         begin

                            //Showmessage('Now at ' + inttohex(iDigit+iIndex));

                            //Showmessage('Moving to 0A');
                            While (Camera_array[iDigit+iIndex] <> 10)  do            // Skip Forwad until we find '0a' in the array
                            begin

                              if (Camera_array[iDigit+iIndex] = 93) or (numofChars > 7) then // End of Record marker so exit
                                begin                                               // 5D 2C indicates end of Record
                                  //Showmessage('At the end of the Record ' + inttohex(iDigit+iIndex) + ' and found ' + inttostr(Camera_array[iDigit+iIndex]));
                                  Result_Array[Status_Flag,Mode] := 1;                     // Set 'Read' flag to true
                                  Result := iLocation;
                                {
                                  if sSearch_Item = 'D229' then
                                    begin
                                    Showmessage('Result at ' + sSearch_Item + ' passed to array = '
                                    + inttostr(Result_Array[0,Mode]) + ',' + inttostr(Result_Array[1,Mode]) + ','  + inttostr(Result_Array[2,Mode]) + ','  + inttostr(Result_Array[3,Mode]) + ','
                                    + inttostr(Result_Array[4,Mode]) + ','  + inttostr(Result_Array[5,Mode]) + ','  + inttostr(Result_Array[6,Mode]) + ','  + inttostr(Result_Array[7,Mode]));
                                    end;
                                 }
                                  exit
                                end;

                            inc(iIndex,1);                                        // Add one to lookup Index
                            end;

                            inc(iIndex,1);                                        // Step over '0a' to next digit
                            //Showmessage('Steped over 0A to ' + inttohex(iDigit+iIndex));


                              //Showmessage('Skip Spaces');
                              While (Char(Ord(Camera_array[iDigit+iIndex]))) = ' ' do     // Skip Spaces until we find first value
                              begin
                              inc(iIndex,1);                                      // Add one to lookup Index
                              end;

                              //Showmessage('End of Spaces at ' + inttohex(iDigit+iIndex));



                              if Camera_array[iDigit+iIndex] > 41 then            // Until at first required number in file
                              begin
                              //Showmessage('Checking Number at ' + inttohex(iDigit+iIndex) + ' and found ' + inttohex(Camera_array[iDigit+iIndex]) +' which is =' + inttostr(Camera_array[iDigit+iIndex]-48));


                                  While (Camera_array[iDigit+iIndex] >47 ) and (Camera_array[iDigit+iIndex] < 57 ) do         // 0 .. 9
                                  begin
                                    Asc := Ord(Camera_array[iDigit+iIndex]);          // Convert Byte Array to
                                    sChar := sChar + Char(Asc);                       // Extract 'ASCII' number from Array
                                                                                      // add number found to end of String
                                    //Showmessage('String so far = ' + sChar);
                                    inc(iIndex,1);


                                      if ((Char(Ord(Camera_array[iDigit+iIndex]))) = ',')  or
                                         (Camera_array[iDigit+iIndex] = 10 )
                                      then                                                      // End of Digits marker so exit

                                      begin
                                        //Showmessage('Comma found at the end of the Record at ' + inttohex(iDigit+iIndex));
                                        //Showmessage('String writen to Array = ' + sChar);

                                        //Showmessage('iCount so far = ' + inttostr(iCount2));
                                        Result_Array[iCount2,Mode] := StrtoInt(sChar);            // Convert ASCII to Dec number & add to Array

                                        inc(iCount2,1);
                                        inc(numofChars,1);

                                        sChar := '';                                        // Clear the String ready for the next number

                                      end;

                                  end;

                              end;

                         end;


                      //Result := iLocation;
                      //Showmessage('Search Text not Found '+ sSearch_Item);
                      //exit


            end;


            Result := iLocation;                                                        // Flag Failure
            //Showmessage('Search Text not Found ' + sSearch_Item);
            end

        else
           begin
            //Showmessage('Search Item = 0 so search not undertaken for ' + sSearch_Item);
            Result_Array[Status_Flag,0] := 5;
           end;

    end;              // End of Function


Function Search_Number7x2(const sSearch_Item: String; Mode: Integer;  var Result_Array: T7x2DIM_Array) : Integer;


  // Search for String of item to find and return 'Result Array'
  // Pass into Function, Search Item and array to pass back

    begin
    var numofChars: Integer :=0;

    If Result_Array[Status_Flag,0] <> 4  then
      begin

        var iLocation := Find(sSearch_Item, 0, Cusfilesize);                      // Search whole Camera array

        if iLocation <> -1  then                                                  // Look up start address of Search Item
          begin
            var iCount := 0;                                                    // Find seven numbers to place in array
            sChar := '';                                                        // Reset Char String var
            var iIndex :=0;
            iCount2 := 0;

                    for var iDigit :=iLocation to iLocation + 118 do            // Add all digits in group

                       begin

                          //Showmessage('Now at ' + inttohex(iDigit+iIndex));

                          //Showmessage('Moving to 0A');
                          While (Camera_array[iDigit+iIndex] <> 10)  do            // Skip Forwad until we find '0a' in the array
                          begin

                            if (Camera_array[iDigit+iIndex] = 93) or (numofChars > 7) then   // End of Record marker so exit
                              begin                                               // 5D 2C indicates end of Record
                                //Showmessage('At the end of the Record ' + inttohex(iDigit+iIndex) + ' and found ' + inttostr(Camera_array[iDigit+iIndex]));
                                Result_Array[Status_flag,Mode] := 1;                     // Set 'Read' flag to true
                                Result := iLocation;
                              {
                                if sSearch_Item = 'D229' then
                                  begin
                                  Showmessage('Result at ' + sSearch_Item + ' passed to array = '
                                  + inttostr(Result_Array[0,Mode]) + ',' + inttostr(Result_Array[1,Mode]) + ','  + inttostr(Result_Array[2,Mode]) + ','  + inttostr(Result_Array[3,Mode]) + ','
                                  + inttostr(Result_Array[4,Mode]) + ','  + inttostr(Result_Array[5,Mode]) + ','  + inttostr(Result_Array[6,Mode]) + ','  + inttostr(Result_Array[7,Mode]));
                                  end;
                               }
                                exit
                              end;

                          inc(iIndex,1);                                        // Add one to lookup Index
                          end;

                          inc(iIndex,1);                                        // Step over '0a' to next digit
                          //Showmessage('Steped over 0A to ' + inttohex(iDigit+iIndex));


                            //Showmessage('Skip Spaces');
                            While (Char(Ord(Camera_array[iDigit+iIndex]))) = ' ' do     // Skip Spaces until we find first value
                            begin
                            inc(iIndex,1);                                      // Add one to lookup Index
                            end;

                            //Showmessage('End of Spaces at ' + inttohex(iDigit+iIndex));



                            if Camera_array[iDigit+iIndex] > 41 then            // Until at first required number in file
                            begin
                            //Showmessage('Checking Number at ' + inttohex(iDigit+iIndex) + ' and found ' + inttohex(Camera_array[iDigit+iIndex]) +' which is =' + inttostr(Camera_array[iDigit+iIndex]-48));


                                While (Camera_array[iDigit+iIndex] >47 ) and (Camera_array[iDigit+iIndex] < 57 ) do         // 0 .. 9
                                begin
                                  Asc := Ord(Camera_array[iDigit+iIndex]);          // Convert Byte Array to
                                  sChar := sChar + Char(Asc);                       // Extract 'ASCII' number from Array
                                                                                    // add number found to end of String
                                  //Showmessage('String so far = ' + sChar);
                                  inc(iIndex,1);


                                    if ((Char(Ord(Camera_array[iDigit+iIndex]))) = ',')  or
                                       (Camera_array[iDigit+iIndex] = 10 )
                                    then                                                      // End of Digits marker so exit

                                    begin
                                      //Showmessage('Comma found at the end of the Record at ' + inttohex(iDigit+iIndex));
                                      //Showmessage('String writen to Array = ' + sChar);

                                      //Showmessage('iCount so far = ' + inttostr(iCount2));
                                      Result_Array[iCount2,Mode] := StrtoInt(sChar);            // Convert ASCII to Dec number & add to Array

                                      inc(iCount2,1);
                                      inc(numofChars,1);

                                      sChar := '';                                        // Clear the String ready for the next number

                                    end;

                                end;

                            end;

                       end;


                    //Result := iLocation;
                    //Showmessage('Search Text not Found '+ sSearch_Item);
                    //exit

                end;



         Result := iLocation;                                                        // Flag Failure
         //Showmessage('Search Text not Found '+ sSearch_Item);
            end

        else
           begin
            //Showmessage('Search Item = 0 so search not undertaken for ' + sSearch_Item);
            Result_Array[Status_Flag,0] := 5;
           end;


    end;              // End of Function


  Function Search_Number7x4(const sSearch_Item: String; Mode: Integer;  var Result_Array: T7x4DIM_Array) : Integer;


  // Search for String of item to find and return 'Result Array'
  // Pass into Function, Search Item and array to pass back

    begin
    var numofChars: Integer :=0;

    If Result_Array[Status_Flag,Mode] <> 4  then
      begin

        var iLocation := Find(sSearch_Item, 0, Cusfilesize);                      // Search whole Camera array

        if iLocation <> -1  then                                                  // Look up start address of Search Item
          begin
            var iCount := 0;                                                    // Find seven numbers to place in array
            sChar := '';                                                        // Reset Char String var
            var iIndex :=0;
            iCount2 := 0;

                    for var iDigit :=iLocation to iLocation + 118 do            // Add all digits in group

                       begin

                          //Showmessage('Now at ' + inttohex(iDigit+iIndex));

                          //Showmessage('Moving to 0A');
                          While (Camera_array[iDigit+iIndex] <> 10)  do            // Skip Forwad until we find '0a' in the array
                          begin

                            if (Camera_array[iDigit+iIndex] = 93) or (numofChars > 7) then  // End of Record marker so exit
                              begin                                               // 5D 2C indicates end of Record
                                //Showmessage('At the end of the Record ' + inttohex(iDigit+iIndex) + ' and found ' + inttostr(Camera_array[iDigit+iIndex]));
                                Result_Array[Status_flag,Mode] := 1;                     // Set 'Read' flag to true
                                Result := iLocation;
                              {
                                if sSearch_Item = 'D229' then
                                  begin
                                  Showmessage('Result at ' + sSearch_Item + ' passed to array = '
                                  + inttostr(Result_Array[0,Mode]) + ',' + inttostr(Result_Array[1,Mode]) + ','  + inttostr(Result_Array[2,Mode]) + ','  + inttostr(Result_Array[3,Mode]) + ','
                                  + inttostr(Result_Array[4,Mode]) + ','  + inttostr(Result_Array[5,Mode]) + ','  + inttostr(Result_Array[6,Mode]) + ','  + inttostr(Result_Array[7,Mode]));
                                  end;
                               }
                                exit
                              end;

                          inc(iIndex,1);                                        // Add one to lookup Index
                          end;

                          inc(iIndex,1);                                        // Step over '0a' to next digit
                          //Showmessage('Steped over 0A to ' + inttohex(iDigit+iIndex));


                            //Showmessage('Skip Spaces');
                            While (Char(Ord(Camera_array[iDigit+iIndex]))) = ' ' do     // Skip Spaces until we find first value
                            begin
                            inc(iIndex,1);                                      // Add one to lookup Index
                            end;

                            //Showmessage('End of Spaces at ' + inttohex(iDigit+iIndex));



                            if Camera_array[iDigit+iIndex] > 41 then            // Until at first required number in file
                            begin
                            //Showmessage('Checking Number at ' + inttohex(iDigit+iIndex) + ' and found ' + inttohex(Camera_array[iDigit+iIndex]) +' which is =' + inttostr(Camera_array[iDigit+iIndex]-48));


                                While (Camera_array[iDigit+iIndex] >47 ) and (Camera_array[iDigit+iIndex] < 57 ) do         // 0 .. 9
                                begin
                                  Asc := Ord(Camera_array[iDigit+iIndex]);          // Convert Byte Array to
                                  sChar := sChar + Char(Asc);                       // Extract 'ASCII' number from Array
                                                                                    // add number found to end of String
                                  //Showmessage('String so far = ' + sChar);
                                  inc(iIndex,1);


                                    if ((Char(Ord(Camera_array[iDigit+iIndex]))) = ',')  or
                                       (Camera_array[iDigit+iIndex] = 10 )
                                    then                                                      // End of Digits marker so exit

                                    begin
                                      //Showmessage('Comma found at the end of the Record at ' + inttohex(iDigit+iIndex));
                                      //Showmessage('String writen to Array = ' + sChar);

                                      //Showmessage('iCount so far = ' + inttostr(iCount2));
                                      Result_Array[iCount2,Mode] := StrtoInt(sChar);            // Convert ASCII to Dec number & add to Array

                                      inc(iCount2,1);
                                      inc(numofChars,1);

                                      sChar := '';                                        // Clear the String ready for the next number

                                    end;

                                end;

                            end;

                       end;


                    //Result := iLocation;
                    //Showmessage('Search Text not Found '+ sSearch_Item);
                    //exit

                end;



         Result := iLocation;                                                        // Flag Failure
         //Showmessage('Search Text not Found '+ sSearch_Item);
            end

        else
           begin
            //Showmessage('Search Item = 0 so search not undertaken for ' + sSearch_Item);
            Result_Array[Status_Flag,Mode] := 5;
           end;


    end;              // End of Function

end.                  // End of Unit


