unit CustomFMX;

interface

uses
  Constants, Data.Bind.Components, Data.Bind.Grid, FandPs, FMX.ComboEdit, 
  FMX.Controls, FMX.Controls.Presentation, FMX.Dialogs, FMX.DialogService, 
  FMX.Edit, FMX.ExtCtrls, FMX.Forms, FMX.Graphics, FMX.Grid, FMX.Layouts, 
  FMX.ListBox, FMX.Memo, FMX.Memo.Types, FMX.Objects, FMX.ScrollBox, 
  FMX.StdCtrls, FMX.TabControl, FMX.Text, FMX.Types, MyTypes, Quick.Logger, 
  Quick.Logger.Provider.Files, System.Classes, System.SysUtils,
  System.Types, System.UITypes;


type
    TCustom = class(TForm)
    OK_1: TButton;
    Cancel: TButton;
    Label1: TLabel;
    Memo_Filename: TMemo;
    Label15: TLabel;
    CustomName: TComboEdit;
    Label16: TLabel;
    CustomNum: TComboEdit;
    PageControl1: TTabControl;
    ImageTab: TTabItem;
    Label13: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    ISO_ComboBox1: TComboEdit;
    NoiseModeCB: TComboEdit;
    MtrMode: TComboEdit;
    Noise_JPGCB: TComboEdit;
    DNG_Res: TComboEdit;
    JPG_Res: TComboEdit;
    AFMF_Tab: TTabItem;
    Label18: TLabel;
    Label19: TLabel;
    CameraTab: TTabItem;
    Label27: TLabel;
    Label29: TLabel;
    Copyright: TMemo;
    Artist: TMemo;
    FilmTab: TTabItem;
    SL3ButtonTab: TTabItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    SL3WheelTab: TTabItem;
    SL3Button3Box: TComboEdit;
    SL3Button20Box: TComboEdit;
    SL3Button9Box: TComboEdit;
    ButtonEditor: TMemo;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    SL3Button4Box: TComboEdit;
    SL3Button10Box: TComboEdit;
    SL3_Left: TImage;
    SL3_Middle: TImage;
    SL3_Right: TImage;
    Label35: TLabel;
    SL3LeftWB: TComboEdit;
    SL3BackWB: TComboEdit;
    Label36: TLabel;
    Label37: TLabel;
    SL3RightWB: TComboEdit;
    Memo1: TMemo;
    PV_Button: TSwitch;

    SL3Left_Wheel_Rotation: TSwitch;
    SL3Back_Wheel_Rotation: TSwitch;
    SL3Right_Wheel_Rotation: TSwitch;

    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    SL3FnButtonBox: TComboEdit;
    IBISBox1: TComboEdit;
    Label47: TLabel;
    Label49: TLabel;
    ExpCompBox: TComboEdit;
    PASMComboBoxW: TComboEdit;
    Label50: TLabel;
    PanningBox: TComboEdit;
    Label14: TLabel;
    Label20: TLabel;
    Saturation: TComboEdit;
    Sharpness: TComboEdit;
    Label21: TLabel;
    Label22: TLabel;
    STone: TComboEdit;
    HTone: TComboEdit;
    Label23: TLabel;
    Label24: TLabel;
    WhiteBal: TComboEdit;
    Label6: TLabel;
    FilmStyle: TComboEdit;
    Contrast: TComboEdit;
    Label7: TLabel;
    VideoTab: TTabItem;
    FocusComboBox: TComboEdit;
    AFMethodComboBox: TComboEdit;
    SensorComboBox: TComboEdit;
    Label9: TLabel;

    Photo_Film2: TLabel;
    Label10: TLabel;
    JoystickTab: TTabItem;
    Reset_Text: TLabel;
    JSAFMode: TComboEdit;
    JSMFMode: TComboEdit;
    JSLock: TComboEdit;
    JSOPMode: TComboEdit;
    JoyStickAFMode: TLabel;
    JoyStickMFMode: TLabel;
    JoyStickOpMode: TLabel;
    JoystickLock: TLabel;
    Reset: TButton;
    Button1: TButton;
    Reset_JS: TLabel;
    Label11: TLabel;
    Drive_ModeCombobox: TComboEdit;
    VideoText: TLabel;
    VidProComboBox: TComboEdit;
    Label8: TLabel;
    Noise_LE: TComboEdit;
    QButtonTab: TTabItem;
    SLButtonTab: TTabItem;
    Label12: TLabel;
    SHutterComboBox: TComboEdit;
    SLWheelTab: TTabItem;
    QWheelTab: TTabItem;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    SLBackWB: TComboEdit;
    Label25: TLabel;
    Image4: TImage;
    Image5: TImage;
    SLRightWB: TComboEdit;
    Label26: TLabel;
    ComboBox3: TComboEdit;
    Label28: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    QRightWB: TComboEdit;
    Label64: TLabel;
    SLButton3Box: TComboEdit;
    Label65: TLabel;
    Label66: TLabel;
    SLButton9Box: TComboEdit;
    Label67: TLabel;
    SLButton4Box: TComboEdit;
    Label68: TLabel;
    SLButton10Box: TComboEdit;
    Image8: TImage;
    Image9: TImage;
    StaticText4: TLabel;
    Button2: TButton;
    QButton4Box: TComboEdit;
    QButton3Box: TComboEdit;
    Label69: TLabel;
    Label70: TLabel;
    StaticText3: TLabel;
    Button3: TButton;
    ToggleSwitch1: TSwitch;
    ToggleSwitch2: TSwitch;
    ToggleSwitch4: TSwitch;
    Image10: TImage;
    Image6: TImage;
    KelvinComboBox: TComboEdit;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    FormatCB: TComboEdit;
    ResolutionCB: TComboEdit;
    FrameRateCB: TComboEdit;
    CodecCB: TComboEdit;
    CompressionCB: TComboEdit;
    YUVCB: TComboEdit;
    BitRateCB: TComboEdit;
    LogCB: TComboEdit;
    SensorCB: TComboEdit;
    AudioCB: TComboEdit;
    MediumCB: TComboEdit;
    MButtonTab: TTabItem;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Image7: TImage;
    Memo6: TMemo;
    ComboEdit1: TComboEdit;
    ComboEdit2: TComboEdit;
    Button4: TButton;


    procedure CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReadClick(Sender: TObject);
    procedure UpdateCustom();
    procedure CustomNumChange(Sender: TObject);
    procedure OK_1Click(Sender: TObject);
    procedure CustomNameChange(Sender: TObject);
    procedure CustomNameDouble(Sender: TObject);
    procedure PV_ButtonClick(Sender: TObject);
    procedure PASMComboBoxWChange(Sender: TObject);
    procedure FilmStyleChange(Sender: TObject);
    procedure SL3Button3BoxChange(Sender: TObject);
    procedure SL3Button4BoxChange(Sender: TObject);
    procedure SL3Button9BoxChange(Sender: TObject);
    procedure SL3Button10BoxChange(Sender: TObject);
    procedure SL3Button20BoxChange(Sender: TObject);
    procedure SL3FnButtonBoxChange(Sender: TObject);
    procedure Save_Value(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    procedure ResetJoyStick(Sender: TObject);
    procedure JSAFModeChange(Sender: TObject);
    procedure JSMFModeChange(Sender: TObject);
    procedure JSOPModeChange(Sender: TObject);
    procedure JSLockChange(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure ISO_ComboBox1Change(Sender: TObject);
    procedure ExpCompBoxChange(Sender: TObject);
    procedure JPG_ResChange(Sender: TObject);
    procedure DNG_ResChange(Sender: TObject);
    procedure Noise_LEChange(Sender: TObject);
    procedure IBISBox1Change(Sender: TObject);
    procedure PanningBoxChange(Sender: TObject);
    procedure NoiseModeCBChange(Sender: TObject);
    procedure MtrModeChange(Sender: TObject);
    procedure FocusComboBoxChange(Sender: TObject);
    procedure AFMethodComboBoxChange(Sender: TObject);
    procedure Drive_ModeComboBoxChange(Sender: TObject);
    procedure CopyrightChange(Sender: TObject);
    procedure ArtistChange(Sender: TObject);
    procedure SensorComboBoxChange(Sender: TObject);
    procedure ShutterComboBoxChange(Sender: TObject);
    procedure ContrastChange(Sender: TObject);
    procedure SharpnessChange(Sender: TObject);
    procedure HToneChange(Sender: TObject);
    procedure SToneChange(Sender: TObject);
    procedure SaturationChange(Sender: TObject);
    procedure WhiteBalChange(Sender: TObject);
    procedure SL3LeftWheelBoxChange(Sender: TObject);
    procedure SL3BackWheelBoxChange(Sender: TObject);
    procedure SL3RightWheelBoxChange(Sender: TObject);
    procedure Populate_DialList(Sender: TObject);
    procedure VidProComboBoxChange(Sender: TObject);
    procedure Noise_JPGCBChange(Sender: TObject);

    Procedure CommitChanges(voffset : integer; PASM_Old : integer; Close_Prog: Boolean);
    Procedure CommitDialChanges(sDial : String);
    procedure CopyrightDblClick(Sender: TObject);
    procedure ArtistDblClick(Sender: TObject);
    procedure QWheelTabContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);

    procedure Left_Wheel_RotationClick(Sender: TObject);
    procedure Back_Wheel_RotationClick(Sender: TObject);
    procedure Right_Wheel_RotationClick(Sender: TObject);
    procedure SL3WheelTabContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure KelvinComboBoxChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure CustomNameMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; var Handled: Boolean);
    procedure CustomNumMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; var Handled: Boolean);
    procedure PV_ButtonSwitch(Sender: TObject);
    procedure PV_ButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);

  private
    { Private declarations }

  public


  end;

var
  Custom1 : TCustom;
  Field_Changed :Boolean = False;
  Old_Value : Integer = 0;
  Old_Value2 : Integer = 0;
  sDial : String = '';

implementation

USES  Main_FormFMX, Arrays, DecodeFMX, RecodeFMX, Common_Parameters, Camera_Parameters, Ask_QuestionFMX;

{$R *.FMX}
{$R *.Windows.fmx MSWINDOWS}
{$R *.Macintosh.fmx MACOS}
{$R *.Surface.fmx MSWINDOWS}

procedure TCustom.ReadClick(Sender: TObject);
begin
    UpdateCustom();
