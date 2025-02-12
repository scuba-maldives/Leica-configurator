program Leica_Multi;




uses

  System.IOUtils, System.Notification, System.SysUtils,

  FMX.Styles,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Skia,
  FMX.Types,

  Arrays in 'Arrays.pas',
  Camera_Parameters in 'Camera_Parameters.pas',
  Common_Parameters in 'Common_Parameters.pas',
  Constants in 'Constants.pas',
  CTLoaderFMX in 'CTLoaderFMX.pas' {OFSelector},
  CustomFMX in 'CustomFMX.pas' {Custom},
  DecodeFMX in 'DecodeFMX.pas',
  DisplayArrayFMX in 'DisplayArrayFMX.pas' {DisplayArray},
  ShowArraysFMX in 'ShowArraysFMX.pas' {Arrays1},
  FandPs in 'FandPs.pas',
  MyTypes in 'MyTypes.pas',
  RecodeFMX in 'RecodeFMX.pas',
  Main_FormFMX in 'Main_FormFMX.pas' {Main_Form},
  With_ProgFMX in 'With_ProgFMX.pas' {With_Prog},
  Ask_QuestionFMX in 'Ask_QuestionFMX.pas' {Form3},
  SplashscreenFMX in 'SplashscreenFMX.pas' {Splash},
  AboutFMX in 'AboutFMX.pas' {Form4},
  ShowProfilesFMX in 'ShowProfilesFMX.pas' {Profiles},
  ShowWheelsFMX in 'ShowWheelsFMX.pas' {DialsForm},
  ShowButtonsFMX in 'ShowButtonsFMX.pas' {ButtonsForm},
  VersionFMX in 'VersionFMX.pas' {Form1};

{$R *.res}

begin


	{$IFNDEF DEBUG}
	  Splash := TSplash.Create(nil) ;
	  Splash.Show;
    Application.ProcessMessages;
    Sleep(2000);
 	{$ENDIF}

  {$IFDEF MSWindows}

           var path := ExtractFilePath(ParamStr(0) );

           //showmessage('Path = ' + System.IOUtils.TPath.GetHomePath);

             if System.SysUtils.FileExists(Path + 'Styles\Ians_Carbon.style') = true then
                begin
                     TStyleManager.SetStyleFromFile(Path + 'Styles\Ians_Carbon.style');

                end

             else
                 begin
                     showmessage('Style File Not Found! Starting anyway.');
                 end;

   {$ELSE}
           {$IFDEF MACOS}

           var path := ExtractFilePath(ParamStr(0) );

           //var path := (System.IOUtils.TPath.GetHomePath);

           //showmessage('Path = ' + Path);

           if System.SysUtils.FileExists(Path + '../Styles/Ians_OxfordBlueSE_Mac.style') = true then

            begin
                 TStyleManager.SetStyleFromFile(Path + '../Styles/Ians_OxfordBlueSE_Mac.style');
            end

          else

            begin
                 showmessage('Style File Not Found! Starting anyway.');
            end;


            GlobalUseSkia := True;
            //GlobalUseMetal := True;
            GlobalUseDirect2D         := False  ;
            GlobalUseGDIPlusClearType := False ;
            GlobalDisableFocusEffect  := True  ;





            {$ENDIF}

  {$ENDIF}




  Application.Initialize;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TForm4, Form4);
  //Application.CreateForm(TProfiles, Profiles);
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TDisplayArray, DisplayArray1);
  //Application.CreateForm(TWith_Prog, With_Prog1);
  //Application.CreateForm(TButtonsForm, ButtonsForm);
  //Application.CreateForm(TOFSelector, OFSelector);
  //Application.CreateForm(TArrays, Arrays1);
  //Application.CreateForm(TDialsForm, DialsForm);
  Application.CreateForm(TAsk, Ask);
  

	{$IFNDEF DEBUG}
  Splash.Close;
  Splash.Free;
 	{$ENDIF}

  Application.Run;
end.
