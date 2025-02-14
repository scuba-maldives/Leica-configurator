unit Main_FormFMX;

interface

uses

  Arrays, Data.Bind.Components, Data.Bind.Grid, FandPs, FMX.TabControl,FMX.StdCtrls,FMX.ComboEdit,
  FMX.Controls, FMX.Controls.Presentation, FMX.Dialogs, FMX.DialogService,
  FMX.Edit, FMX.ExtCtrls, FMX.Forms, FMX.Graphics, FMX.Grid, FMX.Layouts,
  FMX.ListBox, FMX.Memo, FMX.Memo.Types, FMX.Menus, FMX.NumberBox, FMX.Objects,
  FMX.ScrollBox, FMX.Text, FMX.Types, MyTypes,

  System.IOUtils, System.Notification, System.SysUtils,System.Classes,
  System.UITypes, System.Variants;


  Var NewSize: Integer = 51545;

  var New_FilePath: String;

  f: text;

type


    TMain_Form = class(TForm)
    OpenSettings: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Memo_Filename: TMemo;
    Memo_FilmSim: TMemo;
    JPG_Res: TMemo;
    Memo_CamDetail: TMemo;
    DNG_Res: TMemo;
    Memo_WB: TMemo;
    AspectRatio: TMemo;
    Memo_Focus: TMemo;
    SensorFormatSettings: TMemo;
    Memo_DriveMode: TMemo;
    OpenCustom: TOpenDialog;
    SaveCustom: TSaveDialog;
    ToolBar1: TToolBar;
    Memo_IS: TMemo;
    ISO: TMemo;
    Label13: TLabel;
    Memo_Kelvin: TMemo;
    Label14: TLabel;
    Timer1: TTimer;
    ImageControl1: TImageControl;
    MenuBar1: TMenuBar;
    File1: TMenuItem;
    Import: TMenuItem;
    Export: TMenuItem;
    Save: TMenuItem;
    Exit: TMenuItem;
    Edit: TMenuItem;
    Image: TMenuItem;
    AMMFSettings: TMenuItem;
    Custom: TMenuItem;
    SaveCustom2: TMenuItem;
    LoadCustom: TMenuItem;
    Settings: TMenuItem;
    Logging1: TMenuItem;
    FactoryDefault2: TMenuItem;
    View: TMenuItem;
    Dials1: TMenuItem;
    Buttons1: TMenuItem;
    FilmStyle1: TMenuItem;
    ViewArrays1: TMenuItem;
    Help: TMenuItem;
    About: TMenuItem;
    WithProgram: TMenuItem;
    Version: TMenuItem;
    License: TMenuItem;
    CameraSettings: TMenuItem;
    FilmStyle: TMenuItem;
    Buttons: TMenuItem;
    Dials: TMenuItem;
    Video: TMenuItem;
    Joystick: TMenuItem;
    Debug1: TMenuItem;
    SingleRecord1: TMenuItem;
    ViewArray1: TMenuItem;


    procedure UpdateMain(Sender: TObject);

    procedure FormCreate(Sender: TObject) ;
    procedure ExitClick(Sender: TObject);
    procedure ImportClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure AFMFSettingClick(Sender: TObject);
    procedure VideoSettingClick(Sender: TObject);
    procedure WithProgramClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure Version1Click(Sender: TObject);
    procedure ReadClick(Sender: TObject);
    procedure SaveCustom1(Sender: TObject);
    procedure LoadCustom1(Sender: TObject);
    procedure Load2Click(Sender: TObject);
    procedure Debug1Click(Sender: TObject);
    procedure TargetChange(Sender: TObject);
    procedure ViewWheels1Click(Sender: TObject);
    procedure ViewButtons1Click(Sender: TObject);
    procedure ViewArray1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FlimStyle1Click(Sender: TObject);
    procedure WheelAssignment1Click(Sender: TObject);
    procedure JoystickSettings1Click(Sender: TObject);
    procedure SingleRecord1Click(Sender: TObject);
    procedure CameraSettingsClick(Sender: TObject);
    procedure ViewArrays1Click(Sender: TObject);
    procedure Logging1Click(Sender: TObject);
    procedure ExportClick(Sender: TObject);
    procedure FactoryDefault1Click(Sender: TObject);
    procedure ViewProfiles1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LicenseClick(Sender: TObject);



  private
    { Private declarations }

  public


  end;