end;

procedure TCustom.ExitClick(Sender: TObject);
begin
    Custom1.Close;                                                              // Close the form
end;



procedure TCustom.CancelClick(Sender: TObject);

begin

    Answer := QuestionChanges('Cancel will Reverse all changes');


              begin
                if Answer = 'true' Then
                  Begin
                     //ShowMessage('Yes was selected');

                       {Main_Form.Show; }
                        Clear_Status_Flags(0);                                  // Reset all status flags
                        DecodeFMX.RunDecode(0);                                    // Run Decode to re-read the loaded file
                        Custom1.Close;                                          // Close the form
                  End


                else if Answer = 'false' Then
                  Begin
                     //ShowMessage('No was selected');
                  end;

              end;



end;



procedure TCustom.FormCreate(Sender: TObject);
begin
      PageControl1Change(Sender);

      Memo_Filename.Text := ExtractFileName(FullFileName);
      Field_Changed := False;



      Populate_DialList(Sender);

          // Fill ComboBox with data from relevent array



          for var iLoop := 0 to  NUMCUSTOMSETTINGS do                           // Custom Numbers
            begin
              CustomNum.Items.Add  (inttostr(NoughttoSix[iLoop]));
              CustomName.Items.Add  (CustomText[iLoop]);
            end;

          CustomNum.ItemIndex     := 0;                                         // Set Combo boxes to zero
          CustomName.ItemIndex    := 0;                                         // To Show 'Default'
          PageControl1.TabIndex   := 0;


          for var iLoop := 0 to  Length(Image_Res_Text)-1 do                    //
            begin
             JPG_Res.Items.Add  (Image_Res_Text[iLoop]);
             DNG_Res.Items.Add  (Image_Res_Text[iLoop]);
            end;

          for var iLoop := 0 to  Length(MeterMode_Text)-1 do                       // DR Range
            MtrMode.Items.Add  (MeterMode_Text[iLoop]);

          if (FilmStyle_Value[Status_Flag] >0 )  and (FilmStyle_Value[Status_Flag] < 4) then

          for var iLoop := 0 to  Length(FilmStyle_Text)-1 do                     // Film Style
            FilmStyle.Items.Add  (FilmStyle_Text[iLoop]);

          if (WhiteBalance_Value[Status_Flag] >0 )  and (WhiteBalance_Value[Status_Flag] < 4)  then
          for var iLoop := 0 to  Length(WhiteBalance_Text)-1 do                // White_Balance
            WhiteBal.Items.Add  (WhiteBalance_Text[iLoop]);

            if (FilmStyle_Value[Status_Flag] >0 )  and (FilmStyle_Value[Status_Flag] < 4)  then

          for var iLoop := 0 to  Length(FilmStyleSetting_Text)-1 do
            begin
            Contrast.Items.Add (FilmStyleSetting_Text[iLoop]);                  // Contrast
            Saturation.Items.Add (FilmStyleSetting_Text[iLoop]);                // Saturation
            Sharpness.Items.Add (FilmStyleSetting_Text[iLoop]);                 // Sharpness
            HTone.Items.Add  (FilmStyleSetting_Text[iLoop]);                    // Highlight
            STone.Items.Add  (FilmStyleSetting_Text[iLoop]);                    // Shadow
            end;


          if (Panning_Value[Status_Flag] >0 )  and (Panning_Value[Status_Flag] < 4)  then                            // Not an option on this camera
          for var iLoop := 0 to Length(Panning_Text)-1 do                       // Panning
            PanningBox.Items.Add (Panning_Text[iLoop]);


          for var iLoop := 0 to Length(Exp_Comp_Text)-1 do                      // Exposure Compensation
            ExpCompBox.Items.Add (Exp_Comp_Text[iLoop]);

          for var iLoop := 0 to  Length(NMode_Text)-1 do                           // Noise
            NoiseModeCB.Items.Add (NMode_Text[iLoop]);

          for var iLoop := 0 to Length(ISO_Text)-1 do                           // ISO
            ISO_Combobox1.Items.Add (ISO_Text[iLoop]);

          if (IBIS_Value[Status_Flag] >0 )  and (IBIS_Value[Status_Flag] < 4)  then
            for var iLoop := 0 to Length(IBIS_Text)-1 do                        // IBIS
            IBISbox1.Items.Add (IBIS_Text[iLoop]);

            for var iLoop := 0 to Length(PASMMode_Text)-1 do                    // PASM Mode
            PASMComboBoxW.Items.Add (PASMMode_Text[iLoop]);

            for var iLoop := 0 to Length(Sensor_Text)-1 do                      // PASM Mode
            SensorComboBox.Items.Add (Sensor_Text[iLoop]);

            for var iLoop := 0 to Length(DriveMode_Text)-1 do                    // Drive Mode
            Drive_ModeComboBox.Items.Add (DriveMode_Text[iLoop]);

            for var iLoop := 0 to Length(VidPro_Text)-1 do                      // Video Profiles
            VidProComboBox.Items.Add (VidPro_Text[iLoop]);

            for var iLoop := 0 to Length(Focus_Text)-1 do                       // AF / MF Mode
            FocusComboBox.Items.Add (Focus_Text[iLoop]);

            for var iLoop := 0 to Length(AFMethod_Text)-1 do                    // AF Method
            AFMethodComboBox.Items.Add (AFMethod_Text[iLoop]);

            for var iLoop := 0 to Length(Noise_JPG_Text)-1 do                   // Noise_JPG
            Noise_JPGCB.Items.Add (Noise_JPG_Text[iLoop]);

            if (Noise_LE_Value[Status_Flag] >0 )  and (Noise_LE_Value[Status_Flag] < 4)  then
            for var iLoop := 0 to Length(Noise_LE_Text)-1 do                    // Noise_JPG
            Noise_LE.Items.Add (Noise_LE_Text[iLoop]);

            if (Shutter_Value[Status_Flag] >0 )  and (Shutter_Value[Status_Flag] < 4)  then
            for var iLoop := 0 to Length(Shutter_Text)-1 do                     // Noise_JPG
            SHutterComboBox.Items.Add (Shutter_Text[iLoop]);

            if (Kelvin_Value[Status_Flag] >0 )  and (Kelvin_Value[Status_Flag] < 4)  then
            for var iLoop := 0 to Length(Kelvin_Text)-1 do                      // Kelvin
            KelvinComboBox.Items.Add (Kelvin_Text[iLoop]);

// Video Tab
            //ShowMessage('Here');
            if (Vid_Format_Value[Status_Flag,VP_Offset] >0 )  and (Vid_Format_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_Format_Text)-1 do                  // Format
            FormatCB.Items.Add (Vid_Format_Text[iLoop]);

            if (Vid_Resolution_Value[Status_Flag,VP_Offset] >0 )  and (Vid_Resolution_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_Resolution_Text)-1 do              // Resolution
            ResolutionCB.Items.Add (Vid_Resolution_Text[iLoop]);

            if (Vid_FrameRate_Value[Status_Flag,VP_Offset] >0 )  and (Vid_FrameRate_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_FrameRate_Text)-1 do               // FrameRate
            FrameRateCB.Items.Add (Vid_FrameRate_Text[iLoop]);

            if (Vid_Codec_Value[Status_Flag,VP_Offset] >0 )  and (Vid_Codec_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_Codec_Text)-1 do                   // Codec
            CodecCB.Items.Add (Vid_Codec_Text[iLoop]);

            if (Vid_Compression_Value[Status_Flag,VP_Offset] >0 )  and (Vid_Compression_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_Compression_Text)-1 do             // Compression
            CompressionCB.Items.Add (Vid_Compression_Text[iLoop]);

            if (Vid_YUV_Value[Status_Flag,VP_Offset] >0 )  and (Vid_YUV_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_YUV_Text)-1 do                     // YUV
            YUVCB.Items.Add (Vid_YUV_Text[iLoop]);

            if (Vid_BitRate_Value[Status_Flag,VP_Offset] >0 )  and (Vid_BitRate_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_BitRate_Text)-1 do                 // BitRate
            BitRateCB.Items.Add (Vid_BitRate_Text[iLoop]);

            if (Vid_Log_Value[Status_Flag,VP_Offset] >0 )  and (Vid_Log_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_Log_Text)-1 do                     // Log
            LogCB.Items.Add (Vid_Log_Text[iLoop]);

            if (Vid_Sensor_Value[Status_Flag,VP_Offset] >0 )  and (Vid_Sensor_Value[Status_Flag,VP_Offset] < 4)  then
            begin
            for var iLoop := 0 to Length(Vid_Sensor_Text)-1 do                  // Sensor
            SensorCB.Items.Add (Vid_Sensor_Text[iLoop]);
            end;

            if (Vid_Audio_Value[Status_Flag,VP_Offset] >0 )  and (Vid_Audio_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_Audio_Text)-1 do                   // Audio
            AudioCB.Items.Add (Vid_Audio_Text[iLoop]);

            if (Vid_Medium_Value[Status_Flag,VP_Offset] >0 )  and (Vid_Medium_Value[Status_Flag,VP_Offset] < 4)  then
            for var iLoop := 0 to Length(Vid_Medium_Text)-1 do                  // Medium
            MediumCB.Items.Add (Vid_Medium_Text[iLoop]);


