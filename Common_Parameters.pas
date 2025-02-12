unit Common_Parameters;

  // Defines location of items in Settings file

interface

  var   CameraVersion : String = 'Leica SL3 v1.0';

  var   Test_Name : String = 'Example' ;            //"Example", "String", "NONE" //


  var   Custom_Index: array [0..6] of Integer = (14,23,32,41,50,59,68);           // Place in Camera Array to find each custom var
  //var ISO_Index:    array [0..6] of Integer = (14,26,38,47,59,68,77);           // Place in Camera Array to find each custom var


  //const Lowest_Val : Integer = $0;
  //const Highest_Val : Integer = $3493;		          // End of File

  //var   Cursor    : Integer =$D0	;

  var   COPYRIGHT       : String = '501F';                                      //Marker in Camera_array is 501F
  var   ARTIST          : String = '501E';                                       //Marker in Camera_array is 501E

  var   ExpComp         : String = '5010';						                          //Marker in Camera_array is 5010

  var   COPYRIGHT_ONOFF : String = 'D02F';                                      //Marker in Camera_array is D02F
  var   FLOAT_ISO_ONOFF : String = 'D03D';                                      //Marker in Camera_array is D03D
  var   PASM_Mode       : String = '500E';                                      //Marker in Camera_array is

  var   Button3         : String = 'D195';                                      // Photo Mode
  var   Button4         : String = 'D1D6';
  var   Button9         : String = 'D1D7';
  var   Button10        : String = 'D1DA';
  var   Button20        : String = 'D193';
  var   FnButton        : String = 'D191';

  var   Button3_Video   : String = 'D1D5';                                      // Video Mode
  var   Button4_Video   : String = 'D1D8';
  var   Button9_Video   : String = 'D1D9';
  var   Button10_Video  : String = 'D1DB';
  var   FnButton_Video  : String = 'D1BD';

  var   Button20_Video  : String = 'D1D1';                                      // Video Mode   D192
  var   Button20_Review : String = '0';                                          // Review Mode

