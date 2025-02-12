unit Constants;

interface

  var   Debug     : Boolean;
  var   Licenced  : Boolean;


  const currentVersion: String ='v1.9';

	var   LeftDial: boolean = True;                                               // Turn on or off dependant on specific camera type
  var   RearDial: boolean = True;

  var   Button3v:  boolean = True;
  var   Button4v:  boolean = True;
	var   Button9v:  boolean = True;
  var   Button10v: boolean = True;
  var   Button20v: boolean = True;
  var   ButtonFnv: boolean = True;


	const save_restore: boolean= true;
  var   AutoDownload: boolean= true;
  var   vSingleRecord: boolean= False;


  var   CameraType: String = '';

	var   fileName: String = 'Please Load File';
	var   filePath: String = '';
	const user: String = '';
	const comm: String = '';

  var   CUSfileSize: Integer = 51545;

  var   NewDirPath: String =  'C:\\users\\Ian\\Documents\\LeicaDatFiles\\';
  var   SaveFileName: String = '\\NewRestoreFile.dat';
  var   New_FileName : String = 'Please Load File' ;
  var   First_FileName : String = 'Factory.lcs' ;
  var   FullFileSize   : Integer;
  var   FullFileName   : String;

  var   vExportCameraModel   : String;

  var   Index: Integer;

  const Pre_Digit: String = '      ';
  const Single_Digit: String = '1=';
  const Double_Digit: String = '2=';
  const Triple_Digit: String = '3=';
  const Four_Digit  : String = '4=';
  const Five_Digit  : String = '5=';
  var   Post_Digit  : String = (',' + #10);
  var   Post_Digit2  : String = (#10);
  var   EOF         : String = (#10 + '    ' + ']' + ',' + #10 + '    ');       // LF four spaces Close bracket then LF again

  var   CharInt  :Integer = 0;

  var   StartPoint  :Integer = 0;
  var   EndPoint    :Integer = 17;

  var   sChar     : String;
  var   Asc       : Byte;
  var   OffSet    : Integer;
  var   PASMMode  : Integer;
  var   FS_Offset : Integer = 0;
  var   VP_Offset : Integer;

  var   NUMCUSTOMSETTINGS : Integer =6;

  var   fileSize: integer = 0;
  var   str : String = '';
  var   Custom_Offset : Integer ;
  var   headerBytes : String = '';


  var   vFilmStyle    : String = '';
  var   vImageRes     : String = '';
  var   vJPG_Res      : String = '';
  var   vDNG_Res      : String = '';
  var   vCameraModel  : String = '';

  var   vWhiteBalance : String = '';
  var   vKelvin       : String = '';
  var   vSensorFormat : String = '';
  var   vAFMode       : String = '';
  var   vMtrMode      : String = '';
  var   vFocus        : String = '';
  var   vShutter      : String = '';
  var   vISMode       : String = '';
  var   vFocus_Mode   : String = '';

  var   vAspect       : String = '';
  var   vGrain_Effect : String = '';
  var   vNoiseMode    : String = '';
  var   vNoise_LE     : String = '';
  var   vNoiseJPG     : String = '';

  var   vContrast0    : String = '';
  var   vShadow0      : String = '';
  var   vHighlight0   : String = '';
  var   vSharpness0   : String = '';
  var   vSaturation0  : String = '';

  var   vJSAFMode     : String = '';
  var   vJSMFMode     : String = '';
  var   vJSOPMode     : String = '';
  var   vJSLock       : String = '';

  {
  var   vContrast1    : String = '';
  var   vShadow1      : String = '';
  var   vHighlight1   : String = '';
  var   vSharpness1   : String = '';
  var   vSaturation1  : String = '';
  var   vContrast2    : String = '';
  var   vShadow2      : String = '';
  var   vHighlight2   : String = '';
  var   vSharpness2   : String = '';
  var   vSaturation2  : String = '';
  var   vContrast3    : String = '';
  var   vShadow3      : String = '';
  var   vHighlight3   : String = '';
  var   vSharpness3   : String = '';
  var   vContrast4    : String = '';
  var   vShadow4      : String = '';
  var   vHighlight4   : String = '';
  var   vSharpness4   : String = '';
  }

  var   vDriveMode    : String = '';
  var   vISO          : String = '';
  var   vPASMMode     : String = '';
  var   vIBIS         : String = '';
  var   vPanning      : String = '';
  var   vExpComp      : String = '';
  var   vVidPro       : String = '';
  var   vAFMethod     : String = '';

  var   vButton3      : String = '';
  var   vButton4      : String = '';
  var   vButton9      : String = '';
  var   vButton10     : String = '';
  var   vButton20     : String = '';
  var   vFnButton     : String = '';

  var   vButton3_Video:   String = '';
  var   vButton4_Video:   String = '';
  var   vButton9_Video:   String = '';
  var   vButton10_Video:  String = '';
  var   vButton20_Video:  String = '';
  var   vButton20_Review: String = '';
  var   vFnButton_Video:  String = '';

  var   vLeftDial       : String = '';
  var   vRearDial       : String = '';
  var   vRightDial      : String = '';
  var   vLeftDial_Video  : String = '';
  var   vRearDial_Video  : String = '';
  var   vRightDial_Video : String = '';


  var   vLeftDialRot    : String = '';
  var   vRearDialRot    : String = '';
  var   vRightDialRot   : String = '';

  var   vVFormat         : String = '';
  var   vVResolution    : String = '';
  var   vVFrameRate     : String = '';
  var   vVCodec         : String = '';
  var   vVCompression   : String = '';
  var   vVYUV           : String = '';
  var   vVBitRate       : String = '';
  var   vVLog           : String = '';
  var   vVSensor        : String = '';
  var   vVAudio         : String = '';
  var   vVMedium        : String = '';


  var   Showarray     : Integer = 1;

  var   P : Integer = 0;                  // PASM values to read 2D array
  var   A : Integer = 1;
  var   S : Integer = 2;
  var   M : Integer = 3;

  var   Photo : Integer = 0;              // Button values to read 2D array
  var   Video : Integer = 1;
  var   Status_Flag : Integer = 7;

  var   z: String = '';

  var   FileType      : String = '';
  var   Answer        : String = '';

  var   Update_Fail   : Boolean = False;


  var   vCopyright    : String = '';
  var   vArtist       : String = '';



implementation

uses Main_FormFMX;

end.