// Buttons

            for var iLoop := 0 to Length(Button_Text)-1 do                      // Button Settings

              if (Button_Valid_Photo[iLoop])=1 then                             // Is Setting in use?
              begin
               SL3Button3Box.Items.Add (Button_Text[iLoop]);                    // If so add it to the Button Combo Boxes
               SL3Button4Box.Items.Add (Button_Text[iLoop]);
               SL3Button9Box.Items.Add (Button_Text[iLoop]);
               SL3Button10Box.Items.Add (Button_Text[iLoop]);
               SL3Button20Box.Items.Add (Button_Text[iLoop]);
               SL3FnButtonBox.Items.Add (Button_Text[iLoop]);

               SLButton3Box.Items.Add (Button_Text[iLoop]);                    // If so add it to the Button Combo Boxes
               SLButton4Box.Items.Add (Button_Text[iLoop]);
               SLButton9Box.Items.Add (Button_Text[iLoop]);
               SLButton10Box.Items.Add (Button_Text[iLoop]);
               //SLButton20Box.Items.Add (Button_Text[iLoop]);
               //SLFnButtonBox.Items.Add (Button_Text[iLoop]);

               QButton3Box.Items.Add (Button_Text[iLoop]);                    // If so add it to the Button Combo Boxes
               QButton4Box.Items.Add (Button_Text[iLoop]);
               //QButton9Box.Items.Add (Button_Text[iLoop]);
               //QButton10Box.Items.Add (Button_Text[iLoop]);
               //QButton20Box.Items.Add (Button_Text[iLoop]);
               //QFnButtonBox.Items.Add (Button_Text[iLoop]);

              end;


            for var iLoop := 0 to Length(JSAFMode_Text)-1 do                    // Joystick Settings

              if (Button_Valid_Photo[iLoop])=1 then                             // Is Setting in use?
              begin
               JSAFMode.Items.Add (JSAFMode_Text[iLoop]);                       // If so add it to the Button Combo Boxes
              end;

            for var iLoop := 0 to Length(JSMFMode_Text)-1 do                    // Joystick Settings

              if (Button_Valid_Photo[iLoop])=1 then                             // Is Setting in use?
              begin
               JSMFMode.Items.Add (JSMFMode_Text[iLoop]);
              end;

            for var iLoop := 0 to Length(JSOPMode_Text)-1 do                    // Joystick Settings

              if (Button_Valid_Photo[iLoop])=1 then                             // Is Setting in use?
              begin
               JSOPMode.Items.Add (JSOPMode_Text[iLoop]);
               JSLock.Items.Add (JSLock_Text[iLoop]);
              end;


            PASMComboBoxW.ItemIndex   := 0;
            VidProComboBox.ItemIndex  := 0;

            OffSet    :=  (CustomNum.ItemIndex);                                        // Calculate offset for Custom Name in file
            PASMMode  :=  (PASMComboboxW.ItemIndex);                                    // Calculate offset for PASM Mode in file
            FS_Offset :=  (FilmStyle.ItemIndex);                                        // Calculate offset for Film Style
            VP_Offset :=  (VidProComboBox.ItemIndex);

            //UpdateCustom();

            PASMComboBoxWChange(Sender);
end;




procedure TCustom.UpdateCustom();



begin


           if (FilmStyle_Value[Status_Flag] =0 )  or (FilmStyle_Value[Status_Flag] > 3) then
              begin
                  FilmTab.Enabled  := False;
                  FilmTab.Visible  := False;
              end

           else
              begin
                  FilmTab.Enabled := True;
                  FilmTab.Visible := True;
              end;

            if (vCameraModel ='LEICA SL3') or (vCameraModel ='LEICA SL3-S') or (vCameraModel ='LEICA Fac') then

              begin
                SL3ButtonTab.Visible := True;                                   // Show Correct Dials & Buttons
                SL3WheelTab.Visible  := True;
                SL3ButtonTab.Enabled := True;
                SL3WheelTab.Enabled  := True;

                SLWheelTab.Visible   := False;
                SLWheelTab.Enabled   := False;
                SLButtonTab.Visible  := False;
                SLButtonTab.Enabled  := False;

                QWheelTab.Visible    := False;
                QWheelTab.Enabled    := False;
                QButtonTab.Visible   := False;
                QButtonTab.Enabled   := False;

                MButtonTab.Visible   := False;
                MButtonTab.Enabled   := False;

                VideoTab.Enabled     := True;
                VideoTab.Enabled     := True;
              end

            else If (vCameraModel = 'LEICA SL') or (vCameraModel = 'LEICA SL2') or (vCameraModel = 'LEICA SL2-S')then

              begin
                SLButtonTab.Visible  := True;                                   // Show Correct Dials & Buttons
                SLWheelTab.Visible   := True;
                SLButtonTab.Enabled  := True;
                SLWheelTab.Enabled   := True;

                SL3WheelTab.Visible  := False;
                SL3WheelTab.Enabled  := False;
                SL3ButtonTab.Visible := False;
                SL3ButtonTab.Enabled := False;

                QWheelTab.Visible    := False;
                QWheelTab.Enabled    := False;
                QButtonTab.Visible   := False;
                QButtonTab.Enabled   := False;

                MButtonTab.Visible   := False;
                MButtonTab.Enabled   := False;

                VideoTab.Visible     := False;
                VideoTab.Enabled     := False;
            end

            else If (vCameraModel = 'LEICA Q') or  (vCameraModel = 'LEICA Q2') or
                    (vCameraModel = 'LEICA Q3')or (vCameraModel = 'LEICA Q3 43') then

              begin
                QButtonTab.Visible   := True;                                // Show Correct Dials & Buttons
                QWheelTab.Visible    := True;
                QButtonTab.Enabled   := True;
                QWheelTab.Enabled    := True;

                SLWheelTab.Visible   := False;
                SLWheelTab.Enabled   := False;
                SLButtonTab.Visible  := False;
                SLButtonTab.Enabled  := False;

                SL3WheelTab.Visible  := False;
                SL3WheelTab.Enabled  := False;
                SL3ButtonTab.Visible := False;
                SL3ButtonTab.Enabled := False;

                MButtonTab.Visible   := False;
                MButtonTab.Enabled   := False;

                VideoTab.Visible     := False;
                VideoTab.Enabled     := False;

            end


            else If (vCameraModel = 'LEICA M') or  (vCameraModel = 'LEICA M11') or
            (vCameraModel = 'LEICA Q2 MON') then

              begin
                MButtonTab.Visible   := True;                                // Show Correct Dials & Buttons
                MButtonTab.Enabled   := True;

                QWheelTab.Enabled    := False;
                QWheelTab.Visible    := False;

                SLWheelTab.Visible   := False;
                SLWheelTab.Enabled   := False;
                SLButtonTab.Visible  := False;
                SLButtonTab.Enabled  := False;

                SL3WheelTab.Visible  := False;
                SL3WheelTab.Enabled  := False;
                SL3ButtonTab.Visible := False;
                SL3ButtonTab.Enabled := False;

                VideoTab.Visible     := False;
                VideoTab.Enabled     := False;

            end;






//Show Correct Tabs


         if (JSAFMode_Value[Status_Flag] =0 )  or (JSAFMode_Value[Status_Flag] > 3)  then
            begin
                JoystickTab.Enabled  := False;
                JoystickTab.Visible  := False;
            end

         else
            begin
                JoystickTab.Enabled := True;
                JoystickTab.Visible := True;
            end;



    sChar := '';

    OffSet    :=  (CustomNum.ItemIndex);                                        // Calculate offset for Custom Name in file
    PASMMode  :=  (PASMComboboxW.ItemIndex);                                    // Calculate offset for PASM Mode in file
    FS_Offset :=  (FilmStyle.ItemIndex);                                        // Calculate offset for Film Style
    VP_Offset :=  (VidProComboBox.ItemIndex);

    Saturation.visible := True;
    Label20.visible := True;


    SL3Left_Wheel_Rotation.OnClick := nil;                                      // Turn OFF the 'on click' events to stop false triggering
    SL3Back_Wheel_Rotation.OnClick := nil;
    SL3Right_Wheel_Rotation.OnClick := nil;

    SL3Button3Box.OnClick   := nil;
    SL3Button4Box.OnClick   := nil;
    SL3Button9Box.OnClick   := nil;
    SL3Button10Box.OnClick  := nil;
    SL3Button20Box.OnClick  := nil;
    SL3FnButtonBox.OnClick  := nil;

    SLButton3Box.OnClick    := nil;
    SLButton4Box.OnClick    := nil;
    SLButton9Box.OnClick    := nil;
    SLButton10Box.OnClick   := nil;

    QButton3Box.OnClick     := nil;
    QButton4Box.OnClick     := nil;

    WhiteBal.OnClick        := nil;
    KelvinComboBox.OnClick  := nil;

    Contrast.OnClick        := nil;
    Sharpness.OnClick       := nil;
    HTone.OnClick           := nil;
    STone.OnClick           := nil;
    Saturation.OnClick      := nil;


    Populate_Fields_Text(offset,VP_offset);                                     // populate all vVariables from array values

    MtrMode.ItemIndex       := MtrMode.Items.IndexOf(vMtrMode);
    FocuscomboBox.ItemIndex := FocusComboBox.Items.IndexOf(vFocus);

    AFMethodComboBox.ItemIndex := AFMethodComboBox.Items.IndexOf(vAFMethod);


    // Set the Combobox to point to the correct item in the list

    FilmStyle.ItemIndex     := FilmStyle.Items.IndexOf(vFilmStyle);             // Film Style

    //showmessage('FilmStyle = ' + vFilmStyle + ' Value = ' + inttostr(FilmStyle.ItemIndex));

    If  ISO_Value[offset] <> 0 then
          ISO_ComboBox1.ItemIndex := ISO_ComboBox1.Items.IndexOf(vISO)             // ISO_Value
        else
          ISO_ComboBox1.ItemIndex := ISO_ComboBox1.Items.IndexOf('Auto');




    IBISBox1.ItemIndex      := IBISBox1.Items.IndexOf(vIBIS);                   // IBIS_Value
    ExpCompBox.ItemIndex    := ExpCompBox.Items.IndexOf(vExpComp);              // ExpComp_Value
    PanningBox.ItemIndex    := PanningBox.Items.IndexOf(vPanning);



    if WhiteBalance_value[Offset] = 11 then
      begin
      KelvinComBoBox.visible := true;
      Label57.visible := True;
      KelvinComBoBox.ItemIndex    := KelvinComBoBox.Items.IndexOf(vKelvin);
      end
   else
      begin
      KelvinComBoBox.visible := False;
      Label57.visible := False;
      end;

    If  vLeftDialRot = 'Anti-Clockwise' then
      begin
      SL3Left_Wheel_Rotation.IsChecked := True;
      end
    else
      SL3Left_Wheel_Rotation.IsChecked := False;


    If  vRearDialRot = 'Anti-Clockwise' then
      begin
      SL3Back_Wheel_Rotation.IsChecked := True;
      end
    else
      SL3Back_Wheel_Rotation.IsChecked := False;


    If  vRightDialRot = 'Anti-Clockwise' then
      begin
      SL3Right_Wheel_Rotation.IsChecked := True;
      end
    else
      SL3Right_Wheel_Rotation.IsChecked := False;


    JPG_Res.ItemIndex       := JPG_Res.Items.IndexOf(vJPG_Res);                 // Image Size
    DNG_Res.ItemIndex       := DNG_Res.Items.IndexOf(vDNG_Res);                 // Image Quality
    MtrMode.ItemIndex       := MtrMode.Items.IndexOf(vMtrMode);                 // Image Quality

    Contrast.ItemIndex      := Contrast.Items.IndexOf(vContrast0);
    Sharpness.ItemIndex     := Sharpness.Items.IndexOf(vSharpness0);            // Sharpness
    HTone.ItemIndex         := HTone.Items.IndexOf(vHighlight0);                // Highlight
    STone.ItemIndex         := STone.Items.IndexOf(vShadow0);                   // Shadow
    Saturation.ItemIndex    := Saturation.Items.IndexOf(vSaturation0);

    WhiteBal.ItemIndex      := WhiteBal.Items.IndexOf(vWhiteBalance);           //[WBBase]

    ShutterComboBox.ItemIndex := ShutterComboBox.Items.IndexOf(vShutter);
    SensorComboBox.ItemIndex  := SensorComboBox.Items.IndexOf(vSensor);

    NoiseModeCB.ItemIndex   := NoiseModeCB.Items.IndexOf(vNoiseMode);           //[NRBASE];
    Noise_LE.ItemIndex      := Noise_LE.Items.IndexOf(vNoise_LE);               //[NRBASE];
    Noise_JPGCB.ItemIndex   := Noise_JPGCB.Items.IndexOf(vNoiseJPG);            //[NRBASE];


    MtrMode.ItemIndex       := MtrMode.Items.IndexOf(vMtrMode);
    FocuscomboBox.ItemIndex := FocusComboBox.Items.IndexOf(vFocus);

    AFMethodComboBox.ItemIndex := AFMethodComboBox.Items.IndexOf(vAFMethod);

    JSAFMode.ItemIndex      := JSAFMode.Items.IndexOf(vJSAFMode);               // JoyStick Values
    JSMFMode.ItemIndex      := JSMFMode.Items.IndexOf(vJSMFMode);               // JoyStick Values
    JSOPMode.ItemIndex      := JSOPMode.Items.IndexOf(vJSOPMode);               // JoyStick Values
    JSLock.ItemIndex        := JSLock.Items.IndexOf(vJSLock);                   // JoyStick Values

    SensorCombobox.ItemIndex:=SensorCombobox.Items.IndexOf(vSensorFormat);      // Sensor Values
    Drive_ModeCombobox.ItemIndex:=Drive_ModeCombobox.Items.IndexOf(vDriveMode); // Drive Values


    // Video Mode

    VidProCombobox.ItemIndex:= VidProCombobox.Items.IndexOf(vVidPro);

    FormatCB.ItemIndex      := FormatCB.Items.IndexOf(vVFormat);
    ResolutionCB.ItemIndex  := ResolutionCB.Items.IndexOf(vVResolution);
    FrameRateCB.ItemIndex   := FrameRateCB.Items.IndexOf(vVFrameRate);
    CodecCB.ItemIndex       := CodecCB.Items.IndexOf(vVCodec);
    CompressionCB.ItemIndex := CompressionCB.Items.IndexOf(vVCompression);
    YUVCB.ItemIndex         := YUVCB.Items.IndexOf(vVYUV);
    BitRateCB.ItemIndex     := BitRateCB.Items.IndexOf(vVBitRate);
    LogCB.ItemIndex         := LogCB.Items.IndexOf(vVLog);
    SensorCB.ItemIndex      := SensorCB.Items.IndexOf(vVSensor);
    AudioCB.ItemIndex       := AudioCB.Items.IndexOf(vVAudio);
    MediumCB.ItemIndex      := MediumCB.Items.IndexOf(vVMedium);


    Copyright.Text          := vCopyright;            //OffSet
    Artist.Text             := vArtist;