var

  Main_Form  : TMain_Form;
  myFile      : File;
  FS          : TFileStream;
  FW          : TWriter;
  FR          : TReader;
  Count       : LongInt;
  AStream     : TStream;

  First_Boot  : Boolean;

implementation

  uses  Constants, DecodeFMX, RecodeFMX, CTLoaderFMX, Common_Parameters,
        With_ProgFMX, Camera_Parameters,CustomFMX, ShowWheelsFMX,
        ShowButtonsFMX, AboutFMX, ShowArraysFMX, DisplayarrayFMX, ShowProfilesFMX, VersionFMX, LicenseFMX;


{$R *.FMX}
{$R *.Macintosh.fmx MACOS}
{$R *.Windows.fmx MSWINDOWS}

procedure TMain_Form.FormCreate(Sender: TObject) ;

  begin
       //showmessage('Reached Form Create');




  {$IFDEF DEBUG}
        begin
            //showmessage('Debug Version');
            Main_Form.Caption   := ' Leica Settings Editor: Debug Edition' ;
            Debug               := True ;
            Debug1.enabled      := True ;
            Debug1.visible      := True ;
            Licenced            := True ;
            Logging1.IsChecked  := False ;
            ViewArray1.visible  := True ;
            ViewArrays1.visible := True ;
            First_FileName := 'settings SL3.tmp';
            end;

  {$ELSE}

    {$IFDEF Trial_Version}
          begin
          //showmessage('Trial Version');
          Main_Form.Caption     := ' Leica Settings Editor: This is a TRIAL RELEASE version' ;
          Debug                 := False ;
          Debug1.enabled        := False ;
          Debug1.visible        := False ;
          Licenced              := False ;
          Logging1.IsChecked    := False ;
          SingleRecord1.checked := False ;
          SingleRecord1.Visible := False ;
          ViewArray1.visible    := False ;
          ViewArrays1.visible   := False ;
          First_FileName := 'Factory.tmp';
          end;

   {$ELSE}

     {$IFDEF RELEASE}
            begin
            //showmessage('Release Version');
            Main_Form.Caption     := ' Leica Settings Editor: Release Version' ;
            Debug                 := False ;
            Debug1.enabled        := False ;
            Debug1.visible        := False ;
            Licenced              := False ;
            Logging1.IsChecked    := False ;
            SingleRecord1.Ischecked := False ;
            SingleRecord1.Visible := False ;
            ViewArray1.visible    := False ;
            ViewArrays1.visible   := False ;
            First_FileName := 'Factory.tmp';
            end;

      {$ENDIF}
    {$ENDIF}
  {$ENDIF}



        vSingleRecord :=  SingleRecord1.IsChecked;

        SetLength(Camera_array, CusFileSize);

        New_FileName := 'Settings.lcs';

          First_Boot := True;
          FactoryDefault1Click(Sender);

          First_Boot := False;

        //Showmessage('Reached Start of Main_Form');

        For VAR I := 0 to 5 do
           begin
            LeftDial_Photo_Valid[I,P]  :=  LeftDial_Photo_Valid_P[I];               // Populate the Wheel Valid Array
            RearDial_Photo_Valid[I,P]  :=  RearDial_Photo_Valid_P[I];
            RightDial_Photo_Valid[I,P]  :=  RightDial_Photo_Valid_P[I];

            LeftDial_Photo_Valid[I,A]  :=  LeftDial_Photo_Valid_A[I];
            RearDial_Photo_Valid[I,A]  :=  RearDial_Photo_Valid_A[I];
            RightDial_Photo_Valid[I,A]  :=  RightDial_Photo_Valid_A[I];

            LeftDial_Photo_Valid[I,S]  :=  LeftDial_Photo_Valid_S[I];
            RearDial_Photo_Valid[I,S]  :=  RearDial_Photo_Valid_S[I];
            RightDial_Photo_Valid[I,S]  :=  RightDial_Photo_Valid_S[I];

            LeftDial_Photo_Valid[I,M]  :=  LeftDial_Photo_Valid_M[I];
            RearDial_Photo_Valid[I,M]  :=  RearDial_Photo_Valid_M[I];
            RightDial_Photo_Valid[I,M]  :=  RightDial_Photo_Valid_M[I];

           end;



         For Var X := 0 to 3 do
           begin

             if Wheel_Text[X] = ' ' then

               begin
               showmessage('Wheel Text was blank');
               end

             else
               begin
               Wheel_Text[X]  :=  Wheel_Text_P[X];                              // Populate the Wheel Text Array
               end;

           end;

         For Var X := 0 to Length(Wheel_Code_P)-1 do
           begin
           Wheel_Code[X]  :=  Wheel_Code_P[X];                                  // Populate the Wheel Value Array
           end;

         UpdateMain(Sender);
  end;







