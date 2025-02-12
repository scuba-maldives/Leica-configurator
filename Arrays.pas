  unit Arrays;



    interface

    uses

      MyTypes;

    var Camera_array : array of Byte ;

    var   Setting:    array [0..5] of String =  ('D037','D038','D039','D03A','D0AD','D0AE') ;

    var Copyright_Value: array [0..7] of String =  ('Info','Info','Info','Info','Info','Info','Info','0');
    var Artist_Value: array [0..7] of String =  ('Artist','Artist','Artist','Artist','Artist','Artist','Artist','0');

{
    const Location_List:   array [0..98] of String = ('COPYRIGHT','ARTIST','ExpComp','COPYRIGHT_ONOFF','FLOAT_ISO_ONOFF','PASM_Mode','Button3P','Button4P','Button9P','Button10P','Button20P',
    'FnButtonP','Button3A','Button4A','Button9A','Button10A','Button20A','FnButtonA','Button3S','Button4S','Button9S','Button10S','Button20S','FnButtonS','Button3M','Button4M','Button9M','Button10M','Button20M','FnButtonM',
    'LeftWheel_P_Photo','BackWheel_P_Photo','RightWheel_P_Photo','LeftWheel_A_Photo','BackWheel_A_Photo','RightWheel_A_Photo',
    'LeftWheel_S_Photo','BackWheel_S_Photo','RightWheel_S_Photo','LeftWheel_M_Photo','BackWheel_M_Photo','RightWheel_M_Photo',
    'LeftWheel_P_Video','BackWheel_P_Video','RightWheel_P_Video','LeftWheel_A_Video','BackWheel_A_Video','RightWheel_A_Video',
    'LeftWheel_S_Video','BackWheel_S_Video','RightWheel_S_Video','LeftWheel_M_Video','BackWheel_M_Video','RightWheel_M_Video',
    'FILMSTYLE','JPGRes','DNG','WHITEBALANCE','AFMODE','FOCUSCHECK','DRIVEMODE','ISO','ISMODE','AspectRatio','SensorFormat','PANNING','NRJPeg','NR_LE_onoff','FS_Selector',
    'Contrast0','Highlight0','Shadow0','Sharpness0','Saturation0','Contrast1','Highlight1','Shadow1','Sharpness1','Saturation1',
    'Contrast2','Highlight2','Shadow2','Sharpness2','Saturation2','Contrast3','Highlight3','Shadow3','Sharpness3',
    'Contrast4','Highlight4','Shadow4','Sharpness4','Clarity','NRMODE','FSTOP','AFIlluminator','AFMF','ISRESOLUTION','DRange') ;
}

    const Button_Text:   array [0..68] of String =  ('Photo/Video', 'Toggle info levels', 'Magnification', 'Drive mode', 'Interval shooting',
    'Exposure bracketing', 'Self-timer', 'Focus mode', 'AF mode', 'Toggle AF/MF',
    'Toggle focus point', 'AF Setup', 'AF profiles', 'AF assist lamp', 'Focus aid',
    'Auto magnification', 'Touch AF', 'Touch AF in EVF', 'Focus limit (macro)', 'Manual focus throw',
    'Exposure metering', 'Exposure compensation', 'EV increment', 'ISO', 'ISO settings',
    'Auto ISO settings', 'Loading ISO', 'ISO increments', 'White balance', 'Gray card',
    'Colour temperature', 'File format', 'DNG res  (35mm/APS-C)', 'JPG res  (35mm/APS-C)', 'Film style/Leica Looks',
    'iDR', 'Stabilisation', 'Image stabilisation', 'Perspective control', 'Shutter type',
    'Sensor format', 'Aspect ratio', 'Format storage', 'Storage options', 'Flash settings',
    'Flash exp comp', 'Exposure preview', 'Enhanced life view', 'Group display mode', 'Noise red (long exp)',
    'Dials (AF lenses)', 'Dials (MF lenses)', 'User profile', 'EVF <> LCD ', 'Clipping',
    'Leica FOTOS', 'USB charging', 'Acoustic signal', 'Dial lock', 'Joystick lock',
    'Image overlay', 'Exposure/DoF simulation', 'Auto review', 'Capture assistants', 'Joystick',
    'Lens profiles', 'Focus peaking', 'Microphone Gain', 'Delete Image');

    const Button_Code: array [0..68] of Integer   = (36,37,3,4,6,7,5,44,45,65,82,66,114,78,46,107,75,76,77,67,
    9,10,81,11,123,12,128,130,15,16,108,18,19,49,22,56,136,50,110,23,
    72,73,28,74,24,25,70,71,137,69,132,134,26,27,85,29,79,80,53,54,
    58,83,68,8,141,2,84,111,0);


    var   Button_Valid_Photo: array [0..68] of  Integer = (
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1);


    var   Button_Valid_Video : array [0..68] of  Integer = (
    0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,
    0,1,0,1,0,1,1,0,1,0,0,0,0,1,1,0,1,1,0,0,
    0,1,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,
    0,1,0,0,0,1,1,1,1);

    const Wheel_Text_Full: array [0..6] of String =  ('Program Shift', 'Exposure compensation','Auto ISO' ,'ISO', 'Shutter Speed', 'Aperture', 'Microphone Gain');

    const Wheel_Text_P:   array [0..3] of String =  ('Program Shift', 'Exposure compensation','Auto','ISO');
    const Wheel_Text_A:   array [0..3] of String =  ('Program Shift', 'Exposure compensation','ISO' ,'Aperture');
    const Wheel_Text_S:   array [0..3] of String =  ('Program Shift', 'Exposure compensation','Auto','Shutter Speed');
    const Wheel_Text_M:   array [0..3] of String =  ('Program Shift', 'ISO','Shutter Speed','Aperture');

    const Wheel_Text_Video_P:   array [0..3] of String =  ('Program Shift', 'Exposure compensation','Auto','ISO');
    const Wheel_Text_Video_A:   array [0..3] of String =  ('Exposure compensation','ISO','Aperture' ,'Microphone Gain' );
    const Wheel_Text_Video_S:   array [0..3] of String =  ('Exposure compensation','ISO','Shutter Speed','Microphone Gain');
    const Wheel_Text_Video_M:   array [0..3] of String =  ('Exposure compensation','ISO','Shutter Speed','Aperture');




    var   Wheel_Text  :   array [0..3] of String;

    var   Wheel_Code  :   array [0..6] of  Integer = (0,1,2,3,4,5,6);

    var   Wheel_Code_P:   array [0..6] of  Integer = (0,1,2,3,6,6,6);           // Look up Valid text for each of the PASM modes
    var   Wheel_Code_A:   array [0..6] of  Integer = (0,1,3,5,6,6,6);           // To be used with  Wheel_Text_Full
    var   Wheel_Code_S:   array [0..6] of  Integer = (0,1,2,4,5,6,6);           // When PASM Mode changes :-
    var   Wheel_Code_M:   array [0..6] of  Integer = (0,3,4,5,6,6,6);           // These are copied over to the Wheel_Code array

    var   Wheel_Code_Video_P:   array [0..6] of  Integer = (0,1,2,3,6,6,6);     // Look up codes for each of the PASM modes
    var   Wheel_Code_Video_A:   array [0..6] of  Integer = (1,3,5,6,6,6,6);     // To be used with  Wheel_Text_Full
    var   Wheel_Code_Video_S:   array [0..6] of  Integer = (1,3,4,6,6,6,6);     // When PASM Mode changes :-
    var   Wheel_Code_Video_M:   array [0..6] of  Integer = (1,3,4,5,6,6,6);     // These are copied over to the Wheel_Code array


    var   LeftDial_Photo_Valid: array [0..5, 0..3] of  Integer;                 // Now Correct
    var   RearDial_Photo_Valid: array [0..5, 0..3] of  Integer;
    var   RightDial_Photo_Valid:array [0..5, 0..3] of  Integer;


    const LeftDial_Photo_Valid_P: array [0..5] of  Integer = (1,1,0,1,0,0);     //load the following values into the 2D array in the Main Form
    const RearDial_Photo_Valid_P: array [0..5] of  Integer = (1,1,0,1,0,0);
    const RightDial_Photo_Valid_P:array [0..5] of  Integer = (1,1,0,1,0,0);

    const LeftDial_Photo_Valid_A: array [0..5] of  Integer = (0,1,0,1,1,0);     // This setting is for the valid combination
    const RearDial_Photo_Valid_A: array [0..5] of  Integer = (0,1,0,1,1,0);     // of options for the Dials,
    const RightDial_Photo_Valid_A:array [0..5] of  Integer = (0,1,0,1,1,0);    // in each of the PASM modes

    const LeftDial_Photo_Valid_S: array [0..5] of  Integer = (0,1,1,1,0,0);
    const RearDial_Photo_Valid_S: array [0..5] of  Integer = (0,1,1,1,0,0);
    const RightDial_Photo_Valid_S:array [0..5] of  Integer = (0,1,1,1,0,0);

    const LeftDial_Photo_Valid_M: array [0..5] of  Integer = (0,1,1,1,1,0);
    const RearDial_Photo_Valid_M: array [0..5] of  Integer = (0,1,1,1,1,0);
    const RightDial_Photo_Valid_M:array [0..5] of  Integer = (0,1,1,1,1,0);


    var   LeftDial_Video_Valid: array [0..5] of  Integer = (0,1,0,1,0,1);       //
    var   RearDial_Video_Valid: array [0..5] of  Integer = (0,1,0,1,0,1);
    var   RightDial_Video_Valid:array [0..5] of  Integer = (0,1,0,1,0,1);


    var   LeftDial_Photo: array  [0..5] of  Integer = (0,1,0,1,1,0);
    var   RearDial_Photo: array  [0..5] of  Integer = (1,1,0,1,0,0);
    var   RightDial_Photo:array  [0..5] of  Integer = (1,1,0,1,0,0);

    var   LeftDial_Video: array  [0..5] of  Integer = (0,1,0,1,0,1);            // Left Wheel
    var   RearDial_Video: array  [0..5] of  Integer = (0,1,1,1,1,1);            // Center Wheel
    var   RightDial_Video:array  [0..5] of  Integer = (0,1,1,1,1,1);            // Right Wheel

    var
     LeftDial_Photo_Value   : T2DIM_Array;              // 2D Photo arrays     User Profile / PASM
     RearDial_Photo_Value   : T2DIM_Array;
     RightDial_Photo_Value  : T2DIM_Array;



     LeftDial_Video_Value   : T2DIM_Array;              // 2D Video arrays
     RearDial_Video_Value   : T2DIM_Array;
     RightDial_Video_Value   : T2DIM_Array;

     Button3_Value  : T7x2DIM_Array;                                            // Buttons   0 = Phot and 1 = Video
     Button4_Value  : T7x2DIM_Array;
     Button9_Value  : T7x2DIM_Array;
     Button10_Value : T7x2DIM_Array;
     Button20_Value : T7x2DIM_Array;
     FnButton_Value : T7x2DIM_Array;



     // Dial Rotation
    const Rot_Text: array [0..1] of String = ('Clockwise', 'Anti-Clockwise');
    const Rot_Code: array [0..1] of  Integer = (0,1);
    var   LeftDial_Rotation_Value: array [0..7] of  Integer = (1,1,1,1,1,1,1,0);
    var   RearDial_Rotation_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   RightDial_Rotation_Value: array [0..7] of  Integer = (1,1,1,1,1,1,1,0);


    // JoyStick Options
    const JSAFMode_Text: array [0..3] of String =  ('AF-L','AE-L','AF-L+AE-L','AF On');
    var   JSAFMode_Code:   array [0..3] of  Integer = (0,1,2,3);
    var   JSAFMode_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // Joystick Setting for
    const JSMFMode_Text: array [0..5] of String =  ('AFs','AFs+AE-L','AFc','AFc+AE-L','AE-L','Magnification');
    var   JSMFMode_Code:   array [0..5] of  Integer = (0,1,2,3,4,5);
    var   JSMFMode_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // Joystick Mode
    const JSOPMode_Text: array [0..1] of String =  ('Click','Hold');
    var   JSOPMode_Code:   array [0..1] of  Integer = (0,1);
    var   JSOPMode_Value: array [0..7] of  Integer = (1,1,1,1,1,1,1,0);

    // Joystick Lock
    const JSLock_Text: array [0..1] of String = ('Off', 'On');
    const JSLock_Code: array [0..1] of  Integer = (0,1);
    var   JSLock_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // Sensor Type
    const Sensor_Text: array [0..1] of String = ('35mm', 'APS-C');
    const Sensor_Code: array [0..1] of  Integer = (0,1);
    var   Sensor_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);




    // Profile Names
    var   CustomText: array [0..7] of String =  ('Default','Profile 1','Profile 2','Profile 3','Profile 4','Profile 5','Profile 6','0');
    const CustomNums: array [0..6] of Integer = (0,1,2,3,4,5,6);
    var   Custom_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    const NoughttoSix : array [0..6] of Integer = (0,1,2,3,4,5,6);

    // Film Style
    const FilmStyle_Text: array [0..9] of String =  ('Standard','Vivid','Natural','Monochrome','Mono High Contrast','5','6','7','8','11');
    var   FilmStyle_Code:   array [0..9] of  Integer = (0,1,2,3,4,5,6,7,8,11);
    var   FilmStyle_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    const FilmStyleSetting_Text: array [0..4] of String =  ('+2.0','+1.0','0','-1.0','-2.0');
    var   FilmStyleSetting_Code: array [0..4] of  Integer = (-2,-1,0,1,2);
    var   Contrast_Code: array [0..4] of  Integer = (2,1,0,-1,-2);

    var   FS_Selector_Value: array [0..7] of Integer =  (5,5,5,5,5,5,5,0);

    var   Contrast0_Value:    array [0..7] of  Integer = (0,0,0,0,0,0,0,0);     //FILM STYLE Standard
    var   Highlight0_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Shadow0_Value:      array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Sharpness0_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Saturation0_Value:  array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    var   Contrast1_Value:    array [0..7] of  Integer = (0,0,0,0,0,0,0,0);     //FILM STYLE Vivid
    var   Highlight1_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Shadow1_Value:      array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Sharpness1_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Saturation1_Value:  array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    var   Contrast2_Value:    array [0..7] of  Integer = (0,0,0,0,0,0,0,0);     //FILM STYLE Natural
    var   Highlight2_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Shadow2_Value:      array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Sharpness2_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Saturation2_Value:  array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    var   Contrast3_Value:    array [0..7] of  Integer = (0,0,0,0,0,0,0,0);     //FILM STYLE Monochrome
    var   Highlight3_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Shadow3_Value:      array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Sharpness3_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    var   Contrast4_Value:    array [0..7] of  Integer = (0,0,0,0,0,0,0,0);     //FILM STYLE Monochrome HC
    var   Highlight4_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Shadow4_Value:      array [0..7] of  Integer = (0,0,0,0,0,0,0,0);
    var   Sharpness4_Value:   array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // ISO Setting
    const ISO_Text : array [0..34] of String = (
    'Auto','50','64','80','100','125','160','200','250','320','400','500','640','800','1000','1250',
    '1600','2000','2500','3200','4000','5000','6400','8000','10000','12500','16000','20000','250000',
    '32000','40000','50000','64000','80000','100000');

      var ISO_Code : array [0..34] of  Integer = (
    0,50,64,80,100,125,160,200,250,320,400,500,640,800,1000,1250,
    1600,2000,2500,3200,4000,5000,6400,8000,10000,12500,16000,20000,250000,
    32000,40000,50000,64000,80000,100000);

    var   ISO_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // Exposure Comp
    const Exp_Comp_Text:  array [0..18] of String =  ('+3.0','+2 2/3','+2 1/3','+2.0','+1 2/3','+1 1/3','+1.0','+2/3','+1/3',
                                                      '0','-1/3','-2/3','-1.0','-1 1/3','-1 2/3','-2.0','-2 1/3','-2 2/3','-3.0');
    const Exp_Comp_Code:  array [0..18] of  Integer = (3000,2667,2333,2000,1667,1333,1000,667,333,0,
                                                      -333,-667,-1000,-1333,-1667,-2000,-2333,-2667,-3000);
    var   Exp_Comp_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // IBIS
    const IBIS_Text: array [0..1] of String = ('Off', 'On');
    const IBIS_Code: array [0..1] of  Integer = (0,2);
    var   IBIS_Value: array [0..7] of Integer =  (2,2,2,2,2,2,2,0);

    // AFMF
    const AFMF_Text: array [0..1] of String = ('On', 'Off');
    const AFMF_Code: array [0..1] of  Integer = (0,1);
    var   AFMF_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // Panning
    const Panning_Text: array [0..3] of String = ('Normal', 'Automatic','Vertical Panning', 'Horizontal Panning');
    const Panning_Code: array [0..3] of  Integer = (0,1,2,3);
    var   Panning_Value: array [0..7] of  Integer = (0,0,0,0,0,0,0,0);


    // White Balance
    const WhiteBalance_Text: array [0..11] of String =  ('Auto','Daylight','Cloudy','Shadow','Tungsten',
    'HMi','Flourescent (Warm)',  'Flourescent (Cool)','Flash','Grey Card Pipette','Grey Card','Colour Temperature (K)');
    const WhiteBalance_Code : array [0..11] of  Integer = (0,1,2,3,4,5,6,7,8,9,10,11);
    var   WhiteBalance_Value : array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // Kelvin Value
    const Kelvin_Text   : array [0..19] of String = ('2000','2200', '2400','2700','3000', '3300','3600','3900', '4200','4600','5000',
                                                      '5500','6000','6500', '7200','8000','8700','9500','103000','115000');
    const Kelvin_Code   : array [0..19] of  Integer = (2000,2200, 2400,2700,3000, 3300,3600,3900, 4200,4600,5000, 5500,6000,6500,
                                                        7200,8000,8700,9500,103000,115000);
    var   Kelvin_Value: array [0..7] of Integer =  (0,0,0,0,0,0,0,0);

    // PASM Mode
    const PASMMode_Text   : array [0..3] of String = ('Program', 'Aperture','Shutter','Manual');
    const PASMMode_Code   : array [0..3] of  Integer = (1,2,3,4);
    var   PASMMode_Value: array [0..7] of Integer =  (2,2,2,2,2,2,2,0);

    // Drive Mode
    const DriveMode_Text   : array [0..9] of String = (
    'Single','2 FPS 14bit AF','4 FPS 14bit AF','5 FPS 12bit AF','6 FPS 12bit',
    '7 FPS 12bit','9 FPS 12bit','15 FPS 12bit','Exposure Bracket', 'Interval');
    const DriveMode_Code   : array [0..9] of  Integer = (0,12,2,3,4,16,13,7,8,16);
    var   DriveMode_Value   : array [0..7] of  Integer = (0,0,0,0,0,0,0,0);


    // AF Mode  0=AFs to 5=iAF
    const Focus_Text     : array [0..3] of String = ('AFs','AFc ','Manual','iAF');
    const Focus_Code     : array [0..3] of  Integer = (0,1,2,5);
    var   Focus_Value    : array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // AF Method
    const AFMethod_Text     : array [0..6] of String = ('Multi Field','Spot','Field','Tracking','Eye/Face/Body','Zone', 'Animal Detect');
    const AFMethod_Code     : array [0..6] of  Integer = (3,4,5,6,7,10,11);
    var   AFMethod_Value    : array [0..7] of Integer =  (5,5,5,5,5,5,5,0);

    // Sensor Format
    const SensorFormat_Text   : array [0..1] of String =  ('35mm','APSc');
    var   SensorFormat_Code   : array [0..1] of  Integer = (2,1);
    var   SensorFormat_Value  : array [0..7] of Integer =  (2,2,2,2,2,2,2,0);

     // Aspect Ratio
    const AspectRatio_Text   : array [0..5] of String =  ('3:2','7:5','4:3','1:1','3:1','16:9');
    var   AspectRatio_Code   : array [0..5] of  Integer = (0,1,2,3,4,5);
    var   AspectRatio_Value  : array [0..7] of  Integer = (1,1,1,1,1,1,1,0);


    // Metering Mode
    const MeterMode_Text : array [0..3] of String = ('Spot','Center Weighted','Highlight Weighted','Multi Field');
    var   MeterMode_Code   : array [0..3] of  Integer = (0,32769,1,2);
    var   MeterMode_Value: array [0..7] of Integer =  (2,2,2,2,2,2,2,0);

    // Shutter Type
    const Shutter_Text: array [0..2] of String =  ( 'Mechanical', 'Electronic', 'Hybrid');
    var   Shutter_Code:  array [0..2] of Integer = (0, 1, 2);
    var   Shutter_Value: array [0..7] of Integer =  (2,2,2,2,2,2,2,0);


    // Noise Reduction
    const NMode_Text:      array [0..2] of String =  ('Low','Medium','High');
    const NMode_Code:      array [0..2] of Integer = (0,1,2);
    var   NMode_Value:     array [0..7] of  Integer = (0,0,0,0,0,0,0,0);        // from Camera

    // Niose Reduction Long Exposure
    const Noise_LE_Text: array [0..1] of String =  ( 'ON','OFF' );
    var   Noise_LE_Code : array [0..1] of  Integer = (1,2);
    var   Noise_LE_Value: array [0..7] of Integer =  (1,1,1,1,1,1,1,0);

    // Noise Reduction for JPG
    const Noise_JPG_Text: array [0..2] of String =  ('Low','Medium','High' );
    var   Noise_JPG_Code : array [0..2] of  Integer = (0,1,2);
    var   Noise_JPG_Value : array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // Camera Mode
    const DR_Mode_Text: array [0..1] of String =  ( 'Still Images', 'Movie Mode');
    var   DR_Mode_Code : array [0..1] of  Integer = (4,8);
    var   DR_ModeCode_Value : array [0..7] of  Integer = (0,0,0,0,0,0,0,0);

    // Image Resolution Settings
    const Image_Res_Text: array [0..2] of String = ('L-JPG (60.3 MP)','M-JPG (36.4 MP)','S-JPG (18.5 MP)');
    const Image_Res_Code: array [0..2] of Integer = (0,3,5);
    var   JPG_Res_Value: array [0..7] of Integer =  (3,3,3,3,3,3,3,0);
    Var   DNG_Res_Value : array [0..7] of  Integer = (0,0,0,0,0,0,0,0);


    // Video Profile
    const VidPro_Text: array [0..4] of String = ('Profile 1', 'Profile 2','Profile 3', 'Profile 4','Profile 5');
    const VidPro_Code: array [0..4] of  Integer = (0,1,2,3,4);
    var   VidPro_Value: array [0..7] of Integer =  (3,3,3,3,3,3,3,0);

    // Video Resolutions
    const Video_Res_Text: array [0..4] of String =  ('C8K (17:19)','8K (16:9)','C4K (17:19)','4K (16:9)', 'Full HD (16:9)');
    Var   Video_Res_Code : array [0..4] of Integer = (0,1,2,3,4);
    Var   Video_Res_Value : T7x4DIM_Array;

    // Video Profile Format
    const Vid_Format_Text: array [0..1] of String =   ('MOV','MP4');
    Var   Vid_Format_Code : array [0..1] of Integer = (0,1);
    Var   Vid_Format_Value : T7x4DIM_Array;

    // Video Profile Resolution
    const Vid_Resolution_Text: array [0..4] of String =  ('C8K (17:19)','8K (16:9)','C4K (17:19)','4K (16:9)', 'Full HD (16:9)');
    Var   Vid_Resolution_Code : array [0..4] of Integer = (0,1,2,3,4);
    Var   Vid_Resolution_Value : T7x4DIM_Array;

    // Video Profile Frame Rate
    const Vid_FrameRate_Text: array [0..9] of String =  ('23.98','24','25','29.97','47.95','48','50','59.94','100','119.88');
    Var   Vid_FrameRate_Code : array [0..9] of Integer = (0,1,2,3,4,5,6,7,8,9);
    Var   Vid_FrameRate_Value : T7x4DIM_Array;

    // Video Profile Codec
    const Vid_Codec_Text: array [0..2] of String =  ('h.264','h.265','ProRes');
    Var   Vid_Codec_Code : array [0..2] of Integer = (0,1,2);
    Var   Vid_Codec_Value : T7x4DIM_Array;

    // Video Profile Compression
    const Vid_Compression_Text: array [0..2] of String =  ('ALL-I','L-GOP','ProRes');
    Var   Vid_Compression_Code : array [0..2] of Integer = (0,1,2);
    Var   Vid_Compression_Value : T7x4DIM_Array;

    // Video Profile YUV/bit
    const Vid_YUV_Text: array [0..3] of String =  ('4:2:2/10','4:2:2 HQ/10','4:2:0/10','4:2:0/8');
    Var   Vid_YUV_Code : array [0..3] of Integer = (0,1,2,3);
    Var   Vid_YUV_Value : T7x4DIM_Array;

    // Video Profile BitRate
    const Vid_BitRate_Text: array [0..13] of String =
    ('600Mb','454Mb','400Mb','378Mb','300Mb','227Mb','200Mb','189Mb','182Mb','181Mb','100Mb','28Mb','24Mb','20Mb');
    Var   Vid_BitRate_Code : array [0..13] of Integer = (0,1,2,3,4,5,6,7,8,9,10,11,12,13);
    Var   Vid_BitRate_Value : T7x4DIM_Array;

    // Video Profile Log
    const Vid_Log_Text: array [0..2] of String =  ('No Log','L-Log','HLG');
    Var   Vid_Log_Code : array [0..2] of Integer = (0,1,2);
    Var   Vid_Log_Value : T7x4DIM_Array;

    // Video Profile Sensor
    const Vid_Sensor_Text: array [0..1] of String =  ('35mm','APS-c');
    Var   Vid_Sensor_Code : array [0..1] of Integer = (0,1);
    Var   Vid_Sensor_Value : T7x4DIM_Array;

    // Video Profile Audio
    const Vid_Audio_Text: array [0..2] of String =  ('AAC','LPCM','No Audio');
    Var   Vid_Audio_Code : array [0..2] of Integer = (0,1,2);
    Var   Vid_Audio_Value : T7x4DIM_Array;

    // Video Profile Medium
    const Vid_Medium_Text: array [0..1] of String =  ('HDMI(CFe/SD)','HDMI');
    Var   Vid_Medium_Code : array [0..1] of Integer = (0,1);
    Var   Vid_Medium_Value : T7x4DIM_Array;




Implementation

end.