//  Update Buttons & Wheels

        if PV_Button.IsChecked = False  then

          begin                                                                 // Button / Dials in Photo Mode

              SL3Button3Box.ItemIndex := SL3Button3Box.Items.IndexOf(vButton3);
              SL3Button4Box.ItemIndex := SL3Button4Box.Items.IndexOf(vButton4);
              SL3Button9Box.ItemIndex := SL3Button9Box.Items.IndexOf(vButton9);
              SL3Button10Box.ItemIndex:= SL3Button10Box.Items.IndexOf(vButton10);
              SL3Button20Box.ItemIndex:= SL3Button20Box.Items.IndexOf(vButton20);
              SL3FnButtonBox.ItemIndex:= SL3FnButtonBox.Items.IndexOf(vFnButton);

              SL3LeftWB.ItemIndex     := SL3LeftWB.Items.IndexOf(vLeftDial);
              SL3BackWB.ItemIndex     := SL3BackWB.Items.IndexOf(vRearDial);
              SL3RightWB.ItemIndex    := SL3RightWB.Items.IndexOf(vRightDial);

              end

        else

          Begin                                                                 // Button / Dials in Video Mode

              SL3Button3Box.ItemIndex := SL3Button3Box.Items.IndexOf(vButton3_Video);
              SL3Button4Box.ItemIndex := SL3Button4Box.Items.IndexOf(vButton4_Video);
              SL3Button9Box.ItemIndex := SL3Button9Box.Items.IndexOf(vButton9_Video);
              SL3Button10Box.ItemIndex:= SL3Button10Box.Items.IndexOf(vButton10_Video);
              SL3Button20Box.ItemIndex:= SL3Button20Box.Items.IndexOf(vButton20_Video);
              SL3FnButtonBox.ItemIndex:= SL3FnButtonBox.Items.IndexOf(vFnButton_Video);

              SL3LeftWB.ItemIndex     := SL3LeftWB.Items.IndexOf(vLeftDial_Video);
              SL3BackWB.ItemIndex     := SL3BackWB.Items.IndexOf(vRearDial_Video);
              SL3RightWB.ItemIndex    := SL3RightWB.Items.IndexOf(vRightDial_Video);

          end;


    SLBackWB.ItemIndex      := SL3BackWB.Items.IndexOf(vRearDial);              // Back Wheel
    SLRightWB.ItemIndex     := SL3RightWB.Items.IndexOf(vRightDial);            // Right Wheel

    //QBackWB.ItemIndex       := SL3BackWB.Items.IndexOf(vRearDial);            // Back Wheel
    QRightWB.ItemIndex      := SL3RightWB.Items.IndexOf(vRightDial);            // Right Wheel


    SL3Left_Wheel_Rotation.OnClick  := Left_Wheel_RotationClick;                // Turn the Click events back on after updates
    SL3Back_Wheel_Rotation.OnClick  := Back_Wheel_RotationClick;
    SL3Right_Wheel_Rotation.OnClick := Right_Wheel_RotationClick;

    SL3Button3Box.OnClick   := SL3Button3BoxChange;
    SL3Button4Box.OnClick   := SL3Button4BoxChange;
    SL3Button9Box.OnClick   := SL3Button9BoxChange;
    SL3Button10Box.OnClick  := SL3Button10BoxChange;
    SL3Button20Box.OnClick  := SL3Button20BoxChange;
    SL3FnButtonBox.OnClick  := SL3FnButtonBoxChange;

    SLButton3Box.OnClick    := SL3Button3BoxChange;
    SLButton4Box.OnClick    := SL3Button4BoxChange;
    SLButton9Box.OnClick    := SL3Button9BoxChange;
    SLButton10Box.OnClick   := SL3Button10BoxChange;

    QButton3Box.OnClick     := SL3Button3BoxChange;
    QButton4Box.OnClick     := SL3Button4BoxChange;

    WhiteBal.OnClick        := WhiteBalChange;
    KelvinComboBox.OnClick  := KelvinComboBoxChange;

    Contrast.OnClick        := ContrastChange;
    Sharpness.OnClick       := SharpnessChange;
    HTone.OnClick           := HToneChange;
    STone.OnClick           := SToneChange;
    Saturation.OnClick      := SaturationChange;


end;



procedure TCustom.OK_1Click(Sender: TObject);

  Begin

     if Field_Changed = True then
      begin

      Answer := QuestionChanges('Closing will commit changes');


                begin
                  if Answer = 'true' Then
                    Begin
                       Custom1.Close;
                    End


                  else if Answer = 'false' Then
                    Begin
                       //ShowMessage('No was selected');
                    end;

                end;

      end;

     Custom1.Close;

  End;



procedure TCustom.CopyrightDblClick(Sender: TObject);
  begin
    Field_Changed := True;

    Answer := '';
    str := '';

    str := Copyright_Value[offset];                                                  // Save original string

    Ask.advice.Text :=  'Please Enter Copyright Name';


     //Showmessage('Entry is ' + str);

      Ask.Memo1.text := str;                                                    // Show entry on Input Screen
      Ask.ShowModal;                                                            // Open Input screen


        // Coming back from input Box after question.

    if Answer = 'true' Then
      Begin

        for var i := 0 to 6 do
            begin
            Copyright_Value[i] := Ask.Memo1.text;                              // Change entry in Array
            end;


        //ShowMessage('Text is ' + Copyright_Value[0]) ;
        Copyright_Value[Status_Flag] := '2';                                    // Flag change of array values

        //showmessage('CR Status Flag = ' + COPYRIGHT_Value[Status_Flag]);

        CustomNumChange(Sender);
      End;

     if Answer = 'false' Then
      Begin
        Copyright_Value[offset] := str;
        Field_Changed := False;
        Ask.Close;
      End;

    vCopyright := Copyright_Value[offset];

    str := '';

    UpdateCustom();

  end;

procedure TCustom.ArtistDblClick(Sender: TObject);
  begin
    Field_Changed := True;

    Answer := '';
    str := '';

    str := Artist_Value[offset];                                                     // Save original string

    Ask.advice.Text :=  'Please Enter Artist Name';

    //Showmessage('Entry is ' + str);

      Ask.Memo1.text := str;                                                    // Show entry on Input Screen
      Ask.ShowModal;                                                             // Open Input screen

        // Coming back from input Box after question.

    if Answer = 'true' Then
      Begin
        //ShowMessage('Text is ' + CustomText[Index]) ;
        for var i := 0 to 6 do
         begin
              Artist_Value[i] := Ask.Memo1.text;                                               // Change entry in Array
         end;

        //ShowMessage('Text is ' + Artist_Value[0]) ;
        Artist_Value[Status_Flag] := '2';                                       // Flag change of array values
        CustomNumChange(Sender);
       end;

     if Answer = 'false' Then
      Begin
        Artist_Value[offset] := str;
        Ask.Close;
      End;

    vArtist := Artist_Value[offset];

    str := '';

    UpdateCustom();

  end;


