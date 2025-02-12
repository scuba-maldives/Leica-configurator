unit RecodeFMX;

interface

uses
  Data.Bind.Components, Data.Bind.Grid, FandPs, FMX.Controls, 
  FMX.Controls.Presentation, FMX.Dialogs, FMX.Forms, FMX.Graphics, 
  FMX.StdCtrls, FMX.Types, MyTypes, System.SysUtils, System.Types, 
  System.UITypes;



  procedure RunRecode();
  procedure Save_Custom_Text();

type

  TRecode = class(TForm)

 end;

implementation

USES  Main_FormFMX, Constants, Arrays, Common_Parameters, Camera_Parameters, DecodeFMX;



procedure RunRecode();

var
  mybyte: Byte;
  valid : Integer;
  iStart: Integer;

   Begin
      //////////////////////////////   Test Code  ////////////////////////////////////////////

      if vSingleRecord = True then

      Begin
          iStart:=0;

          Begin
             sText := ISO;     //ISO   i.e. 500F
             if ISO_Value[Status_Flag] = 2 then                                          // If update Flag is correct
             valid := Write_to_DB
             (sText, iStart, Length(Camera_array)-1, ISO_Value);
             If Valid > 1 Then                  // Find Section in DB When Found, write the new details in there
             ISO_Value[Status_Flag] := 3;
          End;

      End;              // End of If Single Record



      //////////////////////////////    Production Code  /////////////////////////////////////////////////////////////////////
      ///                                                                                                                  ///
      ///                                                                                                                  ///
      ///                                                                                                                  ///
      ///  Takes all values from the Settings arrays and posts them into the database (Camera_Array)                       ///
      ///                                                                                                                  ///
      ///  Then saves that Camera_Array into a new settings file based on the templates of the camera to be exported.      ///
      ///                                                                                                                  ///
      ///                                                                                                                  ///
      ///                                                                                                                  ///
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




      if vSingleRecord = False then

      Begin

         Begin

                // Wheels and Buttons


                 // Programme Mode

                 //LeftWheel_P  i.e. 'D229';
                 sText := LeftWheel_P_Photo ;
                 if (LeftDial_Photo_Value[Status_Flag,P]) = 2 then                // Is 'Changed' flag set to True
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1, P, LeftDial_Photo_Value);    // Write new value to Camera_Array
                   If Valid > 1 Then
                  LeftDial_Photo_Value[Status_Flag,P] := 3;                                  // Change Status Flag to show item has been changed
                  end;

                  //BackWheel_P  i.e. 'D1ED';
                 sText := BackWheel_P_Photo ;
                 if (RearDial_Photo_Value[Status_Flag,P]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1, P, RearDial_Photo_Value);
                   If Valid > 1 Then
                 RearDial_Photo_Value[Status_Flag,P] := 3;
                 end;
                 //RightWheel_P  i.e. 'D0D8';
                 sText := RightWheel_P_Photo ;
                 if (RightDial_Photo_Value[Status_Flag,P]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  P, RightDial_Photo_Value);
                   If Valid > 1 Then
                 RightDial_Photo_Value[Status_Flag,P] := 3;
                 end;

                 // Aperture Mode

                  //LeftWheel_A  i.e. 'D22A';
                 sText := LeftWheel_A_Photo ;
                 if (LeftDial_Photo_Value[Status_Flag,A]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  A, LeftDial_Photo_Value);
                   If Valid > 1 Then
                 LeftDial_Photo_Value[Status_Flag,A] := 3;
                 end;
                  //BackWheel_A  i.e. 'D1EF';
                 sText := BackWheel_A_Photo ;
                 if (RearDial_Photo_Value[Status_Flag,A]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  A, RearDial_Photo_Value);
                   If Valid > 1 Then
                 RearDial_Photo_Value[Status_Flag,A] := 3;
                 end;
                 //RightWheel_A  i.e. 'D0DA';
                 sText := RightWheel_A_Photo ;
                 if (RightDial_Photo_Value[Status_Flag,A]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  A, RightDial_Photo_Value);
                   If Valid > 1 Then
                   showmessage('Right Dial Saved to file');
                 RightDial_Photo_Value[Status_Flag,A] := 3;
                 end;

                 // Shutter Mode

                  //LeftWheel_S  i.e. 'D22B';
                 sText := LeftWheel_S_Photo ;
                 if (LeftDial_Photo_Value[Status_Flag,S]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  S, LeftDial_Photo_Value);
                   If Valid > 1 Then
                  LeftDial_Photo_Value[Status_Flag,S] := 3;
                 end;
                  //BackWheel_S  i.e. 'D1D0';
                 sText := BackWheel_S_Photo ;
                 if (RearDial_Photo_Value[Status_Flag,S]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  S, RearDial_Photo_Value);
                   If Valid > 1 Then
                 RearDial_Photo_Value[Status_Flag,S] := 3;
                end;

                 //RightWheel_S  i.e. 'D0DB2Dim';
                 sText := RightWheel_S_Photo ;
                 if (RightDial_Photo_Value[Status_Flag,S]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  S, RightDial_Photo_Value);
                   If Valid > 1 Then
                 RightDial_Photo_Value[Status_Flag,S] := 3;
                 end;

                 // Manual Mode

                  //LeftWheel_M  i.e. 'D22C';
                 sText := LeftWheel_M_Photo ;
                 if (LeftDial_Photo_Value[Status_Flag,M]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  M, LeftDial_Photo_Value);
                   If Valid > 1 Then
                  LeftDial_Photo_Value[Status_Flag,M] := 3;
                 end;
                  //BackWheel_M  i.e. 'D1D1';
                 sText := BackWheel_M_Photo ;
                 if (RearDial_Photo_Value[Status_Flag,M]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  M, RearDial_Photo_Value);
                   If Valid > 1 Then
                  RearDial_Photo_Value[Status_Flag,M] := 3;
                 end;
                 //RightWheel_M  i.e. 'D0DC';
                 sText := RightWheel_M_Photo ;
                 if (RightDial_Photo_Value[Status_Flag,M]) = 2 then
                 begin
                   valid := Write_to_DB2Dim(sText, iStart, Length(Camera_array)-1,  M, RightDial_Photo_Value);
                   If Valid > 1 Then
                  RightDial_Photo_Value[Status_Flag,M] := 3;
                  end;


                  // Buttons in Photo Mode

                 //Button3  i.e. 'D195';
                 sText := Button3 ;
                 if (Button3_Value[Status_Flag,Photo]) =2 then                  // Is 'Changed' flag set to Changed
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button3_Value);      // Write new value to Camera_Array
                   If Valid > 1 Then
                  Button3_Value[Status_Flag,Photo] := 3;                        // Change Status Flag to show item has been changed
                end;
                 //Button4  i.e. 'D1D6';
                 sText := Button4 ;
                 if (Button4_Value[Status_Flag,Photo]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button4_Value);
                   If Valid > 1 Then
                 Button4_Value[Status_Flag,Photo] := 3;
                 end;
                 //Button9  i.e. 'D1D7';
                 sText := Button9 ;
                 if (Button9_Value[Status_Flag,Photo]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button9_Value);
                   If Valid > 1 Then
                 Button9_Value[Status_Flag,Photo]:= 3;
                 end;
                 //Button10  i.e. 'D1DA';
                 sText := Button10 ;
                 if (Button10_Value[Status_Flag,Photo]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button10_Value);
                   If Valid > 1 Then
                Button10_Value[Status_Flag,Photo] := 3;
                end;
                 //Button20  i.e. 'D193';
                 sText := Button20 ;
                 if (Button20_Value[Status_Flag,Photo]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button20_Value);
                   If Valid > 1 Then
                 Button20_Value[Status_Flag,Photo] := 3;
                 end;
                 //FnButton  i.e. 'D191';
                 sText := FnButton ;
                 if (FnButton_Value[Status_Flag,Photo]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, FnButton_Value);
                   If Valid > 1 Then
                 FnButton_Value[Status_Flag,Photo] := 3;
                 end;


                  // Buttons in Video Mode

                 //Button3  i.e. 'D195';
                 sText := Button3 ;
                 if (Button3_Value[Status_Flag,Video]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button3_Value);
                   If Valid > 1 Then
                 Button4_Value[Status_Flag,Video] := 3;
                 end;
                 //Button4  i.e. 'D1D6';
                 sText := Button4 ;
                 if (Button4_Value[Status_Flag,Video]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button4_Value);
                   If Valid > 1 Then
                Button4_Value[Status_Flag,Video] := 3;
                 end;
                 //Button9  i.e. 'D1D7';
                 sText := Button9 ;
                 if (Button9_Value[Status_Flag,Video]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button9_Value);
                   If Valid > 1 Then
                   Button9_Value[Status_Flag,Video] := 3;
                 end;
                 //Button10  i.e. 'D1DA';
                 sText := Button10 ;
                 if (Button10_Value[Status_Flag,Video]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button10_Value);
                   If Valid > 1 Then
                  Button10_Value[Status_Flag,Video] := 3;
                 end;
                 //Button20  i.e. 'D193';
                 sText := Button20 ;
                 if (Button20_Value[Status_Flag,Video]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, Button20_Value);
                   If Valid > 1 Then
                  Button20_Value[Status_Flag,Video] := 3;
                 end;
                 //FnButton  i.e. 'D191';
                 sText := FnButton ;
                 if (FnButton_Value[Status_Flag,Video]) =2 then
                 begin
                   valid := Write_to_DB7x2(sText, iStart, Length(Camera_array)-1, FnButton_Value);
                   If Valid > 1 Then
                 FnButton_Value[Status_Flag,Video] := 3;
                 end;

                  // All other Functions and Settings

                 //ISO   i.e. 500F
                 sText := ISO;
                 if (ISO_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, ISO_Value );
                 If Valid > 1 Then
                 ISO_Value[Status_Flag] := 3;
                 end;




                 //ExpComp   i.e. 5010
                 sText := ExpComp;
                 if (Exp_Comp_value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, Exp_Comp_value );
                 If Valid > 1 Then
                 Exp_Comp_value[Status_Flag] := 3;
                 end;
                 //WHITEBALANCE   i.e. 5005
                 sText := WHITEBALANCE;
                 if (WhiteBalance_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, WhiteBalance_Value );
                 If Valid > 1 Then
                 WhiteBalance_Value[Status_Flag] := 3;
                 end;
                 //PASM_Mode   i.e. 500E
                 sText := PASM_Mode;
                 if (PASMMode_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, PASMMode_Value );
                 If Valid > 1 Then
                 PASMMode_Value[Status_Flag] := 3;
                 end;
                 //DRIVEMODE       i.e.'5013';
                 sText := DRIVEMODE;
                 if (DRIVEMODE_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, DRIVEMODE_Value );
                 If Valid > 1 Then
                 DRIVEMODE_Value[Status_Flag] := 3;
                 end;
                 //AFMODE       i.e.'500A';
                 sText := Focus;
                 if (Focus_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, Focus_Value );
                 If Valid > 1 Then
                 Focus_Value[Status_Flag] := 3;
                 end;
                 //ISMODE  i.e. 'D046';
                 sText := IBIS;
                 if (IBIS_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, IBIS_Value );
                 If Valid > 1 Then
                 IBIS_Value[Status_Flag] := 3;
                 end;
                 //NR_LE_onoff  i.e. 'D822';
                 sText := NR_LE_onoff;
                 if (Noise_LE_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, Noise_LE_Value);
                 If Valid > 1 Then
                 Noise_LE_Value[Status_Flag] := 3;
                 end;
                 //JPGRes  i.e. 'D00F';
                 sText := JPGRes;
                 if (JPG_Res_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, JPG_Res_Value);
                 If Valid > 1 Then
                 ISO_Value[Status_Flag] := 3;
                 end;
                 //DNG  i.e. 'D822';
                 sText := DNG;
                 if (DNG_Res_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, DNG_Res_Value);
                 If Valid > 1 Then
                 DNG_Res_Value[Status_Flag] := 3;
                 end;
                 //SensorFormat  i.e. 'D822';
                 sText := SensorFormat;
                 if (SensorFormat_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, SensorFormat_Value);
                 If Valid > 1 Then
                 SensorFormat_Value[Status_Flag] := 3;
                 end;
                  //Aspect Ratio  i.e. 'D822';
                 sText := AspectRatio;
                 if (AspectRatio_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1, AspectRatio_Value);
                 If Valid > 1 Then
                 AspectRatio_Value[Status_Flag] := 3;
                 end;
                 sText := FS_Selector;     // 'D13E';
                 if (FS_Selector_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,FS_Selector_Value);
                 If Valid > 1 Then
                 FS_Selector_Value[Status_Flag] := 3;
                 end;


                  // Film Styles

                 sText := Contrast0;     // 'D13E';
                 if (Contrast0_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Contrast0_Value);
                 If Valid > 1 Then
                 Contrast0_Value[Status_Flag] := 3;
                 end;
                 sText := Highlight0;     // 'D13E';
                 if (Highlight0_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Highlight0_Value);
                 If Valid > 1 Then
                 Highlight0_Value[Status_Flag] := 3;
                 end;
                 sText := Shadow0;     // 'D13E';
                 if (Shadow0_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Shadow0_Value);
                 If Valid > 1 Then
                 Shadow0_Value[Status_Flag] := 3;
                 end;
                 sText := Sharpness0;     // 'D13E';
                 if (Sharpness0_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Sharpness0_Value);
                 If Valid > 1 Then
                 Sharpness0_Value[Status_Flag] := 3;
                 end;
                 sText :=Saturation0;     // 'D13E';
                 if (Saturation0_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Saturation0_Value);
                 If Valid > 1 Then
                 Saturation0_Value[Status_Flag] := 3;
                 end;
                 sText := Contrast1;     // 'D08D';
                 if (Contrast1_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Contrast1_Value);
                 If Valid > 1 Then
                 Contrast1_Value[Status_Flag] := 3;
                 end;
                 sText := Highlight1;     // 'D13E';
                 if (Highlight1_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Highlight1_Value);
                 If Valid > 1 Then
                 Highlight1_Value[Status_Flag] := 3;
                 end;
                 sText := Shadow1;     // 'D13E';
                 if (Shadow1_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Shadow1_Value);
                 If Valid > 1 Then
                 Shadow1_Value[Status_Flag] := 3;
                 end;
                 sText := Sharpness1;     // 'D13E';
                 if (Sharpness1_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Sharpness1_Value);
                 If Valid > 1 Then
                 Sharpness1_Value[Status_Flag] := 3;
                 end;
                 sText :=Saturation1;     // 'D13E';
                 if (Saturation1_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Saturation1_Value);
                 If Valid > 1 Then
                 Saturation1_Value[Status_Flag] := 3;
                 end;
                 sText := Contrast2;     // 'D13E';
                 if (Contrast2_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Contrast2_Value);
                 If Valid > 1 Then
                 Contrast2_Value[Status_Flag] := 3;
                 end;
                 sText := Highlight2;     // 'D13E';
                 if (Highlight2_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Highlight2_Value);
                 If Valid > 1 Then
                 Highlight2_Value[Status_Flag] := 3;
                 end;
                 sText := Shadow2;     // 'D13E';
                 if (Shadow2_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Shadow2_Value);
                 If Valid > 1 Then
                 Shadow2_Value[Status_Flag] := 3;
                 end;
                 sText := Sharpness2;     // 'D13E';
                 if (Sharpness2_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Sharpness2_Value);
                 If Valid > 1 Then
                 ISO_Value[Status_Flag] := 3;
                 end;
                 sText :=Saturation2;     // 'D13E';
                 if (Saturation2_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Saturation2_Value);
                 If Valid > 1 Then
                 Saturation2_Value[Status_Flag] := 3;
                 end;
                 sText := Contrast3;     // 'D13E';
                 if (Contrast3_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Contrast3_Value);
                 If Valid > 1 Then
                 Contrast3_Value[Status_Flag] := 3;
                 end;
                 sText := Highlight3;     // 'D13E';
                 if (Highlight3_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Highlight3_Value);
                 If Valid > 1 Then
                 Highlight3_Value[Status_Flag] := 3;
                 end;
                 sText := Shadow3;     // 'D13E';
                 if (Shadow3_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Shadow3_Value);
                 If Valid > 1 Then
                 Shadow3_Value[Status_Flag] := 3;
                 end;
                 sText := Sharpness3;     // 'D13E';
                 if (Sharpness3_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Sharpness3_Value);
                 If Valid > 1 Then
                 Sharpness3_Value[Status_Flag] := 3;
                 end;
                 sText := Contrast4;     // 'D13E';
                 if (Contrast4_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Contrast4_Value);
                 If Valid > 1 Then
                 Contrast4_Value[Status_Flag] := 3;
                 end;
                 sText := Highlight4;     // 'D13E';
                 if (Highlight4_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Highlight4_Value);
                 If Valid > 1 Then
                 Highlight4_Value[Status_Flag] := 3;
                 end;
                 sText := Shadow4;     // 'D13E';
                 if (Shadow4_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Shadow4_Value);
                 If Valid > 1 Then
                 Shadow4_Value[Status_Flag] := 3;
                 end;
                 sText := Sharpness4;     // 'D13E';
                 if (Sharpness4_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Sharpness4_Value);
                 If Valid > 1 Then
                 Sharpness4_Value[Status_Flag] := 3;
                 end;
                 sText := Joystick_AF;      //'D02B';
                 if (JSAFMode_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,JSAFMode_Value);
                 If Valid > 1 Then
                 JSAFMode_Value[Status_Flag] := 3;
                 end;
                 sText := Joystick_Manual;    //'D02C';
                 if (JSMFMode_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,JSMFMode_Value);
                 If Valid > 1 Then
                 JSMFMode_Value[Status_Flag] := 3;
                 end;
                 sText := Joystick_Mode;    //'D0CE';
                 if (JSOPMode_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,JSOPMode_Value);
                 If Valid > 1 Then
                 JSOPMode_Value[Status_Flag] := 3;
                 end;
                 sText := Joystick_Lock;  //'D02C';
                 if (JSLock_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,JSLock_Value);
                 If Valid > 1 Then
                 JSLock_Value[Status_Flag] := 3;
                 end;
                 sText := SensorFormat;  //'D02C';
                 if (Sensor_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Sensor_Value);
                 If Valid > 1 Then
                 Sensor_Value[Status_Flag] := 3;
                 end;
                 sText :=NRJPeg;
                 if (Noise_JPG_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Noise_JPG_Value);
                 If Valid > 1 Then
                 Noise_JPG_Value[Status_Flag] := 3;
                 end;
                 sText :=MtrMode;
                 if (MeterMode_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,MeterMode_Value);
                 If Valid > 1 Then
                 MeterMode_Value[Status_Flag] := 3;
                 end;
                 sText :=NRMODE;
                 if (NMODE_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,NMODE_Value);
                 If Valid > 1 Then
                 NMODE_Value[Status_Flag] := 3;
                 end;
                 sText :=AFMethod;
                 if (AFMethod_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,AFMethod_Value);
                 If Valid > 1 Then
                 AFMethod_Value[Status_Flag] := 3;
                 end;
                 sText :=Panning;
                 if (Panning_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Panning_Value);
                 If Valid > 1 Then
                 Panning_Value[Status_Flag] := 3;
                 end;
                 sText :=Shutter;
                 if (Shutter_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Shutter_Value);
                 If Valid > 1 Then
                 Shutter_Value[Status_Flag] := 3;
                 end;
                 sText :=LeftWheel_Rotation;
                 if (LeftDial_Rotation_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,LeftDial_Rotation_Value);
                 If Valid > 1 Then
                 LeftDial_Rotation_Value[Status_Flag] := 3;
                 end;
                 sText :=BackWheel_Rotation;
                 if (RearDial_Rotation_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,RearDial_Rotation_Value);
                 If Valid > 1 Then
                 RearDial_Rotation_Value[Status_Flag] := 3;
                 end;
                 sText :=RightWheel_Rotation;
                 if (RightDial_Rotation_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,RightDial_Rotation_Value);
                 If Valid > 1 Then
                 RightDial_Rotation_Value[Status_Flag] := 3;
                 end;
                 sText :=Kelvin;
                 if (Kelvin_Value[Status_Flag]) =2 then
                 begin
                 valid := Write_to_DB(sText, iStart, Length(Camera_array)-1,Kelvin_Value);
                 If Valid > 1 Then
                 Kelvin_Value[Status_Flag] := 3;
                 end;

                // Code for Video Profiles





                // Code for Text

                sText := COPYRIGHT;
                 if (COPYRIGHT_Value[Status_Flag]) = '2' then                   // Is 'Changed' flag set to True
                  begin
                    AddQuotes(Copyright_Value);                                                  // Call addquotes to add quotes around each element in the array
                    valid := Write_to_DBSTR(sText, iStart, Length(Camera_array)-1,COPYRIGHT_Value);
                    COPYRIGHT_Value[Status_Flag] := '3';
                   end;


                sText := ARTIST;
                 if (ARTIST_Value[Status_Flag]) = '2' then                      // Is 'Changed' flag set to True
                   begin
                    AddQuotes(ARTIST_Value);                                                     // Call addquotes to add quotes around each element in the array
                    valid := Write_to_DBSTR(sText, iStart, Length(Camera_array)-1,ARTIST_Value);
                    ARTIST_Value[Status_Flag] := '3';
                   end;


                  // Code for Custom Text

                   Save_Custom_Text();


         End;

      End              // End of Multiple Record


  end;                    // End of Procedure




  procedure Save_Custom_Text();

     // Search Database to replace 'SettingX' string via Locate custom strings

    begin


      if CustomText[Status_Flag] = '2' then                                     // Values have changed
        begin
          var iPosition: Integer;


             for var i := 1 to 6 do
                begin
                  var sTemp :=  CustomText[i];                                  // Add quotes around the Text in the array
                  sTemp := ('"' + sTemp + '"');
                  CustomText[i] := sTemp;                                       // Then add it to the Camera array
                 end;


             //Showmessage('Searching for ' + Setting1 );                                        // Extract text from array

              for var Custom_Index := 0 to NUMCUSTOMSETTINGS-1 do               // For each location specified in the Custom_Index
              begin

                //Showmessage('Searching for ' + Setting[Custom_Index]);

                //ShowMessage('Writing ' + CustomText[Custom_Index+1] + ' to Camera Array');

                var valid := Write_to_DBRec(Setting[Custom_Index], iPosition, Length(Camera_array)-1,CustomText[Custom_Index+1]);
              end;

             //ShowMessage('Finished');                 If Valid > 1 Then
             CustomText[Status_Flag] := '3';                                    // Values have been saved

        end;

     end;        // End of Proceedure

end.                 // End of Unit