// Joystick Settings
  var   Joystick_AF      : String = 'D02B';                                     // AF-L =0 AE-L =1 AF-L + AE-L =2 AF-ON =3
  var   Joystick_Mode    : String = 'D20C';                                     // Hold =1  Click =0
  var   Joystick_Lock    : String = 'D0CE';                                     // On=1 Off=0
  var   Joystick_Manual  : String = 'D02C';                                     // Magnification=5 AFc=6  AFs+AE-L=1 AFc=2 AFc+AE-L=3 AE-L=4

  var   LeftWheel_P_Photo      : String = 'D229';               // Done  P Mode
  var   BackWheel_P_Photo      : String = 'D1ED';               // Done  P Mode
  var   RightWheel_P_Photo     : String = 'D0D8';               // Done  P Mode

  var   LeftWheel_A_Photo      : String = 'D22A';               // Done  A Mode
  var   BackWheel_A_Photo      : String = 'D1EF';               // Done  A Mode
  var   RightWheel_A_Photo     : String = 'D0DA';               // Done  A Mode

  var   LeftWheel_S_Photo      : String = 'D22B';               // Done  S Mode
  var   BackWheel_S_Photo      : String = 'D1EE';               // Done  S Mode
  var   RightWheel_S_Photo     : String = 'D0D9';               // Done  S Mode

  var   LeftWheel_M_Photo      : String = 'D22C';               // Done  M Mode
  var   BackWheel_M_Photo      : String = 'D1F1';               // Done  M Mode
  var   RightWheel_M_Photo     : String = 'D0DB';               // Done  M Mode

  var   LeftWheel_P_Video      : String = 'D229';               //   P Mode      // ALL VIDEO TO FIND YET!!!
  var   BackWheel_P_Video      : String = 'D1ED';               //   P Mode
  var   RightWheel_P_Video     : String = 'D0D8';               //   P Mode

  var   LeftWheel_A_Video      : String = 'D22A';               //   A Mode
  var   BackWheel_A_Video      : String = 'D1EF';               //   A Mode
  var   RightWheel_A_Video     : String = 'D0DA';               //   A Mode

  var   LeftWheel_S_Video      : String = 'D22B';               //   S Mode
  var   BackWheel_S_Video      : String = 'D1EE';               //   S Mode
  var   RightWheel_S_Video     : String = 'D0D9';               //   S Mode

  var   LeftWheel_M_Video      : String = 'D22C';               //   M Mode
  var   BackWheel_M_Video      : String = 'D1F1';               //   M Mode
  var   RightWheel_M_Video     : String = 'D0DB';               //   M Mode



  var   LeftWheel_Rotation     : String = 'D333';               //   Clockwise = 0
  var   BackWheel_Rotation     : String = 'D02E';               //
  var   RightWheel_Rotation    : String = 'D052';               //   Anti Clockwise = 1


  // First Page

  var   FILMSTYLE       : String = 'D13E';                //Marker in Camera_array is D13E
  var   JPGRes          : String = 'D00F';                //Marker in Camera_array is D00F changed 3== 60.3MP to 4=36.4MP ? 18.5MP
  var   DNG             : String = 'D196';                //Marker in Camera_array is D196  changed 0== 60.3MP to 1=36.4MP ? 18.5MP
  var   WHITEBALANCE    : String = '5005';                //Marker in Camera_array is  5005 0 = Auto, 1 = Daylight
  var   Kelvin          : String = 'D014';
  var   Focus           : String = '500A';                //Marker in Camera_array is 500A
  var   DRIVEMODE       : String = '5013';                //Marker in Camera_array is 5013   13 is valid
  var   ISO             : String = '500F';                //Marker in Camera_array is 500F
  var   IBIS            : String = 'D046';                //Marker in Camera_array is  D046
  var   AspectRatio     : String = 'D04F';                //Marker in Camera_array is D04F         0 = 3:2 to 2 = 4:3
  var   SensorFormat    : String = 'D050';                //Marker in Camera_array is  D050             0 = 35mm to 1 = APSc

  var   PANNING         : String = 'D0D4';                //Marker in Camera_array is D0D4
  var   NRJPeg          : String = 'D081';                //Marker in Camera_array is D081
  var   NR_LE_onoff     : String = 'D822';			          //Marker in Camera_array is D822

  var   FS_Selector     : String = 'D13E';                //Marker in Camera_array is        Which Film Style is Selected   0=Std, 1=Vivid

  var   Contrast0       : String = 'D08A';                //Marker in Camera_array is         FILM STYLE STANDARD
  var   Highlight0      : String = 'D08B';                //Marker in Camera_array is
  var   Shadow0         : String = 'D08C';                //Marker in Camera_array is
  var   Sharpness0      : String = 'D1AF';                //Marker in Camera_array is         0 = 0, 1 =+1  2=2
  var   Saturation0     : String = 'D1AE';                //Marker in Camera_array is

  var   Contrast1       : String = 'D08D';                //Marker in Camera_array is         FILM STYLE Vivid
  var   Highlight1      : String = 'D08E';                //Marker in Camera_array is
  var   Shadow1         : String = 'D08F';                //Marker in Camera_array is
  var   Sharpness1      : String = 'D1B1';                //Marker in Camera_array is         -1 = -1, -2 = -2
  var   Saturation1     : String = 'D1B0';                //Marker in Camera_array is

  var   Contrast2       : String = 'D090';                //Marker in Camera_array is         FILM STYLE Natural
  var   Highlight2      : String = 'D091';                //Marker in Camera_array is
  var   Shadow2         : String = 'D092';                //Marker in Camera_array is
  var   Sharpness2      : String = 'D1B3';                //Marker in Camera_array is         -1 = -1, -2 = -2
  var   Saturation2     : String = 'D1B2';                //Marker in Camera_array is

  var   Contrast3       : String = 'D093';                //Marker in Camera_array is         FILM STYLE Monochrome
  var   Highlight3      : String = 'D094';                //Marker in Camera_array is
  var   Shadow3         : String = 'D1B5';                //Marker in Camera_array is
  var   Sharpness3      : String = 'D1B4';                //Marker in Camera_array is         -1 = -1, -2 = -2

  var   Contrast4       : String = 'D0B0';                //Marker in Camera_array is         FILM STYLE Monochrome H/C
  var   Highlight4      : String = 'D0B1';                //Marker in Camera_array is
  var   Shadow4         : String = 'D1B7';                //Marker in Camera_array is
  var   Sharpness4      : String = 'D1B6';                //Marker in Camera_array is         -1 = -1, -2 = -2

  var   MtrMode         : String = '500B';                //Marker in Camera_array is
  var   NRMODE          : String = 'D081';                //Marker in Camera_array is
  var   AFMethod        : String = 'D137';                //Marker in Camera_array is
  var   Shutter         : String = 'D0D5';                //Marker in Camera_array is


// Video Mode Settings
  var   VidProfile      : String = 'D33F';                //Marker in Camera_array is

  var   VFormat         : String = 'D231';
  var   VResolution     : String = 'D232';
  var   VFrameRate      : String = 'D244';
  var   VCodec          : String = 'D243';
  var   VCompression    : String = 'D245';
  var   VYUV            : String = 'D246';
  var   VBitRate        : String = 'D247';
  var   VLog            : String = 'D248';
  var   VSensor         : String = 'D249';
  var   VAudio          : String = 'D24A';
  var   VMedium         : String = 'D24B';


  // To Do

  var   AFIlluminator   : String = '0';                //Marker in Camera_array is

  //

  // 'D0D3' & 'D0ED' appears to be related to ISO
  // Maybe Max value for Auto?

implementation



end.