procedure TCustom.CustomNameDouble(Sender: TObject);
begin
    Field_Changed := True;

    Answer := '';
    str := '';

    str := CustomText[offset];                                                   // Save original string

    Index := CustomName.Items.IndexOf(str);                                     //  ??????

     if Index <> -1 then                                                        // Only if not empty
      Ask.Memo1.text := str;                                                    // Show entry on Input Screen

    Ask.advice.Text :=  'Please Enter Custom Name';

    Ask.ShowModal;                                                              // Open Input screen


    // Coming back from input Box after question.

    if Answer = 'true' Then
      Begin

        CustomText[offset] := Ask.Memo1.Text;                                    // Change entry in Array

        CustomName.Items.clear;                                                 // Empty Combobox

        for var iLoop := 0 to  NUMCUSTOMSETTINGS do                             // Custom Names to combobox
          CustomName.Items.Add  (CustomText[iLoop]);

        CustomText[Status_Flag] := '2';                                         // Flag change of array values
        Field_Changed := True;
        CustomNumChange(Sender);
      End;

     if Answer = 'false' Then
      Begin
        CustomText[offset] := str;
        Field_Changed := False;
        Ask.Close;
      End;

    str := '';

    UpdateCustom();

end;

procedure TCustom.CustomNameChange(Sender: TObject);
begin
        str := '';

        if (CustomName.ItemIndex)  > NUMCUSTOMSETTINGS then                     // No higher that Camera settings allow
           begin
               CustomName.ItemIndex :=   NUMCUSTOMSETTINGS;
           end;

        CustomNum.ItemIndex := CustomName.ItemIndex;                            // Custom Settings;

        UpdateCustom();

end;

procedure TCustom.CustomNameMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; var Handled: Boolean);
begin
     CustomNameChange(Sender);
end;



procedure TCustom.CustomNumChange(Sender: TObject);

begin
        str := '';

        if (CustomNum.ItemIndex)  > NUMCUSTOMSETTINGS then                      // No higher that Camera settings allow
           begin
               CustomNum.ItemIndex :=   NUMCUSTOMSETTINGS;
           end;

        CustomName.ItemIndex := CustomNum.ItemIndex;                            // Custom Settings

        UpdateCustom();

end;


procedure TCustom.CustomNumMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; var Handled: Boolean);
begin
    CustomNumChange(Sender);
end;

procedure TCustom.PASMComboBoxWChange(Sender: TObject);
  begin

  PASMMode  :=  (PASMComboboxW.ItemIndex);                                      // Calculate offset for PASM Mode in file

  PASMComboBoxW.OnEnter := nil;                                                 // Turn Change Events off to stop double trigger

    if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
    Begin                                                                       // Display correct options for each Dial combobox
      If PASMMode = 0 then
      begin
        For Var X := 0 to 3 do
         begin
         Wheel_Text[X]  :=  Wheel_Text_P[X];                                    // Populate the Wheel Text Array
         end;
        For Var X := 0 to 6 do
         begin
         Wheel_Code[X]  :=  Wheel_Code_P[X];                                    // Populate the Wheel Code Array
         end;
      end;


      If PASMMode = 1 then
      Begin
      For Var X := 0 to 2 do
         begin
         Wheel_Text[X]  :=  Wheel_Text_A[X];                                    // Populate the Wheel Text Array
         end;
        For Var X := 0 to 6 do
         begin
         Wheel_Code[X]  :=  Wheel_Code_A[X];                                    // Populate the Wheel Code Array
         end;
      End;

      If PASMMode = 2 then
      Begin
      For Var X := 0 to 2 do
         begin
         Wheel_Text[X]  :=  Wheel_Text_S[X];                                    // Populate the Wheel Text Array
         end;
        For Var X := 0 to 6 do
         begin
         Wheel_Code[X]  :=  Wheel_Code_S[X];                                    // Populate the Wheel Code Array
         end;
      End;

      If PASMMode = 3 then
      Begin
      For Var X := 0 to 3 do
         begin
         Wheel_Text[X]  :=  Wheel_Text_M[X];                                    // Populate the Wheel Text Array
         end;
        For Var X := 0 to 6 do
         begin
         Wheel_Code[X]  :=  Wheel_Code_M[X];                                    // Populate the Wheel Code Array
         end;
      End;
    end;

    if PV_Button.IsChecked = True  then        //Wheel in Video Mode
    Begin                                                                       // Display correct options for each Dial combobox
      If PASMMode = 0 then
      begin
        For Var X := 0 to 3 do
         begin
         Wheel_Text[X]  :=  Wheel_Text_Video_P[X];                              // Populate the Wheel Text Array
         end;
        For Var X := 0 to 6 do
         begin
         Wheel_Code[X]  :=  Wheel_Code_Video_P[X];                              // Populate the Wheel Code Array
         end;
      end;


      If PASMMode = 1 then
      Begin
      For Var X := 0 to 2 do
         begin
         Wheel_Text[X]  :=  Wheel_Text_Video_A[X];                              // Populate the Wheel Text Array
         end;
        For Var X := 0 to 6 do
         begin
         Wheel_Code[X]  :=  Wheel_Code_Video_A[X];                              // Populate the Wheel Code Array
         end;
      End;

      If PASMMode = 2 then
      Begin
      For Var X := 0 to 2 do
         begin
         Wheel_Text[X]  :=  Wheel_Text_Video_S[X];                              // Populate the Wheel Text Array
         end;
        For Var X := 0 to 6 do
         begin
         Wheel_Code[X]  :=  Wheel_Code_Video_S[X];                              // Populate the Wheel Code Array
         end;
      End;

      If PASMMode = 3 then
      Begin
      For Var X := 0 to 3 do
         begin
         Wheel_Text[X]  :=  Wheel_Text_Video_M[X];                              // Populate the Wheel Text Array
         end;
        For Var X := 0 to 6 do
         begin
         Wheel_Code[X]  :=  Wheel_Code_Video_M[X];                              // Populate the Wheel Code Array
         end;
      End;
    end;

      PASMComboBoxW.OnEnter := Save_Value;                                      // Turn Change Events Back On

      //showmessage('End of PASM Code');

      PV_ButtonClick(Sender);                                                   // Update the Valid Dial seletion in comboboxes,
                                                                                // Runs "Update_Custom" too
  end;


Procedure TCustom.CommitDialChanges(sDial : String);
begin

var iNumber: Integer;

  If sDial = 'Left' then
     begin


      If PASMMode = 0 then
      begin                                                                     //  First decode combobox with relevent PASM setting

        if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
          Begin
          LeftDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3LeftWB.Text, Wheel_Text,Wheel_Code);
          LeftDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
          end
        else
          Begin
          LeftDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3LeftWB.Text, Wheel_Text_Video_P,Wheel_Code);
          LeftDial_Video_Value[Status_Flag,(PASMMode)] :=2;
          end;
                                                                                //  Then decode value from main array

          iNumber  :=     REV_Search(SL3LeftWB.Text, Wheel_Text_P,Wheel_Code);

      end;


      If PASMMode = 1 then
      Begin
          if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
            Begin
            LeftDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3LeftWB.Text, Wheel_Text,Wheel_Code);
            LeftDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            LeftDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3LeftWB.Text, Wheel_Text_Video_A,Wheel_Code);
            LeftDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3LeftWB.Text, Wheel_Text_A,Wheel_Code);
      End;

      If PASMMode = 2 then
      Begin
          if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
            Begin
            LeftDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3LeftWB.Text, Wheel_Text,Wheel_Code);
            LeftDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            LeftDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3LeftWB.Text, Wheel_Text_Video_S,Wheel_Code);
            LeftDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3LeftWB.Text, Wheel_Text_S,Wheel_Code);

      End;

      If PASMMode = 3 then
      Begin
          if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
            Begin
            LeftDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3LeftWB.Text, Wheel_Text,Wheel_Code);
            LeftDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            LeftDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3LeftWB.Text, Wheel_Text_Video_M,Wheel_Code);
            LeftDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3LeftWB.Text, Wheel_Text_M,Wheel_Code);

        End;




     end;


   If sDial = 'Back' then
     begin

      If PASMMode = 0 then
      begin

          if PV_Button.IsChecked = False then        //Wheel in Photo Mode
            Begin
            RearDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3BackWB.Text, Wheel_Text,Wheel_Code);
            RearDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            RearDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3BackWB.Text, Wheel_Text_Video_P,Wheel_Code);
            RearDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end ;

            iNumber  :=     REV_Search(SL3BackWB.Text, Wheel_Text_P,Wheel_Code);

      end;


      If PASMMode = 1 then
      Begin
          if PV_Button.IsChecked = False then        //Wheel in Photo Mode
            Begin
            RearDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3BackWB.Text, Wheel_Text,Wheel_Code);
            RearDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            RearDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3BackWB.Text, Wheel_Text_Video_A,Wheel_Code);
            RearDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3BackWB.Text, Wheel_Text_A,Wheel_Code);
      End;

      If PASMMode = 2 then
      Begin
          if PV_Button.IsChecked = False then        //Wheel in Photo Mode
            Begin
            RearDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3BackWB.Text, Wheel_Text,Wheel_Code);
            RearDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            RearDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3BackWB.Text, Wheel_Text_Video_S,Wheel_Code);
            RearDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3BackWB.Text, Wheel_Text_S,Wheel_Code);
      End;

      If PASMMode = 3 then
      Begin
          if PV_Button.IsChecked = False then        //Wheel in Photo Mode
            Begin
            RearDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3BackWB.Text, Wheel_Text,Wheel_Code);
            RearDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            RearDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3BackWB.Text, Wheel_Text_Video_M,Wheel_Code);
            RearDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3BackWB.Text, Wheel_Text_M,Wheel_Code);
      End;

     end;


  If sDial = 'Right' then
     begin

      If PASMMode = 0 then
      begin

          if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
            Begin
            RightDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3RightWB.Text, Wheel_Text,Wheel_Code);
            RightDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            RightDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3RightWB.Text, Wheel_Text_Video_P,Wheel_Code);
            RightDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3RightWB.Text, Wheel_Text_P,Wheel_Code);

      end;


      If PASMMode = 1 then
      Begin
          if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
            Begin
            RightDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3RightWB.Text, Wheel_Text,Wheel_Code);
            RightDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            RightDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3RightWB.Text, Wheel_Text_Video_M,Wheel_Code);
            RightDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3RightWB.Text, Wheel_Text,Wheel_Code);


      End;

      If PASMMode = 2 then
      Begin
          if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
            Begin
            RightDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3RightWB.Text, Wheel_Text,Wheel_Code);
            RightDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            RightDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3RightWB.Text, Wheel_Text_Video_A,Wheel_Code);
            RightDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3RightWB.Text, Wheel_Text,Wheel_Code);


      End;

      If PASMMode = 3 then
      Begin
          if PV_Button.IsChecked = False  then        //Wheel in Photo Mode
            Begin
            RightDial_Photo_Value[offset,(PASMMode)] := REV_Search(SL3RightWB.Text, Wheel_Text,Wheel_Code);
            RightDial_Photo_Value[Status_Flag,(PASMMode)] :=2;
            end
          else
            Begin
            RightDial_Video_Value[offset,(PASMMode)] := REV_Search(SL3RightWB.Text, Wheel_Text_Video_S,Wheel_Code);
            RightDial_Video_Value[Status_Flag,(PASMMode)] :=2;
            end;

            iNumber  :=     REV_Search(SL3RightWB.Text, Wheel_Text,Wheel_Code);

      End;

     end;

     //ShowMessage('Dial Code Value = ' + inttostr(iNumber)+ #13#10 + 'Which is ' + Wheel_Text_Full[iNumber]);



