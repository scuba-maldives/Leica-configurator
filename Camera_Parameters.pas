unit Camera_Parameters;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Notification;

{
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
}
    procedure Decode_Header();

    var found_text_position : Integer;

implementation

USES  Main_FormFMX, Constants, Arrays, DecodeFMX, RecodeFMX, Common_Parameters, CustomFMX, FandPs;


procedure Decode_Header();

  begin


    if (FileType  = 'Import') or (FileType  = 'Export')  then

      begin
             if (FileType  = 'Import') then
                begin
                     Clear_Status_Flags(0);
                end;



             if (vCameraModel ='LEICA SL3') or (vCameraModel ='LEICA Fac') then  // Decode Import file for Which Camera?
               begin

               LeftDial  := True;                                                // Turn on or off dependant on specific camera type
               RearDial  := True;
               Button3v  := True;
               Button4v  := True;
               Button9v  := True;
               Button10v := True;
               Button20v := True;
               ButtonFnv := True;


               NUMCUSTOMSETTINGS  :=  6;

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

               end

        else

             if (vCameraModel = 'LEICA SL3-S') then
               begin

               LeftDial  := True;
               RearDial  := True;
               Button3v  := True;
               Button4v  := True;
               Button9v  := True;
               Button10v := True;
               Button20v := True;
               ButtonFnv := True;

               NUMCUSTOMSETTINGS  :=  6;

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               Post_Digit  := (',' + #13 + #10);                                // LF four spaces Close bracket then CR/LF again
               Post_Digit2 := (#13 + #10);
               EOF := (#13 + #10 + '    ' + ']' + ','  + #13 + #10 + '    ');   // Added CR for SL3-S in each Record.



               end

        else

             if vCameraModel = 'LEICA SL2-S' then
               begin

               LeftDial  := False;
               RearDial  := True;
               Button3v  := True;
               Button4v  := True;
               Button9v  := True;
               Button10v := True;
               Button20v := True;
               ButtonFnv := True;

               NUMCUSTOMSETTINGS := 6;

               Copyright_Value[Status_Flag]:= '4';

               VidPro_Value[Status_Flag]:= 4;                                   // Four indicates to the Search algorithm
               LeftDial_Video_Value[Status_Flag,0]:= 4;                         // that it should not look for this value
               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               RearDial_Photo_Value[Status_Flag,0]:= 4;

               RightDial_Photo_Value[Status_Flag,0]:= 4;

               Button20_Value[Status_Flag,0]:= 4;

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

              end


        else

             if vCameraModel = 'LEICA SL2' then
               begin

               LeftDial  := False;
               RearDial  := True;
               Button3v  := True;
               Button4v  := True;
               Button9v  := True;
               Button10v := True;
               Button20v := True;
               ButtonFnv := True;

               NUMCUSTOMSETTINGS := 6;

               Copyright_Value[Status_Flag]:= '4';

               VidPro_Value[Status_Flag]:= 4;                                   // Four indicates to the Search algorithm
               LeftDial_Video_Value[Status_Flag,0]:= 4;                         // that it should not look for this value
               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               RearDial_Photo_Value[Status_Flag,0]:= 4;

               RightDial_Photo_Value[Status_Flag,0]:= 4;

               Button20_Value[Status_Flag,0]:= 4;

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

              end


        else

             if vCameraModel ='LEICA SL' then
             begin

               LeftDial  := False;
               RearDial  := False;
               Button3v  := True;
               Button4v  := True;
               Button9v  := True;
               Button10v := False;
               Button20v := True;
               ButtonFnv := False;

               NUMCUSTOMSETTINGS:=4;

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               VidPro_Value[Status_Flag]:= 4;                                   // Four indicates to the Search algorithm
               LeftDial_Video_Value[Status_Flag,0]:= 4;                         // that it should not look for this value
               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               RearDial_Photo_Value[Status_Flag,0]:= 4;
               RightDial_Photo_Value[Status_Flag,0]:= 4;


               //Button3 _Value[Status_Flag]:= 4;
               //Button4 _Value[Status_Flag]:= 4;
               //Button9 _Value[Status_Flag]:= 4;
               Button10_Value[Status_Flag,0]:= 4;

               //FnButton_Value[Status_Flag]:= 4;


               JSAFMode_Value[Status_Flag]:= 4;
               JSMFMode_Value[Status_Flag]:= 4;
               JSLock_Value[Status_Flag]:= 4;
               JSOPMode_Value[Status_Flag]:= 4;

               PASMMode_Value[Status_Flag]:= 4;
               Noise_LE_Value[Status_Flag]:= 4;
               DNG_Res_Value[Status_Flag]:= 4;
               PANNING_Value[Status_Flag]:= 4;
               Shutter_Value[Status_Flag]:= 4;

               Contrast0_Value[Status_Flag]:= 4;
               Highlight0_Value[Status_Flag]:= 4;
               Shadow0_Value[Status_Flag]:= 4;
               Sharpness0_Value[Status_Flag]:= 4;
               Saturation0_Value[Status_Flag]:= 4;

               Contrast1_Value[Status_Flag]:= 4;
               Highlight1_Value[Status_Flag]:= 4;
               Shadow1_Value[Status_Flag]:= 4;
               Sharpness1_Value[Status_Flag]:= 4;
               Saturation1_Value[Status_Flag]:= 4;
               Contrast2_Value[Status_Flag]:= 4;
               Highlight2_Value[Status_Flag]:= 4;
               Shadow2_Value[Status_Flag]:= 4;
               Sharpness2_Value[Status_Flag]:= 4;
               Saturation2_Value[Status_Flag]:= 4;
               Contrast3_Value[Status_Flag]:= 4;
               Highlight3_Value[Status_Flag]:= 4;
               Shadow3_Value[Status_Flag]:= 4;
               Sharpness3_Value[Status_Flag]:= 4;
               Contrast4_Value[Status_Flag]:= 4;
               Highlight4_Value[Status_Flag]:= 4;
               Shadow4_Value[Status_Flag]:= 4;
               Sharpness4_Value[Status_Flag]:= 4;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

             end


        else

             if vCameraModel ='LEICA Q2' then
             begin

               LeftDial  := False;
               RearDial  := False;
               Button3v  := False;
               Button4v  := False;
               Button9v  := False;
               Button10v := False;
               Button20v := True;
               ButtonFnv := False;

               NUMCUSTOMSETTINGS := 6;

               Setting[4] := 'FF16' ;
               Setting[5] := 'FF17' ;

               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Video_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

             end


        else

             if vCameraModel ='LEICA Q' then
             begin

               LeftDial  := False;
               RearDial  := False;
               Button3v  := False;
               Button4v  := False;
               Button9v  := False;
               Button10v := False;
               Button20v := True;
               ButtonFnv := False;

               NUMCUSTOMSETTINGS := 6;

               Setting[4] := 'FF16' ;
               Setting[5] := 'FF17' ;

               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Video_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

             end

        else

             if vCameraModel = 'LEICA Q3 43' then
             begin

               LeftDial  := False;
               RearDial  := False;
               Button3v  := False;
               Button4v  := False;
               Button9v  := False;
               Button10v := False;
               Button20v := True;
               ButtonFnv := False;

               NUMCUSTOMSETTINGS := 6;

               VidPro_Value[Status_Flag]:= 4;                                   // Four indicates to the Search algorithm
               LeftDial_Video_Value[Status_Flag,0]:= 4;                         // that it should not look for this value
               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               JSAFMode_Value[Status_Flag]:= 4;
               JSMFMode_Value[Status_Flag]:= 4;
               JSLock_Value[Status_Flag]:= 4;
               JSOPMode_Value[Status_Flag]:= 4;

               PASMMode_Value[Status_Flag]:= 4;

               var Dontknow: String := 'D002';

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

             end

          else

             if vCameraModel ='LEICA M' then
             begin

               LeftDial  := False;
               RearDial  := False;
               Button3v  := True;
               Button4v  := False;
               Button9v  := False;
               Button10v := False;
               Button20v := False;
               ButtonFnv := False;

               NUMCUSTOMSETTINGS := 4;

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Video_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

             end

          else

             If vCameraModel = 'LEICA M11' then
             begin

               LeftDial  := False;
               RearDial  := False;
               Button3v  := True;
               Button4v  := False;
               Button9v  := False;
               Button10v := False;
               Button20v := False;
               ButtonFnv := False;

               NUMCUSTOMSETTINGS := 6;

               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Video_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               Setting[4] := 'D0AD' ;
               Setting[5] := 'D0AE' ;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

               end

          else

             If vCameraModel = 'LEICA Q2 MON' then
             begin
               //ShowMessage('The File is from a Q" Mono');

               LeftDial  := False;
               RearDial  := False;
               Button3v  := False;
               Button4v  := False;
               Button9v  := False;
               Button10v := False;
               Button20v := True;
               ButtonFnv := False;

               NUMCUSTOMSETTINGS := 6;

               LeftDial_Photo_Value[Status_Flag,0]:= 4;
               LeftDial_Video_Value[Status_Flag,0]:= 4;
               LeftDial_Rotation_Value[Status_Flag]:= 4;

               Setting[4] := 'FF16' ;
               Setting[5] := 'FF17' ;

               Post_Digit  := (',' + #10);
               Post_Digit2 := (#10);
               EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');        // LF four spaces Close bracket then LF again

               end


              else
                  Begin
                  ShowMessage('The File is from an Unsupported Camera!');
                  End;


                  SetLength(Camera_array, CUSfileSize);

                  if Debug then
                  //ShowMessage('The File is now size '+ inttostr(CUSfilesize));

              end


           else

           if FileType  = 'Custom'  then
             begin
               ShowMessage('Decoding file from '+ vCameraModel);

               if vCameraModel = ''  then
                   begin

                   NUMCUSTOMSETTINGS := 6;

                   Setting[4] := 'D0AD' ;
                   Setting[5] := 'D0AE' ;

                   Post_Digit  := (',' + #10);
                   Post_Digit2 := (#10);
                   EOF         := (#10 + '    ' + ']' + ',' + #10 + '    ');    // LF four spaces Close bracket then LF again

                   end;

              end;

    end;            // End of 'FileType' statement

end.                //   End of Unit