procedure TMain_Form.Logging1Click(Sender: TObject);
    begin
         Logging1.IsChecked := not Logging1.IsChecked;
    end;



procedure TMain_Form.Load2Click(Sender: TObject);
    begin
        Clear_Status_Flags(0);
        LoadCustom1(Sender);
    end;


procedure TMain_Form.ImportClick(Sender: TObject);

  begin

    Clear_Status_Flags(0);

     {$IFDEF MSWindows}

        var path := ExtractFilePath(ParamStr(0) );

        //var Path := GetParentFolder(ParamStr(0), 2);

        OpenSettings.InitialDir := (Path + 'SettingsFiles\');

      {$ELSE}

      {$IFDEF MACOS}

          //var Path := (GetParentFolder(ParamStr(0), 7) +  'Leica/');

          var Path := (System.IOUtils.TPath.GetHomePath) + '/Leica/Settings/';

          //showmessage('Path = ' + Path);

          OpenSettings.InitialDir := Path;


      {$ENDIF}

    {$ENDIF}



        if OpenSettings.Execute then

            begin

                  FullFileName := (OpenSettings.FileName);

                  Memo_Filename.ClearContent;                                   // If it exists, load the data into the memo box.

                  Memo_Filename.Text := ExtractFileName(FullFileName);          // Show filename on Form

                  CusFilesize := 0;

                  //showmessage('Here');

                  If MyGetFileSize(FullFileName) = 1 then

                        begin

                          FS := TFileStream.Create(FullFileName,fmShareDenyNone or fmOpenRead);

                              if Assigned(FS)
                              then

                                begin

                                  FS.Position := 0;                             // Reset to the beginning of the stream.

                                    try

                                      FS.Read(Camera_array[0],CusFileSize);

                                    finally

                                      FS.Free;

                                    end
                                end;



                          Clear_Status_Flags(0);
                          checkCameraModel();
                          FileType := 'Import';                                         // Set FileType to import
                          Decode_Header();
                          RunDecode(0);
                          UpdateMain(Sender);

                        end

                      else
                         showmessage('Failed to Open File ' + FullFileName);

             end


          else
            begin
            raise Exception.Create('Please select a file to open');
            ImportClick(Sender);
            end;
end;




procedure TMain_Form.ExportClick(Sender: TObject);



  begin

    Application.CreateForm(TOFSelector, OFSelector);                            // Select Export File Type
    OFSelector.ShowModal;
    OFSelector.destroy;

    var Template_filename: String;

    //showmessage('Model Selected was ' + vExportCameraModel);

    If vCameraModel <> 'None Selected'   then                                   // Load Camera_Array with template of Camera file to be written out
      begin
            for var I := 0 to Length(Camera_Array)-1 do                         // Clear database ready for new file
            Camera_Array[i] := 0 ;


          If vExportCameraModel = 'LEICA SL'   then                                   // Load Camera_Array with template of Camera file to be written out
          begin
            Template_filename:='Settings SL.tmp';
          end;

          If vExportCameraModel = 'LEICA SL2'   then
          begin
            Template_filename:='Settings SL2.tmp';
          end;

          If vExportCameraModel = 'LEICA SL2S'   then
          begin
            Template_filename:='Settings SL2S.tmp';
          end;

          If vExportCameraModel = 'LEICA SL3'   then                                  //LEICA SL3-S
          begin
            Template_filename:='Settings SL3.tmp';
          end;

          If vExportCameraModel = 'LEICA SL3-S'   then                                  //LEICA SL3-S
          begin
            Template_filename:='Settings SL3S.tmp';
          end;

          If vExportCameraModel = 'LEICA Q'   then
          begin
            Template_filename:='Settings Q.tmp';
          end;

          If vExportCameraModel = 'LEICA Q2'   then
          begin
            Template_filename:='Settings Q2.tmp';
          end;

          If vExportCameraModel = 'LEICA Q3'   then
          begin
            Template_filename:='Settings Q2.tmp';
          end;

          If vExportCameraModel = 'LEICA Q3 43'   then
          begin
            Template_filename:='Settings Q3 43.tmp';
          end;

          If vExportCameraModel = 'LEICA M'   then
          begin
            Template_filename:='Settings M.tmp';
          end;

          If vExportCameraModel = 'LEICA M11'   then
          begin
            Template_filename:='Settings M11.tmp';
          end;

          If vExportCameraModel = 'LEICA Q2 MONO'   then
          begin
            Template_filename:='settings Q2 Mono.tmp';
          end;



          If vExportCameraModel <> 'None Selected'   then                                 // If there is a valid Camera Type selected
          begin

          end;


            CusFilesize := 0;                                                       // Reset CustomFileSize


       {$IFDEF MSWindows}

           FullFileName := (ExtractFilePath(ParamStr(0) ) + 'Templates\' + Template_filename);


       {$ELSE}

           {$IFDEF MACOS}


           FullFileName := (GetParentFolder(ParamStr(0), 3) +  'Contents/Templates/'+ Template_filename);

           {$ENDIF}

       {$ENDIF}


           //showmessage('Full Filename = ' + FullFileName);

            If MyGetFileSize(FullFileName) = 1 then

                begin

                  FS := TFileStream.Create(FullFileName,fmShareDenyNone or fmOpenRead);

                      if Assigned(FS)
                      then

                        begin

                          FS.Position := 0;                                     // Reset to the beginning of the stream.

                            try

                              FS.Read(Camera_array[0],CusFileSize);             // Open the Template file specified
                                                                                // and read into the Camera_Array
                            finally

                              FS.Free;

                            end
                        end;


                    FileType  := 'Export';




                    Decode_Header();                                              // Check the file header for the Camera type

                    If (vCameraModel = 'LEICA M11') or (vCameraModel = 'LEICA M')   then  // Output the new Settings File
                      begin
                      filename:= 'Settings.lcse';
                      end;

                    If vCameraModel <> 'LEICA M11'   then
                      begin
                      filename:= 'Settings.lcs';
                      end;

                  RunRecode();                                                  // Add all the changed array values to Camera_Array

                  Save_File();                                                  // Export the Camera_Array to the Settings.lcs file

                  RemoveQuotes();                                               // Remove speach marks from the internal arrays
                end

            else
              showmessage('Failed to Open File ' + FullFileName);

     end



  end;



procedure TMain_Form.SaveClick(Sender: TObject);

  begin

     {$IFDEF MSWindows}

      SaveDialog1.InitialDir := TPath.Combine(ExtractFilePath(ParamStr(0)), 'output\');
        if SaveDialog1.Execute then
        begin
          FileName := (SaveDialog1.FileName);
          filepath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'output\');
          //Save_File();
        end;

      {$ELSE}

      {$IFDEF MACOS}

          //showmessage('Path = ' + filepath);

          filepath :=  (GetParentFolder(ParamStr(0), 7) +  'Leica/output/');
          SaveDialog1.FileName := 'Settings';
          SaveDialog1.InitialDir := filepath;

          if SaveDialog1.Execute then
          begin
            FileName := (SaveDialog1.FileName);

            //showmessage('FileName = ' + FileName);

            //Save_File();
          end;


      {$ENDIF}

    {$ENDIF}


          FileType  := 'Export';

          //Decode_Header();                                              // Check the file header for the Camera type

          If (vCameraModel = 'LEICA M11') or (vCameraModel = 'LEICA M')   then  // Output the new Settings File
            begin
            filename:= 'Settings.lcse';
            end;

          If vCameraModel <> 'LEICA M11'   then
            begin
            filename:= 'Settings.lcs';
            end;

        RunRecode();                                                  // Add all the changed array values to Camera_Array

        Save_File();                                                  // Export the Camera_Array to the Settings.lcs file

        RemoveQuotes();                                               // Remove speach marks from the internal arrays

  end;


procedure TMain_Form.LoadCustom1(Sender: TObject) ;


  begin
        Clear_Status_Flags(0);



  {$IFDEF MSWindows}

        var path := ExtractFilePath(ParamStr(0) );                              // Location of Exe
        OpenCustom.InitialDir := (Path +'Custom\');

      {$ELSE}

      {$IFDEF MACOS}

          var Path := (GetParentFolder(ParamStr(0), 7) +  'Leica/Custom/');

          //showmessage('Path = ' + Path);

          OpenCustom.InitialDir := Path;

      {$ENDIF}

  {$ENDIF}

        if OpenCustom.Execute then

          begin

                    New_FileName := (OpenCustom.FileName);

                    Memo_Filename.ClearContent;                                 // If it exists, load the data into the memo box.
                    Memo_Filename.Text := ExtractFileName(New_FileName);        // Show filename on Form

                    //ShowMessage('Reading File "' + New_FileName +  '" of Filesize ' + inttostr(CusFilesize));
                    CusFilesize := 0;


                    If MyGetFileSize(FullFileName) = 1 then

                          begin

                            FS := TFileStream.Create(FullFileName,fmShareDenyNone or fmOpenRead);

                                if Assigned(FS)
                                then

                                  begin

                                    FS.Position := 0;                             // Reset to the beginning of the stream.

                                      try

                                        FS.Read(Camera_array[0],CusFileSize);

                                      finally

                                        FS.Free;

                                      end
                                  end;

                            Clear_Status_Flags(0);
                            checkCameraModel();
                            FileType := 'Import';                               // Set FileType to import
                            Decode_Header();
                            RunDecode(0);
                            UpdateMain(Sender);

                          end

                        else
                           showmessage('Failed to Open File ' + FullFileName);

          end


          else
            begin
            raise Exception.Create('No File was loaded');
            ImportClick(Sender);
            end;
  end;


  procedure TMain_Form.SaveCustom1(Sender: TObject);

  begin

  {$IFDEF MSWindows}

      SaveCustom.InitialDir := TPath.Combine(ExtractFilePath(ParamStr(0)), 'Custom\');

        if SaveCustom.Execute then
        begin
          FileName := (SaveCustom.FileName);
          Save_File();
        end;

      {$ELSE}

      {$IFDEF MACOS}

          var filepath := (GetParentFolder(ParamStr(0), 7) +  'Leica/Custom/');

          //showmessage('Path = ' + Path);

          SaveCustom.InitialDir := filepath;

          Save_File();

      {$ENDIF}

  {$ENDIF}

  end;



procedure TMain_Form.UpdateMain(Sender: TObject);
  begin

    if (FilmStyle_Value[Status_Flag] =0 )  or (FilmStyle_Value[Status_Flag] > 3) then
      begin
          FilmStyle.visible   := False;
      end
    else
      begin
          FilmStyle.visible   := True;
          Memo_FilmSim.Text := vFilmStyle;
      end;

    if (VidPro_Value[Status_Flag] = 0 )  or (VidPro_Value[Status_Flag] > 3)  then
      begin
          Video.visible   := False;
      end
   else
      begin
          Video.visible   := True;
      end;


    if (JSAFMode_Value[Status_Flag] =0 )  or (JSAFMode_Value[Status_Flag] > 3)  then
      begin
          Joystick.visible := False;
      end
    else
      begin
          Joystick.visible := True;
      end;

    if (RightDial_Rotation_Value[Status_Flag] =0 )  or (RightDial_Rotation_Value[Status_Flag] > 3)  then
      begin
          Dials.visible := False;
      end
    else
      begin
          Dials.visible := True;
      end;

        If  ISO_Value[0] <> 0 then
          ISO.Text  := inttostr(ISO_Value[0])
        else
          ISO.Text  := 'Auto';

        DNG_Res.Text := vDNG_Res ;
        JPG_Res.Text := vJPG_Res ;
        Memo_CamDetail.Text := vCameraModel ;
        Memo_WB.Text := vWhiteBalance ;
        Memo_Kelvin.Text := vKelvin;
        AspectRatio.Text := vAspect;
        Memo_Focus.Text := vFocus ;
        SensorFormatSettings.Text := vSensorFormat ;
        Memo_DriveMode.Text := vDriveMode ;
        Memo_IS.Text := vIBIS;

  end;

  procedure TMain_Form.TargetChange(Sender: TObject);
  begin

          UpdateMain(Sender);
  end;




procedure TMain_Form.Timer1Timer(Sender: TObject);
begin
     Timer1.Enabled:= false;
end;

procedure TMain_Form.FactoryDefault1Click(Sender: TObject);
  begin

      Clear_Status_Flags(0);

      Answer := 'true';

        if First_Boot = False then
        begin
          Answer := QuestionChanges('You wish to revert ALL settings to Factory default ?');
          First_FileName := 'Factory.tmp' ;
        end;


          {$IFDEF MSWindows}
            FullFileName :=  (ExtractFilePath(ParamStr(0) ) + 'Templates\'+ First_FileName);

            {$ELSE}

               {$IFDEF MACOS}

              if First_Boot = True then
              begin
                  FullFileName := (GetParentFolder(ParamStr(0), 3) +  'Contents/Templates/' + 'Factory.tmp');

                  //showmessage('FullFilename = ' + FullFileName);

                  First_Boot := False;
              end

              else

                  //FullFileName := (System.IOUtils.TPath.GetHomePath) + '/Leica/Templates/' + First_FileName;

                  FullFileName := (GetParentFolder(ParamStr(0), 3) +  'Contents/Templates/' + 'Factory.tmp');


                  //showmessage('FullFilename = ' + FullFileName);


               {$ENDIF}

            {$ENDIF}




      if Answer = 'true' Then
          Begin

               If MyGetFileSize(FullFileName) = 1 then



                begin

                  //showmessage('FullFilename = ' + FullFileName);

                  FS := TFileStream.Create(FullFileName,fmShareDenyNone or fmOpenRead);

                      if Assigned(FS)
                      then

                        begin

                          FS.Position := 0;      // Reset to the beginning of the stream.

                            try

                              FS.Read(Camera_array[0],CusFileSize);

                            finally

                              FS.Free;

                            end
                        end;

                  Clear_Status_Flags(0);
                  checkCameraModel();
                  FileType := 'Import';                                         // Set FileType to import
                  Decode_Header();
                  RunDecode(0);
                  UpdateMain(Sender);

                end

              else
                 showmessage('Failed to Open File ' + FullFileName);
          end

       else if Answer = 'false' Then
          Begin
             showmessage('Nothing Changed');
          end;

  end;



procedure TMain_Form.FlimStyle1Click(Sender: TObject);
begin
    Application.CreateForm(TCustom, Custom1);
    Custom1.PageControl1.ActiveTab := Custom1.FilmTab;

    Custom1.ShowModal;
    Custom1.hide;
end;



  procedure TMain_Form.SingleRecord1Click(Sender: TObject);
  begin
     SingleRecord1.IsChecked := not  SingleRecord1.IsChecked;
     vSingleRecord := not  vSingleRecord;
  end;


  procedure TMain_Form.ReadClick(Sender: TObject);
  begin
    UpdateMain(Sender);
  end;


  //////////////////////  NEW Menu Items  ///////////////////////////



  procedure TMain_Form.ViewArray1Click(Sender: TObject);
begin
    //Application.CreateForm(TDisplayArray, DisplayArray1);
    //DisplayArray1.ShowModal;
end;


procedure TMain_Form.AboutClick(Sender: TObject);
  begin
      Form4.ShowModal;
  end;


procedure TMain_Form.LicenseClick(Sender: TObject);
begin
     Form2.ShowModal;
end;


procedure TMain_Form.WithProgramClick(Sender: TObject);
  begin
      Application.CreateForm(TWith_Prog, With_Prog1);
      With_Prog1.ShowModal;
  end;

    procedure TMain_Form.Version1Click(Sender: TObject);
  begin
      Form1.VersionText.Text :='Program Version = ' + currentVersion ;    //Frame1: TFrame
      Form1.ShowModal;
  end;


  procedure TMain_Form.ViewArrays1Click(Sender: TObject);
  begin
      Application.CreateForm(TArrays,Arrays1);
      Arrays1.Show;
  end;


  procedure TMain_Form.Image2Click(Sender: TObject);
  begin
      Application.CreateForm(TCustom, Custom1);
      Field_Changed := False;
      Custom1.ShowModal;
      Custom1.Hide;
  end;



procedure TMain_Form.AFMFSettingClick(Sender: TObject);
  begin
      Application.CreateForm(TCustom, Custom1);
      Custom1.PageControl1.ActiveTab := Custom1.AFMF_Tab;
      Field_Changed := False;
      Custom1.ShowModal;
      Custom1.Hide;
  end;


procedure TMain_Form.CameraSettingsClick(Sender: TObject);
  begin
      Application.CreateForm(TCustom, Custom1);
      Custom1.PageControl1.ActiveTab := Custom1.CameraTab;
      Field_Changed := False;
      Custom1.ShowModal;
      Custom1.Hide;
  end;

  procedure TMain_Form.B1Click(Sender: TObject);
  begin
      Application.CreateForm(TCustom, Custom1);

      if (vCameraModel ='LEICA SL3') or (vCameraModel ='LEICA SL3-S') or (vCameraModel ='LEICA Fac') then
      Custom1.PageControl1.ActiveTab := Custom1.SL3ButtonTab;

      If (vCameraModel = 'LEICA SL') or (vCameraModel = 'LEICA SL2') or (vCameraModel = 'LEICA SL2-S') then
      Custom1.PageControl1.ActiveTab := Custom1.SLButtonTab;

      If (vCameraModel = 'LEICA Q') or  (vCameraModel = 'LEICA Q2')
      or (vCameraModel = 'LEICA Q3')or (vCameraModel = 'LEICA Q3 43') then
      Custom1.PageControl1.ActiveTab := Custom1.QButtonTab;

      If (vCameraModel = 'LEICA M') or  (vCameraModel = 'LEICA M11') or (vCameraModel = 'LEICA Q2 MON') then
      Custom1.PageControl1.ActiveTab := Custom1.MButtonTab;

      Field_Changed := False;
      Custom1.ShowModal;
      Custom1.Hide;
  end;

procedure TMain_Form.WheelAssignment1Click(Sender: TObject);
  begin
      Application.CreateForm(TCustom, Custom1);

      if (vCameraModel ='LEICA SL3') or (vCameraModel ='LEICA SL3-S') or (vCameraModel ='LEICA Fac') then
      Custom1.PageControl1.ActiveTab := Custom1.SL3WheelTab;

      If (vCameraModel = 'LEICA SL') or (vCameraModel = 'LEICA SL2') or (vCameraModel = 'LEICA SL2-S') then
      Custom1.PageControl1.ActiveTab := Custom1.SLWheelTab;

      If (vCameraModel = 'LEICA Q') or  (vCameraModel = 'LEICA Q2')
      or (vCameraModel = 'LEICA Q3')or (vCameraModel = 'LEICA Q3 43') then
      Custom1.PageControl1.ActiveTab := Custom1.QWheelTab;

      //If (vCameraModel = 'LEICA M') or  (vCameraModel = 'LEICA M11') or (vCameraModel = 'LEICA Q2 MON') then
      //Custom1.PageControl1.ActivePage := Custom1.MWheelTab;

      Field_Changed := False;
      Custom1.ShowModal;
      Custom1.Hide;
  end;



procedure TMain_Form.VideoSettingClick(Sender: TObject);
  begin
      Application.CreateForm(TCustom, Custom1);
      Custom1.PageControl1.ActiveTab := Custom1.VideoTab;
      Field_Changed := False;
      Custom1.ShowModal;
      Custom1.Hide;
  end;


procedure TMain_Form.JoystickSettings1Click(Sender: TObject);
  begin
      Application.CreateForm(TCustom, Custom1);
      Custom1.PageControl1.ActiveTab := Custom1.JoystickTab;
      Field_Changed := False;
      Custom1.ShowModal;
      Custom1.Hide;
  end;



procedure TMain_Form.ExitClick(Sender: TObject);
  begin

    Answer := QuestionChanges('You are about to Exit, Have you saved your changes ?');


                begin
                  if Answer = 'true' Then
                    Begin
                       Application.Terminate
                    End


                  else if Answer = 'false' Then
                    Begin
                       //showmessage(' Answer is ' + Answer);
                    end;

                end;

  end;

  procedure TMain_Form.Debug1Click(Sender: TObject);
  begin
         Debug := not Debug;
         ViewArray1.visible := not ViewArray1.visible;
  end;



procedure TMain_Form.ViewWheels1Click(Sender: TObject);
  begin
       Application.CreateForm(TDialsForm, DialsForm);
       DialsForm.Show;
  end;

  procedure TMain_Form.ViewButtons1Click(Sender: TObject);
  begin
       Application.CreateForm(TButtonsForm, ButtonsForm);
       ButtonsForm.Show;
  end;

  procedure TMain_Form.ViewProfiles1Click(Sender: TObject);
begin
       Application.CreateForm(TProfiles, Profiles);
       Profiles.Show;
end;





end.                    //  End of Unit