end;


procedure TCustom.ResetClick(Sender: TObject);
begin

   Answer := QuestionChanges('This will Reset the Button & Dial settings to Factory Default ?');


              begin
                if Answer = 'true' Then
                  Begin
                                 for var I  := 0 to 6 do
                 begin
                 Button3_Value[I,Photo]  := 11;             // Button Default Values
                 Button4_Value[I,Photo]  := 36;             // For All Profiles   (Photo)
                 Button9_Value[I,Photo]  := 3;
                 Button10_Value[I,Photo] := 45;
                 Button20_Value[I,Photo] := 27;
                 FnButton_Value[I,Photo] := 37;

                 Button3_Value[I,Video]  := 11;            // Button Default Values
                 Button4_Value[I,Video]  := 36;            // For All Profiles   (Video)
                 Button9_Value[I,Video]  := 111;
                 Button10_Value[I,Video] := 45;
                 Button20_Value[I,Video] := 27;
                 FnButton_Value[I,Video] := 37;


                 LeftDial_Photo_Value[I,P]  := 3;              // 2D Photo arrays
                 RearDial_Photo_Value[I,P]  := 0;
                 RightDial_Photo_Value[I,P]  := 1;

                 LeftDial_Video_Value[I,P] := 3;               // 2D Video arrays
                 RearDial_Video_Value[I,P] := 5;
                 RightDial_Video_Value[I,P] := 1;

                 LeftDial_Photo_Value[I,A]  := 2;              // 2D Photo arrays
                 RearDial_Photo_Value[I,A]  := 0;
                 RightDial_Photo_Value[I,A]  := 1;

                 LeftDial_Video_Value[I,A] := 3;               // 2D Video arrays
                 RearDial_Video_Value[I,A] := 4;
                 RightDial_Video_Value[I,A] := 3;

                 LeftDial_Photo_Value[I,S]  := 2;              // 2D Photo arrays
                 RearDial_Photo_Value[I,S]  := 1;
                 RightDial_Photo_Value[I,S]  := 0;

                 LeftDial_Video_Value[I,S] := 3;               // 2D Video arrays
                 RearDial_Video_Value[I,S] := 1;
                 RightDial_Video_Value[I,S] := 3;

                 LeftDial_Photo_Value[I,M]  := 2;              // 2D Photo arrays
                 RearDial_Photo_Value[I,M]  := 0;
                 RightDial_Photo_Value[I,M]  := 1;

                 LeftDial_Video_Value[I,M] := 3;               // 2D Video arrays
                 RearDial_Video_Value[I,M] := 4;
                 RightDial_Video_Value[I,M] := 3;

                 end
                  End


                else if Answer = 'false' Then
                  Begin
                     //ShowMessage('No was selected');
                  end;

              end;

      //Field_Changed := False;
      UpdateCustom();
end;

procedure TCustom.ResetJoyStick(Sender: TObject);
begin

    Answer := QuestionChanges('This will Reset the Joystick settings to Factory Default ?');


        begin
          if Answer = 'true' Then
            Begin
              JSAFMode_Value[I]  := 0;                        // Joysticks Default Values
              JSMFMode_Value[I]  := 0;
              JSOPMode_Value[I]  := 0;
              JSLock_Value[I]    := 0;
            End


          else if Answer = 'false' Then
            Begin
               //ShowMessage('No was selected');
            end;

        end;

      UpdateCustom();
end;



procedure TCustom.PV_ButtonClick(Sender: TObject);
  begin

    SL3Button3Box.Items.clear;                                                     //Clear all Buttons Comboboxes
    SL3Button4Box.Items.clear;
    SL3Button9Box.Items.clear;
    SL3Button10Box.Items.clear;
    SL3FnButtonBox.Items.clear;

    SLButton3Box.Items.clear;                                                     //Clear all Buttons Comboboxes
    SLButton4Box.Items.clear;
    SLButton9Box.Items.clear;
    SLButton10Box.Items.clear;
    //SLFnButtonBox.Items.clear;

    QButton3Box.Items.clear;                                                     //Clear all Buttons Comboboxes
    QButton4Box.Items.clear;
    //QButton9Box.Items.clear;
    //QButton10Box.Items.clear;
    //QFnButtonBox.Items.clear;

    SL3LeftWB.Items.clear;
    SL3BackWB.Items.clear;
    SL3RightWB.Items.clear;

    //SLLeftWB.Items.clear;
    SLBackWB.Items.clear;
    SLRightWB.Items.clear;

    //QLeftWB.Items.clear;
    //QBackWB.Items.clear;
    QRightWB.Items.clear;



    if  PV_Button.IsChecked = True   then
         begin
          Photo_Film2.Text := 'Video';

                  for var iLoop := 0 to Length(Button_Text)-1 do                // Populate Button Combo BOxes

                    if (Button_Valid_Video[iLoop])=1 then                        // Is Button Option in use?
                    begin
                        SL3Button3Box.Items.Add (Button_Text[iLoop]);           // If so add it to the Button Combo Boxes
                        SL3Button4Box.Items.Add (Button_Text[iLoop]);
                        SL3Button9Box.Items.Add (Button_Text[iLoop]);
                        SL3Button10Box.Items.Add (Button_Text[iLoop]);
                        SL3Button20Box.Items.Add (Button_Text[iLoop]);
                        SL3FnButtonBox.Items.Add (Button_Text[iLoop]);

                        SLButton3Box.Items.Add (Button_Text[iLoop]);           // If so add it to the Button Combo Boxes
                        SLButton4Box.Items.Add (Button_Text[iLoop]);
                        SLButton9Box.Items.Add (Button_Text[iLoop]);
                        SLButton10Box.Items.Add (Button_Text[iLoop]);
                        //SLButton20Box.Items.Add (Button_Text[iLoop]);
                        //SLFnButtonBox.Items.Add (Button_Text[iLoop]);

                        QButton3Box.Items.Add (Button_Text[iLoop]);           // If so add it to the Button Combo Boxes
                        QButton4Box.Items.Add (Button_Text[iLoop]);
                        //QButton9Box.Items.Add (Button_Text[iLoop]);
                        //QButton10Box.Items.Add (Button_Text[iLoop]);
                        //QButton20Box.Items.Add (Button_Text[iLoop]);
                        //QFnButtonBox.Items.Add (Button_Text[iLoop]);

                    end;

            for var iLoop := 0 to 3 do                                          // Wheel Text to Comboboxes

              begin
                 if (LeftDial_Video_Valid[iLoop])=1 then                        // Is Setting in use?
                 Begin
                 SL3LeftWB.Items.Add (Wheel_Text[iLoop]);                       // then add the Wheel Combo Boxes
                 //SLLeftWB.Items.Add (Wheel_Text_Full[iLoop]);
                 //QLeftWB.Items.Add (Wheel_Text_Full[iLoop]);
                 End;

                 if (RearDial_Video_Valid[iLoop])=1 then
                 Begin
                 SL3BackWB.Items.Add (Wheel_Text[iLoop]);
                 SLBackWB.Items.Add (Wheel_Text[iLoop]);
                 //QBackWB.Items.Add (Wheel_Text_Full[iLoop]);
                 End;

                 if (RightDial_Video_Valid[iLoop])=1 then
                 Begin
                 SL3RightWB.Items.Add (Wheel_Text[iLoop]);
                 SLRightWB.Items.Add (Wheel_Text[iLoop]);
                 QRightWB.Items.Add (Wheel_Text[iLoop]);
                 End;
              end;


         end

    else

             begin
              Photo_Film2.Text := 'Photo';

                  for var iLoop := 0 to Length(Button_Text)-1 do                // Populate Button Combo BOxes

                    if (Button_Valid_Photo[iLoop])=1 then                       // Is Button Option in use?
                    begin
                        SL3Button3Box.Items.Add (Button_Text[iLoop]);              // If so add it to the Button Combo Boxes
                        SL3Button4Box.Items.Add (Button_Text[iLoop]);
                        SL3Button9Box.Items.Add (Button_Text[iLoop]);
                        SL3Button10Box.Items.Add (Button_Text[iLoop]);
                        SL3Button20Box.Items.Add (Button_Text[iLoop]);
                        SL3FnButtonBox.Items.Add (Button_Text[iLoop]);

                        SLButton3Box.Items.Add (Button_Text[iLoop]);            // If so add it to the Button Combo Boxes
                        SLButton4Box.Items.Add (Button_Text[iLoop]);
                        SLButton9Box.Items.Add (Button_Text[iLoop]);
                        SLButton10Box.Items.Add (Button_Text[iLoop]);
                        //SLButton20Box.Items.Add (Button_Text[iLoop]);
                        //SLFnButtonBox.Items.Add (Button_Text[iLoop]);

                        QButton3Box.Items.Add (Button_Text[iLoop]);             // If so add it to the Button Combo Boxes
                        QButton4Box.Items.Add (Button_Text[iLoop]);
                        //QButton9Box.Items.Add (Button_Text[iLoop]);
                        //QButton10Box.Items.Add (Button_Text[iLoop]);
                        //QButton20Box.Items.Add (Button_Text[iLoop]);
                        //QFnButtonBox.Items.Add (Button_Text[iLoop]);
                    end;


                   Populate_DialList(Sender);

             end;

      UpdateCustom();

  end;

  procedure TCustom.PV_ButtonMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
    PV_ButtonClick(Sender);
end;

procedure TCustom.PV_ButtonSwitch(Sender: TObject);
begin
    PV_ButtonClick(Sender);
end;

// end of Proc



procedure TCustom.Populate_DialList(Sender: TObject);
  begin

  //Showmessage('PASM Value is ' + inttostr(PASMComboBoxW.itemindex) );

  SL3LeftWB.Items.clear;
  SL3BackWB.Items.clear;
  SL3RightWB.Items.clear;

  //SLLeftWB.Items.clear;
  SLBackWB.Items.clear;
  SLRightWB.Items.clear;

  //QLeftWB.Items.clear;
  //QBackWB.Items.clear;
  QRightWB.Items.clear;



     If (PASMMode = -1) or (PASMMode = 0) or
        (PASMMode = 1) or (PASMMode = 2) Then

         begin
            for var iLoop := 0 to 2 do                                          // Wheel Text to Comboboxes

              begin

                   if (Wheel_Text[iLoop]) <> '' then                            // Is Field ?
                   Begin
                   SL3LeftWB.Items.Add (Wheel_Text[iLoop]);                     // then add the Wheel Combo Boxes
                   //SLLeftWB.Items.Add (Wheel_Text[iLoop]);
                   //QLeftWB.Items.Add (Wheel_Text[iLoop]);
                   End;
                   if (Wheel_Text[iLoop]) <> '' then
                   Begin
                   SL3BackWB.Items.Add (Wheel_Text[iLoop]);
                   SLBackWB.Items.Add (Wheel_Text[iLoop]);
                   //QBackWB.Items.Add (Wheel_Text[iLoop]);
                   End;

                   if (Wheel_Text[iLoop]) <> '' then
                   Begin
                   SL3RightWB.Items.Add (Wheel_Text[iLoop]);
                   SLRightWB.Items.Add (Wheel_Text[iLoop]);
                   QRightWB.Items.Add (Wheel_Text[iLoop]);
                   End;



              end;
         end;


       If (PASMMode = -1) or (PASMMode = 0) Then
         begin
            SL3LeftWB.Items.clear;
            for var iLoop := 0 to 3 do                                          // Wheel Text to Comboboxes

              begin

                   if (Wheel_Text[iLoop]) <> '' then                            // Is Field ?
                   SL3LeftWB.Items.Add (Wheel_Text[iLoop]);                     // then add the Wheel Combo Boxes

              end;
         end;


       If PASMMode = 3 Then

             begin
                for var iLoop := 0 to 3 do                                      // Wheel Text to Comboboxes

                  begin
                     if (Wheel_Text[iLoop]) <> '' then                          // Is Field ?
                     SL3LeftWB.Items.Add (Wheel_Text[iLoop]);                // then add the Wheel Combo Boxes

                     if (Wheel_Text[iLoop]) <> '' then
                     Begin
                     SL3BackWB.Items.Add (Wheel_Text[iLoop]);
                     SLBackWB.Items.Add (Wheel_Text[iLoop]);
                     //QBackWB.Items.Add (Wheel_Text[iLoop]);
                     End;
                     if (Wheel_Text[iLoop]) <> '' then
                     Begin
                     SL3RightWB.Items.Add (Wheel_Text[iLoop]);
                     SLRightWB.Items.Add (Wheel_Text[iLoop]);
                     QRightWB.Items.Add (Wheel_Text[iLoop]);
                     End;
                  end;
             end;

  end;





  procedure TCustom.QWheelTabContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

////////////////////////////            Changes to Field      /////////////////////////////////////////


procedure TCustom.AFMethodComboBoxChange(Sender: TObject);
  begin
  Field_Changed :=True ;
    AFMethod_Value[offset] :=REV_Search(AFMethodComboBox.Text, AFMethod_Text, AFMethod_Code);
    AFMethod_Value[Status_Flag] := 2;
  end;

procedure TCustom.HToneChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Highlights
    Highlight0_Value[offset] :=REV_Search(HTone.Text, FilmStyleSetting_Text, FilmStyleSetting_Code);
    Highlight0_Value[Status_Flag] := 2;
  end;

procedure TCustom.IBISBox1Change(Sender: TObject);
  begin
  Field_Changed :=True ;
  // IBIS
    IBIS_Value[offset]:=REV_Search(IBISBox1.Text, IBIS_Text, IBIS_Code);
    IBIS_Value[Status_Flag] := 2;                                               // Update flag set to reflect value change
  end;

procedure TCustom.DNG_ResChange(Sender: TObject);
  begin
  Field_Changed :=True ;
    // DNG Resolution
    DNG_Res_Value[offset]:=REV_Search(DNG_Res.Text, Image_Res_Text, Image_Res_Code);
    DNG_Res_Value[Status_Flag] := 2;                                            // Update flag set to reflect value change
  end;

procedure TCustom.JPG_ResChange(Sender: TObject);
  begin
  Field_Changed :=True ;
    // JPG Resolution
    JPG_Res_Value[offset]:=REV_Search(JPG_Res.Text, Image_Res_Text, Image_Res_Code);
    JPG_Res_Value[Status_Flag] := 2;                                            // Update flag set to reflect value change
  end;

procedure TCustom.ISO_ComboBox1Change(Sender: TObject);
  begin
  Field_Changed :=True ;
    // ISO

    Logger.Info('(%s) ISO Changed to: %s',[DateTimeToStr(Now),ISO_Text[ISO_ComboBox1.itemindex]]);

    ISO_Value[offset]:=(ISO_Code[ISO_ComboBox1.ItemIndex]);                     // Rev Lookup the Code
    ISO_Value[Status_Flag] := 2;                                                // Update flag set to reflect value change
  end;

procedure TCustom.WhiteBalChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // WhiteBalance
    WhiteBalance_Value[offset]:=REV_Search(WhiteBal.Text, WhiteBalance_Text, WhiteBalance_Code);
    WhiteBalance_Value[offset]:=(WhiteBalance_Code[WhiteBal.ItemIndex]);
    WhiteBalance_Value[Status_Flag] := 2;
  end;

  procedure TCustom.NoiseModeCBChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Noise JPG
  NMode_value[offset]:=REV_Search(NoiseModeCB.Text, NMode_Text, NMode_Code);
  NMode_value[Status_Flag] := 2;                                           // Update flag set to reflect value change
  end;

  procedure TCustom.Noise_JPGCBChange(Sender: TObject);
begin
    Field_Changed :=True ;
  // Noise
    Noise_JPG_value[offset]:=REV_Search(Noise_JPGCB.Text, Noise_JPG_Text, Noise_JPG_Code);
    Noise_JPG_value[Status_Flag] := 2;
end;

procedure TCustom.Noise_LEChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Noise
    Noise_LE_value[offset]:=REV_Search(Noise_LE.Text, Noise_LE_Text, Noise_LE_Code);
    Noise_LE_value[Status_Flag] := 2;                                           // Update flag set to reflect value change
  end;

procedure TCustom.MtrModeChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  //DR
    MeterMode_Value[offset]:=REV_Search(MtrMode.Text, MeterMode_Text, MeterMode_Code);
    MeterMode_Value[Status_Flag] := 2;                                             // Update flag set to reflect value change
  end;


procedure TCustom.Drive_ModeComboBoxChange(Sender: TObject);
  begin
  Field_Changed :=True ;     // Drive_mode_Value
  // Drive Mode
    Drivemode_Value[offset]:=REV_Search(Drive_ModeCombobox.Text, Drivemode_Text, Drivemode_Code);
    Drivemode_Value[Status_Flag] := 2;
  end;

procedure TCustom.ExpCompBoxChange(Sender: TObject);
  begin
  Field_Changed :=True ;
    // Update Exp_Comp value in Array
    Exp_Comp_Value[offset]:=REV_Search(ExpCompBox.Text, Exp_Comp_Text, Exp_Comp_Code);       // Rev Lookup the Code
    Exp_Comp_Value[Status_Flag] := 2;                                             // Update flag set to reflect value change
  end;

procedure TCustom.SaturationChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Saturation
    Saturation0_Value[offset]:=REV_Search(Saturation.Text, FilmStyleSetting_Text, FilmStyleSetting_Code);
    Saturation0_Value[offset]:=(FilmStyleSetting_Code[Saturation.ItemIndex]);
    Saturation0_Value[Status_Flag] := 2;
  end;

procedure TCustom.Save_Value(Sender: TObject);
  begin
       Old_Value2 := PASMComboBoxw.ItemIndex;
  end;

  procedure TCustom.SensorComboBoxChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Sensor Size
    Sensor_Value[offset]:=REV_Search(SensorComboBox.Text, Sensor_Text, Sensor_Code);
    Sensor_Value[Status_Flag] := 2;
  end;

procedure TCustom.ShutterComboBoxChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Sensor Size
    Shutter_Value[offset]:=REV_Search(ShutterComboBox.Text, Shutter_Text, Shutter_Code);
    Shutter_Value[Status_Flag] := 2;
  end;





procedure TCustom.SharpnessChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Sharpness
    Sharpness0_Value[offset] :=REV_Search(Sharpness.Text, FilmStyleSetting_Text, FilmStyleSetting_Code);
    Sharpness0_Value[Status_Flag] := 2;
  end;

procedure TCustom.SToneChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Shadow
    Shadow0_Value[offset]:=REV_Search(Stone.Text, FilmStyleSetting_Text, FilmStyleSetting_Code);
    Shadow0_Value[Status_Flag] := 2;
  end;



procedure TCustom.PanningBoxChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Panning
    Panning_Value[offset]:=REV_Search(PanningBox.Text, Panning_Text, Panning_Code);
    Panning_Value[Status_Flag] := 2;                                            // Update flag set to reflect value change
  end;


// JoyStick

procedure TCustom.JSAFModeChange(Sender: TObject);
  begin
    Field_Changed := True;
    JSAFMode_Value[offset]:=REV_Search(JSAFMode.Text, JSAFMode_Text, JSAFMode_Code);
    JSAFMode_Value[Status_Flag] := 2;
  end;

procedure TCustom.JSLockChange(Sender: TObject);
  begin
    Field_Changed := True;
    JSLock_Value[offset]:=REV_Search(JSLock.Text, JSLock_Text, JSLock_Code);
    JSLock_Value[Status_Flag] := 2;
  end;

procedure TCustom.JSMFModeChange(Sender: TObject);
  begin
    Field_Changed := True;
    JSMFMode_Value[offset]:=REV_Search(JSMFMode.Text, JSMFMode_Text, JSMFMode_Code);
    JSMFMode_Value[Status_Flag] := 2;
  end;

procedure TCustom.JSOPModeChange(Sender: TObject);
  begin
    Field_Changed := True;
    JSOPMode_Value[offset]:=REV_Search(JSOPMode.Text, JSOPMode_Text, JSOPMode_Code);
    JSOPMode_Value[Status_Flag] := 2;
  end;

procedure TCustom.KelvinComboBoxChange(Sender: TObject);
begin
   //
   Field_Changed := True;
   Kelvin_Value[offset]:=REV_Search(KelvinComboBox.Text, Kelvin_Text, Kelvin_Code);
   Kelvin_Value[Status_Flag] := 2;

end;

procedure TCustom.VidProComboBoxChange(Sender: TObject);
begin
    Field_Changed := True;

    VidPro_Value[offset]:=REV_Search(VidProComboBox.Text, VidPro_Text, VidPro_Code);
    VP_Offset :=  VidProComboBox.ItemIndex;

    UpdateCustom();
end;


procedure TCustom.FilmStyleChange(Sender: TObject);
  begin
    FS_Offset :=  FilmStyle.ItemIndex;

    // Film Stle
    FilmStyle_Value[offset]:=REV_Search(FilmStyle.Text, FilmStyle_Text,FilmStyle_Code);  // Film Style Codes
    FilmStyle_Value[Status_Flag] := 2;
  end;



procedure TCustom.FocusComboBoxChange(Sender: TObject);
  begin
  Field_Changed :=True ;
    Focus_Value[offset]:=REV_Search(FocusComboBox.Text, Focus_Text,Focus_Code);     // Focus Codes
    Focus_Value[Status_Flag] := 2;
  end;

procedure TCustom.ArtistChange(Sender: TObject);
  begin
  //Field_Changed :=True ;
  end;





// Wheels

procedure TCustom.SL3BackWheelBoxChange(Sender: TObject);
  begin
    Field_Changed := True;

    sDial := 'Back';

    CommitDialChanges(sDial);

  end;

procedure TCustom.SL3LeftWheelBoxChange(Sender: TObject);
  begin
    Field_Changed := True;

    sDial := 'Left';

    CommitDialChanges(sDial);

  end;

procedure TCustom.Left_Wheel_RotationClick(Sender: TObject);
begin
   Field_Changed := True;
                                                                                // 0 = Clockwise, 1 = Anti-Clockwise
     If SL3Left_Wheel_Rotation.IsChecked = True then
       begin
       LeftDial_Rotation_Value[offset] :=  1;
       end

     else
       LeftDial_Rotation_Value[offset] :=  0;

     LeftDial_Rotation_Value[Status_Flag] :=  2;
end;

procedure TCustom.Back_Wheel_RotationClick(Sender: TObject);
begin
    Field_Changed := True;
     If SL3Back_Wheel_Rotation.IsChecked = True then
       begin
       RearDial_Rotation_Value[offset] :=  1;
       end

     else
       RearDial_Rotation_Value[offset] :=  0;

     RearDial_Rotation_Value[Status_Flag] :=  2;
end;

procedure TCustom.Right_Wheel_RotationClick(Sender: TObject);
begin
    Field_Changed := True;
     If SL3Right_Wheel_Rotation.IsChecked = True then
       begin
       RightDial_Rotation_Value[offset] :=  1;
       end

     else
       RightDial_Rotation_Value[offset] :=  0;
     RightDial_Rotation_Value[Status_Flag] :=  2;
end;

procedure TCustom.SL3RightWheelBoxChange(Sender: TObject);
  begin
    Field_Changed := True;

    sDial := 'Right';

    CommitDialChanges(sDial);

  end;



procedure TCustom.SL3WheelTabContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

// Buttons

procedure TCustom.SL3Button3BoxChange(Sender: TObject);
  begin
    Field_Changed := True;

    if PV_Button.IsChecked = False  then        //Button in Photo Mode
      Begin
      Button3_Value[offset,Photo] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button3_Value[Status_Flag,Photo] :=2;
      end
    else
      Begin
      Button3_Value[offset,Video] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button3_Value[Status_Flag,Video] :=2;
      end

  end;

procedure TCustom.SL3Button4BoxChange(Sender: TObject);
  begin
    Field_Changed := True;

    if PV_Button.IsChecked = False  then        //Button in Photo Mode
      Begin
      Button4_Value[offset,Photo] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button4_Value[Status_Flag,Photo] :=2;
      end
    else
      Begin
      Button4_Value[offset,Video] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button4_Value[Status_Flag,Video] :=2;
      end

  end;

procedure TCustom.SL3Button9BoxChange(Sender: TObject);
  begin
    Field_Changed := True;

    if PV_Button.IsChecked = False  then        //Button in Photo Mode
      Begin
      Button9_Value[offset,Photo] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button9_Value[Status_Flag,Photo] :=2;
      end
    else
      Begin
      Button9_Value[offset,Video] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button9_Value[Status_Flag,Video] :=2;
      end

  end;

procedure TCustom.SL3Button10BoxChange(Sender: TObject);
  begin
    Field_Changed := True;

    if PV_Button.IsChecked = False  then        //Button in Photo Mode
      Begin
      Button10_Value[offset,Photo] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button10_Value[Status_Flag,Photo] :=2;
      end
    else
      Begin
      Button10_Value[offset,Video] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button10_Value[Status_Flag,Video] :=2;
      end

  end;

procedure TCustom.SL3Button20BoxChange(Sender: TObject);
  begin
     Field_Changed := True;

    if PV_Button.IsChecked = False  then        //Button in Photo Mode
      Begin
      Button20_Value[offset,Photo] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button20_Value[Status_Flag,Photo] :=2;
      end
    else
      Begin
      Button20_Value[offset,Video] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      Button20_Value[Status_Flag,Video] :=2;
      end

  end;

  procedure TCustom.SL3FnButtonBoxChange(Sender: TObject);
  begin
    Field_Changed := True;

    if PV_Button.IsChecked = False  then        //Button in Photo Mode
      Begin
      FnButton_Value[offset,Photo] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      FnButton_Value[Status_Flag,Photo] :=2;
      end
    else
      Begin
      FnButton_Value[offset,Video] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
      FnButton_Value[Status_Flag,Video] :=2;
      end

  end;


// Others

  procedure TCustom.ContrastChange(Sender: TObject);
  begin
  Field_Changed :=True ;
  // Contrast
    Contrast0_Value[offset]  :=REV_Search(Contrast.Text, FilmStyleSetting_Text, FilmStyleSetting_Code);
    Contrast0_Value[Status_Flag] := 2;
  end;

procedure TCustom.CopyrightChange(Sender: TObject);
  begin
  //Field_Changed :=True
  end;




Procedure TCustom.CommitChanges(vOffset: integer; PASM_Old : integer; Close_Prog: Boolean);

  begin



// Buttons

            if PV_Button.IsChecked = False  then        //Button in Photo Mode
             begin

              Button3_Value[offset,Photo] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
              Button3_Value[Status_Flag,0] := 2;

              Button4_Value[offset,Photo] := REV_Search(SL3Button4Box.Text, Button_Text, Button_Code);
              Button4_Value[Status_Flag,0] := 2;

              Button9_Value[offset,Photo] := REV_Search(SL3Button9Box.Text, Button_Text, Button_Code);
              Button9_Value[Status_Flag,0] := 2;

              Button10_Value[offset,Photo] := REV_Search(SL3Button10Box.Text, Button_Text, Button_Code);
              Button10_Value[Status_Flag,0] := 2;

              Button20_Value[offset,Photo] := REV_Search(SL3Button20Box.Text, Button_Text, Button_Code);
              Button20_Value[Status_Flag,0] := 2;

              FNButton_Value[offset,Photo] := REV_Search(SL3FNButtonBox.Text, Button_Text, Button_Code);
              FnButton_Value[Status_Flag,0] := 2;


              end

            else      // Button in Video Mode

              Begin

              Button3_Value[offset,Video] := REV_Search(SL3Button3Box.Text, Button_Text, Button_Code);
              Button3_Value[Status_Flag,0] := 2;

              Button4_Value[offset,Video] := REV_Search(SL3Button4Box.Text, Button_Text, Button_Code);
              Button4_Value[Status_Flag,0] := 2;

              Button9_Value[offset,Video] := REV_Search(SL3Button9Box.Text, Button_Text, Button_Code);
              Button9_Value[Status_Flag,0] := 2;

              Button10_Value[offset,Video] := REV_Search(SL3Button10Box.Text, Button_Text, Button_Code);
              Button10_Value[Status_Flag,0] := 2;

              Button20_Value[offset,Video] := REV_Search(SL3Button20Box.Text, Button_Text, Button_Code);
              Button20_Value[Status_Flag,0] := 2;

              FNButton_Value[offset,Video] := REV_Search(SL3FNButtonBox.Text, Button_Text, Button_Code);
              FnButton_Value[Status_Flag,0] := 2;

              End;


            Field_Changed := False;

            if Close_Prog then
            Begin
            Custom1.Close;
            End;
  end;

  procedure TCustom.PageControl1Change(Sender: TObject);
      begin

          PV_Button.enabled:=True;

         if (PageControl1.ActiveTab.Text = 'Film Style')
         or (PageControl1.ActiveTab.Text = 'Video') then

            begin
            PV_Button.enabled:=False;                                           // Turn Off the Photo / Video switch
            end                                                                 // when on the Filmstyle or Video page

         else

            begin
            PV_Button.enabled:=True;
            end;
      end;


end.                    //  End of Unit





