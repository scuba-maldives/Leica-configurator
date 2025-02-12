unit FandPs;

interface

uses

  System.IOUtils, System.Notification, System.SysUtils,System.Classes,
  System.UITypes, System.Variants, System.Types, MyTypes,

  Arrays, Data.Bind.Components, Data.Bind.Grid,

  FMX.ComboEdit,  FMX.Controls, FMX.Controls.Presentation, FMX.Dialogs, FMX.DialogService,
  FMX.Edit, FMX.ExtCtrls, FMX.Forms, FMX.Graphics, FMX.Grid, FMX.Layouts,
  FMX.ListBox, FMX.Memo, FMX.Menus, FMX.NumberBox, FMX.Objects, FMX.StdCtrls,
  FMX.Text, FMX.Types, FMX.Memo.Types, FMX.ScrollBox, FMX.TabControl;

  Procedure Clear_Status_Flags(Status_Update: Integer);
  Procedure SaveStream();
  Procedure Search_Custom_Text();
  Procedure Populate_Fields_Text(var offset: Integer; var VP_offset: Integer);
  Procedure Save_File();
  Procedure AddQuotes(var Search_Array: array of String);
  Procedure RemoveQuotes();

  Function  QuestionChanges(Question : String): String;
  Function  Write_to_DB(const Str: String; Search_Start :Integer; Search_End : Integer; const Search_Array: array of Integer): Integer;
  Function  Write_to_DBSTR(const Str: String; Search_Start :Integer; Search_End : Integer; const Search_Array: array of String): Integer;
  Function  Write_to_DBRec(const Str: String; Search_Start :Integer; Search_End : Integer; var Rec: String): Integer;
  Function  Write_to_DB2Dim(const Str: String; Search_Start :Integer; Search_End : Integer; PASM :Integer;const Search_Array: T2DIM_Array): Integer;
  Function  Write_to_DB7x2(const Str: String; Search_Start :Integer; Search_End : Integer; const Search_Array: T7x2DIM_Array): Integer;
  Function  Write_to_DB7x4(const Str: String; Search_Start :Integer; Search_End : Integer; const Search_Array: T7x4DIM_Array): Integer;
  Function  FindChar(const Str: String; Search_Start :Integer; Search_End : Integer): Integer;
  Function  checkCameraModel(): String;
  Function  checkFileHeader(): Boolean;
  Function  Find(const Str1: String; Search_Start :Integer; Search_End : Integer): Integer;

  Function  MyGetFileSize(const FullFileName: String): Integer;
  Function  GetParentFolder(folder: String; const cLevels: BYTE = 1) : String;

Var

  myFile      : File;
  FS          : TFileStream;
  FW          : TWriter;
  FR          : TReader;
  Count       : LongInt;
  AStream     : TStream;


implementation


  uses Main_FormFmx, Constants, DecodeFMX, RecodeFMX, CTLoaderFMX, Common_Parameters,Camera_Parameters,CustomFMX;



    ////////////////  Start of Functions  /////////////////

   Function  MyGetFileSize(const FullFileName: String): Integer;

   var Handle: Integer;

   begin

          if Debug then
          begin
          //Showmessage('Trying to open ' + FullFileName);
          end;


          Handle := FileOpen(FullFileName, fmShareDenyNone or fmOpenRead);
          //ShowMessage('Here');


            if Handle = -1 then
              begin
              Showmessage('Unable to open file ' + FullFileName);
              FileClose(Handle);
              Result := -1;
              end

            else try

              CusFileSize := FileSeek(Handle, Int64(0), 2);       // Find the filesize of the Template just opened

              //Showmessage('File Size set to = ' + inttostr(CusFileSize));
              SetLength(Camera_array,CusFileSize);                              // Set Camera_Array to match filesize

              Result := 1;
            finally
              FileClose(Handle);
            end;

   end;

 function  Write_to_DBRec(const Str: String; Search_Start :Integer; Search_End : Integer; var Rec: String): Integer;

     Var
           iCount  : Integer;
           iNumber : Integer;
           iStart  : Integer;

     Begin
          iStart := 0;                                                           // Reset all VARs before we start
          iCount := 0;
          iNumber:= 0;
          iLocation :=0;
          sChar  := '';


          sChar := sChar + Pre_Digit + Rec + Post_Digit2 + EOF;// First Five Values


              iLocation := Find(Str,0, length(Camera_Array)-1 );                // Now find Location in Camera Array (Database)

               If iLocation <> -1 then

                 begin
                     iStart := iLocation+8;                                     // Start of Data in Record
                     var New_Start :=iStart;

                     iNumber := FindChar(']',New_Start, iStart+150);            // Find next occurence of Close Bracket, denotes end of this record

                     iNumber := iNumber + 7;                                    // Set iNumber to EOR

                      If iNumber <> -1 then                                     // If " is found, then proceed
                      Begin

                        icount := iNumber - iStart;                             // iCount needs to be from iLocation to end of Record


                        Delete(Camera_Array,iStart,iCount);                     // Delete (Array,Start,Numberof)
                                                                                // To make space for new entry

                         For var i := Low (sChar) to High (sChar) do            // Write the string to the database

                               Begin
                                  CharInt := (Ord (sChar [i]));                 // Convert the String part to Byte
                                  Insert(CharInt,Camera_Array,iLocation+7+i);
                               end;

                               Result := iNumber;

                      end;

                      If iNumber = -1 then
                      Begin
                        ShowMessage('Bracket not found ')
                      End;

                 end

               else
                  Begin
                       if Debug then
                       Begin
                       ShowMessage(str + ' not found ');
                       End;

                       Update_Fail := True;
                       Result := -1;
                  End;

     End;          // end of Function



 function  Write_to_DBSTR(const Str: String; Search_Start :Integer; Search_End : Integer; const Search_Array: array of String): Integer;

     Var
           iCount  : Integer;
           iNumber : Integer;
           iStart  : Integer;

     Begin
          iStart := 0;                                                           // Reset all VARs before we start
          iCount := 0;
          iNumber:= 0;
          iLocation :=0;
          sChar  := '';


               For var X := 0 to 6 do                                           // Create String to Insert

                    Begin

                    if X <6 then
                      sChar := sChar + Pre_Digit + Search_Array[x] + Post_Digit;// First Five Values

                    if X = 6 then
                      Begin
                      sChar := sChar + Pre_Digit + Search_Array[x] + EOF;       // Last Value plus EOF marker

                      end

                    End;



              iLocation := Find(Str,0, length(Camera_Array)-1 );                // Now find Location in Camera Array (Database)

               If iLocation <> -1 then

                 begin
                     iStart := iLocation+8;                                     // Start of Data in Record
                     var New_Start :=iStart;

                     iNumber := FindChar(']',New_Start, iStart+150);            // Find next occurence of Speech Marks, denotes end of this record

                     iNumber := iNumber + 7;                                    // Set iNumber to EOR

                      If iNumber <> -1 then                                     // If " is found, then proceed
                      Begin

                        icount := iNumber - iStart;                             // iCount needs to be from iLocation to end of Record


                        Delete(Camera_Array,iStart,iCount);                     // Delete (Array,Start,Numberof)
                                                                                // To make space for new entry

                         For var i := Low (sChar) to High (sChar) do            // Write the string to the database

                               Begin
                                  CharInt := (Ord (sChar [i]));                 // Convert the String part to Byte
                                  Insert(CharInt,Camera_Array,iLocation+7+i);
                               end;

                               Result := iNumber;

                      end;

                      If iNumber = -1 then
                      Begin
                        ShowMessage('Speech Mark not found ')
                      End;

                 end

               else
                  Begin
                       if Debug then
                       Begin
                       ShowMessage(str + ' not found ');
                       End;

                       Update_Fail := True;
                       Result := -1;
                  End;




     End;          // end of Function


  function  Write_to_DB(const Str: String; Search_Start :Integer; Search_End : Integer; const Search_Array: array of Integer): Integer;

     Var
           iCount  : Integer;
           iNumber : Integer;
           iStart  : Integer;

     Begin
          iStart := 0;                                                          // Reset all VARs before we start
          iCount := 0;
          iNumber:= 0;
          iLocation :=0;
          sChar  := '';


               For var X := 0 to 6 do

                    Begin

                    if X <6 then
                      sChar := sChar + Pre_Digit + inttostr(Search_Array[x]) + Post_Digit;       // First Five Values

                    if X = 6 then
                      Begin
                      sChar := sChar + Pre_Digit + inttostr(Search_Array[x]) + EOF;   // Last Value plus EOF marker

                      end

                    End;



              iLocation := Find(Str,0, length(Camera_Array)-1 );                // Now find Location in Camera Array (Database)

               If iLocation <> -1 then

                 begin
                     iStart := iLocation+8;

                     var New_Start :=iStart;

                     iNumber := FindChar(']',New_Start, iStart+150);            // Find next occurence of Speech Marks, denotes end of this record

                     iNumber := iNumber + 7;                                    // Set iNumber to EOR

                      If iNumber <> -1 then                                     // If " is found, then proceed
                      Begin

                        icount := iNumber - iStart;

                        Delete(Camera_Array,iStart,iCount);                     // Delete (Array,Start,Numberof)
                                                                                // To make space for new entry



                         For var i := Low (sChar) to High (sChar) do            // Write the string to the database

                               Begin
                                  CharInt := (Ord (sChar [i]));                 // Convert the String part to Byte
                                  Insert(CharInt,Camera_Array,iLocation+7+i);
                               end;

                               Result := iNumber;

                      end;

                      If iNumber = -1 then
                      Begin
                        ShowMessage('Speech Mark not found ')
                      End;

                 end

               else
                  Begin
                       if Debug then
                       Begin
                       ShowMessage(str + ' not found ');
                       End;

                       Update_Fail := True;
                       Result := -1;
                  End;




     End;          // end of Function



  function  Write_to_DB2Dim(const Str: String; Search_Start :Integer; Search_End : Integer; PASM :Integer; const Search_Array: T2DIM_Array): Integer;


      // Used for writing Dial values to the output file


     Var
           iCount  : Integer;
           iNumber : Integer;
           iStart  : Integer;

     Begin
          iStart := 0;                                                          // Reset all VARs before we start
          iCount := 0;
          iNumber:= 0;
          iLocation :=0;
          sChar  := '';

          var trigger := 'D0DA';

            For var X := 0 to 6 do

                Begin

                  if X <6 then
                  sChar := sChar + Pre_Digit + inttostr(Search_Array[x,PASM]) + Post_Digit;       // First Five Values

                  if X = 6 then
                    Begin
                    sChar := sChar + Pre_Digit + inttostr(Search_Array[x,PASM]) + EOF;             // Last Value plus EOF marker
                    end

                End;

                If Str = trigger then
                      begin
                      Showmessage('Trying to Find ' + Str );
                      end;

           iLocation := Find(Str,0, length(Camera_Array)-1 );                   // Now find Location in Camera Array (Database)


               If iLocation <> -1 then

                 begin
                       iStart := iLocation+8;

                     var New_Start :=iStart;

                     iNumber := FindChar(']',New_Start, iStart+150);            // Find next occurence of Speech Marks, denotes end of this record

                     iNumber := iNumber + 7;                                    // Set iNumber to EOR

                        If iNumber <> -1 then                                   // If " is found, then proceed
                        Begin

                          icount := iNumber - iStart;

                          Delete(Camera_Array,iStart,iCount);                   // Delete (Array,Start,Numberof)
                                                                                // To make space for new entry

                            For var i := Low (sChar) to High (sChar) do         // Write the string to the database

                                 Begin
                                    CharInt := (Ord (sChar [i]));               // Convert the String part to Byte
                                    Insert(CharInt,Camera_Array,iLocation+7+i);
                                 end;

                                 Result := iNumber;
                        end;

                        If iNumber = -1 then
                        Begin
                          if Debug then
                          ShowMessage('Speech Mark not found ')
                        End

                 end

             else
                Begin
                     if Debug then
                     Begin
                     ShowMessage(str + ' not found ');
                     End;

                     Update_Fail := True;
                     Result := -1;
                End;



     End;           // end of Function



  function  Write_to_DB7x2(const Str: String; Search_Start :Integer; Search_End : Integer; const Search_Array: T7x2DIM_Array): Integer;

     // Used for writing Buttons values to the output file

     // e.g. valid := Write_to_DB3(Button3P, iStart, Length(Camera_array)-1, Button3_Photo_Value);

       Var
             iCount  : Integer;
             iNumber : Integer;
             iStart  : Integer;

     Begin
            iStart := 0;                                                        // Reset all VARs before we start
            iCount := 0;
            iNumber:= 0;
            iLocation :=0;
            sChar  := '';


                 For var X := 0 to 6 do

                      Begin

                      if X <6 then
                        sChar := sChar + Pre_Digit + inttostr(Search_Array[x,0]) + Post_Digit;       // First Five Values

                      if X = 6 then
                        Begin
                        sChar := sChar + Pre_Digit + inttostr(Search_Array[x,0]) + EOF;             // Last Value plus EOF marker
                        end

                      End;



                 iLocation := Find(Str,0, length(Camera_Array)-1 );             // Now find Location in Camera Array (Database)


                    If iLocation <> -1 then

                      begin

                       iStart := iLocation+8;
                       var New_Start :=iStart;

                       iNumber := FindChar(']',New_Start, iStart+150);          // Find next occurence of Speech Marks, denotes end of this record

                       iNumber := iNumber + 7;                                  // Set iNumber to EOR

                        If iNumber <> -1 then                                   // If " is found, then proceed
                        Begin

                          icount := iNumber - iStart;

                          Delete(Camera_Array,iStart,iCount);                   // Delete (Array,Start,Numberof)
                                                                                // To make space for new entry


                           For var i := Low (sChar) to High (sChar) do          // Write the string to the database

                                 Begin
                                    CharInt := (Ord (sChar [i]));               // Convert the String part to Byte

                                    Insert(CharInt,Camera_Array,iLocation+7+i);

                                 end;

                                 Result := iNumber;
                        end;

                        If iNumber = -1 then
                        Begin
                          if Debug then
                          ShowMessage('Speech Mark not found ')
                        End

                    end


                  else
                      Begin
                           if Debug then
                           Begin
                           ShowMessage(str + ' not found ');
                           End;

                           Update_Fail := True;
                           Result := -1;
                      End;


      End;               // end of Function



function  Write_to_DB7x4(const Str: String; Search_Start :Integer; Search_End : Integer; const Search_Array: T7x4DIM_Array): Integer;

     // Used for writing Buttons values to the output file

     // e.g. valid := Write_to_DB3(Button3P, iStart, Length(Camera_array)-1, Button3_Photo_Value);

       Var
             iCount  : Integer;
             iNumber : Integer;
             iStart  : Integer;

     Begin
            iStart := 0;                                                        // Reset all VARs before we start
            iCount := 0;
            iNumber:= 0;
            iLocation :=0;
            sChar  := '';


                 For var X := 0 to 6 do

                      Begin

                      if X <6 then
                        sChar := sChar + Pre_Digit + inttostr(Search_Array[x,0]) + Post_Digit;       // First Five Values

                      if X = 6 then
                        Begin
                        sChar := sChar + Pre_Digit + inttostr(Search_Array[x,0]) + EOF;             // Last Value plus EOF marker
                        end

                      End;



                 iLocation := Find(Str,0, length(Camera_Array)-1 );             // Now find Location in Camera Array (Database)


                    If iLocation <> -1 then

                      begin

                       iStart := iLocation+8;

                       var New_Start :=iStart;

                       iNumber := FindChar(']',New_Start, iStart+150);          // Find next occurence of Speech Marks, denotes end of this record

                       iNumber := iNumber + 7;                                  // Set iNumber to EOR

                        If iNumber <> -1 then                                   // If " is found, then proceed
                        Begin

                          icount := iNumber - iStart;

                          Delete(Camera_Array,iStart,iCount);                   // Delete (Array,Start,Numberof)
                                                                                // To make space for new entry


                           For var i := Low (sChar) to High (sChar) do          // Write the string to the database

                                 Begin
                                    CharInt := (Ord (sChar [i]));               // Convert the String part to Byte

                                    Insert(CharInt,Camera_Array,iLocation+7+i);

                                 end;

                                 Result := iNumber;
                        end;

                        If iNumber = -1 then
                        Begin
                          if Debug then
                          ShowMessage('Speech Mark not found ')
                        End

                    end


                  else
                      Begin
                           if Debug then
                           Begin
                           ShowMessage(str + ' not found ');
                           End;

                           Update_Fail := True;
                           Result := -1;
                      End;


      End;               // end of Function




  function FindChar(const Str: String; Search_Start :Integer; Search_End : Integer): Integer;

      //returns the 0-based index of the start of the first occurrence of Str
      //or -1 if there is no occurrence

    var Found : Boolean ;                                                       // Have we found a match for the single Char


    begin                                                                       // Reset all VARs before we start
          iCount := 0;
          Found := False;
          Result :=-1;
          iIndex:=Search_Start;


          while (Found <> True)  or (iIndex < Search_End) do
          begin

                  if Camera_array[iIndex] = Byte(AnsiChar(Str[1])) then         // First Match

                  begin
                            Found := True;
                            Result := iIndex;
                            Break                                               // end of Camera Array Loop
                  end;


                  iIndex := iIndex+1;

                  if (iIndex > Search_End) then                                 // if we have exceded of Letters in String
                  //Showmessage('Search Text not Found ' + str);
                  Break                                                         // or exceeded file size
                                                                                // Jump out of While loop

          end;        // End of While Loop


                if Found = False then

                  begin
                    iIndex:=0;
                    iCount:=1;
                    Result := -1;
                    Update_Fail := True;
                  end


    end;                // end of Function



  function QuestionChanges(Question : String): String;

    var
    lResultStr: String;

        begin
          lResultStr:='';
          TDialogService.PreferredMode:=TDialogService.TPreferredMode.Platform;
          TDialogService.MessageDialog(Question, TMsgDlgType.mtConfirmation,
            FMX.Dialogs.mbYesNo, TMsgDlgBtn.mbNo, 0,
            procedure(const AResult: TModalResult)
            begin
              case AResult of
                mrYes: lResultStr:='true';
                mrNo:  lResultStr:='false';
              end;
            end);

          Result:=lResultStr;

    end;                  //  End of Function



  function checkFileHeader(): Boolean;

    begin

        sChar := '';

        for var iLoop :=14 to 18 do                                             // Access Header of Array
           Begin
             Asc := Ord(Camera_array[iLoop]);
             sChar := sChar + Char(Asc);
           end;

           //ShowMessage('Camera File is from ' + sChar);

        if (sChar = 'LEICA') or (sChar = '"LEIC')
          then
            begin
            //ShowMessage('Correct DAT File Format !!!');
            Result:=true
            end

          else
            begin
            ShowMessage('Improper DAT File Format !!!') ;
            Result:=False
            end;

    end;              //  End of Function



  function checkCameraModel (): String;

    begin

      sChar := '';

      for var iLoop :=14 to 25 do                                               // Access Header of Array
         Begin
           Asc := Ord(Camera_array[iLoop]);                                     // Extract Camera Name from Array, Ignoring the following

           if (Asc <> 34)  and                                                  // ' " '     Speach
              (Asc <> 44)  and                                                  // ' , '     Comma
              (Asc <> 10)  and                                                  //  CR
              (Asc <> 40)  and                                                  // )
              (Asc <> 84)  and                                                  //  'T'
              (Asc <> 121) then                                                 // ' y ' (to add SL Type)

            sChar := sChar + Char(Asc);                                         // Add Char to String
            //ShowMessage('String is ' + sChar);

         end;

         sChar := Trim(sChar);                                                  // Remove trailing Chars


            //ShowMessage('File Name is ' + sChar);

                                                                                // Is it a supported Camera
      if  ( (sChar = 'LEICA Fac') or (sChar = 'LEICA SL3-S')    or
            (sChar = 'LEICA SL3') or (sChar = 'LEICA SL2')    or
            (sChar = 'LEICA SL')  or (sChar = 'LEICA SL2-S')  or
            (sChar = 'LEICA Q')   or (sChar = 'LEICA Q2')     or                // LEICA Q series
            (sChar = 'LEICA Q3 43') or (sChar = 'LEICA Q3') or
            (sChar = 'LEICA M') or (sChar = 'LEICA M11')    or
            (sChar = 'LEICA Q2 MON')
            )



        then

              begin
                  vCameraModel := sChar                                         // If so set Vars
              end

        else

              begin
                ShowMessage('Unsupported File ' + sChar + ' NOT from Supported Camera !');
                vCameraModel := 'Unknown';
              end;

        Result:=sChar;

    end;               //  End of Function



  function Find(const Str1: String; Search_Start :Integer; Search_End : Integer): Integer;

      //returns the 0-based index of the start of the first occurrence of Str
      //or -1 if there is no occurrence

      var
        String_Length1: Integer;
        var Found : Boolean ;                                                   // Have we found a match for the single Char


      begin
            var trigger := '';


            String_Length1 := Length(Str1)-1;
            Found := False;
            Result :=-1;


            //Showmessage('String Length =  ' + inttostr(String_Length1) + ' ' + str1);



            if String_Length1>0 then
            begin


                  iIndex:=0;
                  iCount :=1;

                  If Str1 = trigger then
                      begin
                      Showmessage('Trying to Find ' + Str1 );
                      end;


                while (Found <> True)  or (iIndex < Search_End) do
                begin

                        if Camera_array[iIndex] = Byte(AnsiChar(Str1[iCount])) then          // First Match

                        begin

    //                    If str1 = trigger then
    //                        begin
    //                        Showmessage('Found ' + Str[iCount] + ' in ' + str1 + ' at ' + inttostr(Camera_array[iIndex]));
    //                        end;
                                      if Camera_array[iIndex+1] = Byte(AnsiChar(str1[iCount+1])) then        // Letter two

                                      begin
    //                                         If str1 = trigger then
    //                                        begin
    //                                        Showmessage('Found '+ str1[iCount+1] + ' in ' + str1 );
    //                                        end;


                                                      if Camera_array[iIndex+2] = Byte(AnsiChar(str1[iCount+2])) then    // Letter three
                                                      begin

    //                                                         If str1 = trigger then
    //                                                          begin
    //                                                          Showmessage('Found '+ str1[iCount+2] + ' in ' + str1 );
    //                                                          end;


                                                                if Camera_array[iIndex+3] = Byte(AnsiChar(str1[iCount+3])) then    // Letter four
                                                                  begin

                                                                      If str1 = trigger then
                                                                      begin
                                                                      Showmessage('Found '+ str1[iCount+3] + ' in ' + str1 );
                                                                      end;

                                                                      Found := True;
                                                                      Result := iIndex;
                                                                      Break
                                                                    end

                                                                  else
                                                                    begin


    //                                                                 If str1 = trigger then
    //                                                                  begin
    //                                                                  Showmessage(str1 + ' Not Found');
    //                                                                  end;

                                                                    iIndex := iIndex+1;
                                                                    iCount:=1;
                                                                    //Break
                                                                    end
                                                       end
                                                      else
                                                          begin
                                                          // 3rd char not found

                                                          iIndex := iIndex+1;
                                                          iCount:=1;
                                                          end

                                      end
                                      else
                                          begin
                                          //Showmessage('2nd Char not Found' );         // 2nd char not found
                                          iIndex := iIndex+1;
                                          iCount:=1;
                                          //Break
                                          end

                                                                                        // end of Camera Array Loop
                         end;

                        iIndex := iIndex+1;
                        if (iCount > string_Length1) or (iIndex > Search_End-1) then     // if we have exceded of Letters in str1ing
                                                                                        // or reached the end of the array
                        Break                                                           // or exceeded file size
                                                                                        // Jump out of While loop

                end;        // End of While Loop


              if Found = False then

                begin
                  //Showmessage('Failed at '+ inttostr1(iCount) + ' letter in str1ing' + ' and ' + inttostr1(Result) + ' in array');
                  iIndex:=0;
                  iCount:=1;
                  Result := -1;
                end

            end;

      end;                // end of Function




    ////////////////  Start of Proceedures  /////////////////


  procedure Clear_Status_Flags(Status_Update: Integer);


    begin

// Dials
      LeftDial_Photo_Value[Status_Flag,P] := Status_Update;                                             // Clear all the Update Flags for new file Import
      RearDial_Photo_Value[Status_Flag,P] := Status_Update;
      RightDial_Photo_Value[Status_Flag,P] := Status_Update;

      LeftDial_Photo_Value[Status_Flag,A] := Status_Update;                                             // Clear all the Update Flags for new file Import
      RearDial_Photo_Value[Status_Flag,A] := Status_Update;
      RightDial_Photo_Value[Status_Flag,A] := Status_Update;

      LeftDial_Photo_Value[Status_Flag,S] := Status_Update;                                             // Clear all the Update Flags for new file Import
      RearDial_Photo_Value[Status_Flag,S] := Status_Update;
      RightDial_Photo_Value[Status_Flag,S] := Status_Update;

      LeftDial_Photo_Value[Status_Flag,M] := Status_Update;                                             // Clear all the Update Flags for new file Import
      RearDial_Photo_Value[Status_Flag,M] := Status_Update;
      RightDial_Photo_Value[Status_Flag,M] := Status_Update;


// Buttons
      Button3_Value[Status_Flag,0] := Status_Update;
      Button4_Value[Status_Flag,0] := Status_Update;
      Button9_Value[Status_Flag,0] := Status_Update;
      Button10_Value[Status_Flag,0] := Status_Update;
      Button20_Value[Status_Flag,0] := Status_Update;
      FnButton_Value[Status_Flag,0] := Status_Update;

      Button3_Value[Status_Flag,1] := Status_Update;
      Button4_Value[Status_Flag,1] := Status_Update;
      Button9_Value[Status_Flag,1] := Status_Update;
      Button10_Value[Status_Flag,1] := Status_Update;
      Button20_Value[Status_Flag,1] := Status_Update;
      FnButton_Value[Status_Flag,1] := Status_Update;


// Film Styles
      FilmStyle_Value[Status_Flag] := Status_Update;
      FS_Selector_Value[Status_Flag] := Status_Update;

      Contrast0_Value[Status_Flag] := Status_Update;
      Highlight0_Value[Status_Flag] := Status_Update;
      Shadow0_Value[Status_Flag] := Status_Update;
      Sharpness0_Value[Status_Flag] := Status_Update;
      Saturation0_Value[Status_Flag] := Status_Update;

      Contrast1_Value[Status_Flag] := Status_Update;
      Highlight1_Value[Status_Flag] := Status_Update;
      Shadow1_Value[Status_Flag] := Status_Update;
      Sharpness1_Value[Status_Flag] := Status_Update;
      Saturation1_Value[Status_Flag] := Status_Update;

      Contrast2_Value[Status_Flag] := Status_Update;
      Highlight2_Value[Status_Flag] := Status_Update;
      Shadow2_Value[Status_Flag] := Status_Update;
      Sharpness2_Value[Status_Flag] := Status_Update;
      Saturation2_Value[Status_Flag] := Status_Update;

      Contrast3_Value[Status_Flag] := Status_Update;
      Highlight3_Value[Status_Flag] := Status_Update;
      Shadow3_Value[Status_Flag] := Status_Update;
      Sharpness3_Value[Status_Flag] := Status_Update;

      Contrast4_Value[Status_Flag] := Status_Update;
      Highlight4_Value[Status_Flag] := Status_Update;
      Shadow4_Value[Status_Flag] := Status_Update;
      Sharpness4_Value[Status_Flag] := Status_Update;

// Camera Settings
      ISO_Value[Status_Flag] := Status_Update;
      Exp_Comp_Value[Status_Flag] := Status_Update;
      IBIS_Value[Status_Flag] := Status_Update;
      AFMF_Value[Status_Flag] := Status_Update;
      Panning_Value[Status_Flag] := Status_Update;
      NMode_Value[Status_Flag] := Status_Update;
      JPG_Res_Value[Status_Flag] := Status_Update;
      DNG_Res_Value[Status_Flag] := Status_Update;
      WhiteBalance_Value[Status_Flag] := Status_Update;
      Kelvin_Value[Status_Flag] := Status_Update;
      PASMMode_Value[Status_Flag] := Status_Update;
      DriveMode_Value[Status_Flag] := Status_Update;
      Focus_Value[Status_Flag] := Status_Update;
      AFMethod_Value[Status_Flag] := Status_Update;
      IBIS_Value[Status_Flag] := Status_Update;
      SensorFormat_Value[Status_Flag] := Status_Update;
      AspectRatio_Value[Status_Flag] := Status_Update;
      MeterMode_Value[Status_Flag] := Status_Update;
      Noise_LE_Value[Status_Flag] := Status_Update;
      DR_ModeCode_Value[Status_Flag] := Status_Update;
      Shutter_Value[Status_Flag] := Status_Update;

// JoyStick
      JSAFMode_Value[Status_Flag] := Status_Update;
      JSMFMode_Value[Status_Flag] := Status_Update;
      JSLock_Value[Status_Flag] := Status_Update;
      JSOPMode_Value[Status_Flag] := Status_Update;

// Dial Rotation
      LeftDial_Rotation_Value[Status_Flag] := Status_Update;
      RearDial_Rotation_Value[Status_Flag] := Status_Update;
      RightDial_Rotation_Value[Status_Flag] := Status_Update;

// Video Mode
      VidPro_Value[Status_Flag] := Status_Update;
      Vid_Format_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_Resolution_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_FrameRate_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_Codec_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_Compression_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_YUV_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_BitRate_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_Log_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_Sensor_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_Audio_Value[Status_Flag,VP_Offset] := Status_Update;
      Vid_Medium_Value[Status_Flag,VP_Offset] := Status_Update;


    end;     // End of Clear_Status_Flags Procedure


  procedure Search_Custom_Text();

     // Search Database for 'SettingX' string

    var iPosition: Integer;

      // Locate custom strings

       begin
       sChar := '';

           Begin

              //Showmessage('Searching for ' + Setting1 );                       // Extract text from array

              for var Custom_Index := 0 to NUMCUSTOMSETTINGS-1 do                // Change to NUMCUSTOMSETTINGS in Final prog
              begin

              //Showmessage('Searching for ' + Setting[Custom_Index]);

                iPosition := Search_Text(Setting[Custom_Index],0, CUSfileSize); //Find Position of Text in Setting(x) inside Camera Array  ADD ALL SIX

                if iPosition <> -1  then

                 begin
                  //Showmessage('Text Found at Postion ' + inttostr(iPosition) );

                  for var Letter_Index :=iPosition + 15 to iPosition + 24 do
                     begin
                      Asc := Ord(Camera_array[Letter_Index]);                   // Access Camera Array to
                      sChar := sChar + Char(Asc);                               // Extract Custom Field Name from Array
                     end;

                  sChar:=  (Trim(sChar));                                       // Remove all control Chars
                  sChar := sChar.Replace('"', '', [rfReplaceAll, rfIgnoreCase]);// Remove all instances of " in str

                  CustomText[Custom_Index+1] :=  (sChar);                       // Add it to the Custom Name array
                  sChar := '';

                 //ShowMessage('Here');
                 Custom_Value[Status_Flag] := 1;
                 end
              end
           end;
       end;       // End of Proceedure






  procedure Populate_Fields_Text(var offset: Integer; var VP_offset: Integer);

          //  Grab the Text to Show in the Text field

  begin

          //ShowMessage('Custom Number = ' + inttostr(offset));

          vCopyright      := Copyright_Value[offset];
          vArtist         := Artist_Value[offset];
          vISO            := inttostr(ISO_Value[offset]);                                                  // Returns Number in list for Default setting
          vFilmStyle      := Search_Array(FS_Selector_Value[offset],  FilmStyle_Code, FilmStyle_Text);     // Returns Text in list for Default setting
          vIBIS           := Search_Array(IBIS_Value[offset],         IBIS_Code,  IBIS_Text);              // Returns Text in list for Default setting
          vNoiseMode      := Search_Array(NMode_Value[offset],        NMode_Code, NMode_Text);             // Returns Text in list for Default setting
          vNoise_LE       := Search_Array(Noise_LE_Value[offset],     Noise_LE_Code, Noise_LE_Text);       // Returns Text in list for Default setting
          vNoiseJPG       := Search_Array((Noise_JPG_value[offset]),  Noise_JPG_Code, Noise_JPG_Text);     // Returns Text in Noise Red JPG array

          vWhiteBalance   := Search_Array(WhiteBalance_Value[offset], WhiteBalance_Code, WhiteBalance_Text);// Returns Text in list for Default setting

          vKelvin         := Search_Array(Kelvin_Value[offset], Kelvin_Code, Kelvin_Text);

          //ShowMessage('FilmStyle ' + inttostr(FS_Selector_Value[offset]));
          //ShowMessage('FilmStyle ' + vFilmStyle);
          //ShowMessage('Which is ' + (FilmStyle_Text[FS_Selector_Value[offset]]));


          vAspect         := Search_Array(AspectRatio_Value[offset],  AspectRatio_Code, AspectRatio_Text);  // Returns Text in list for Default setting
          vExpComp        := Search_Array(Exp_Comp_Value[offset],     Exp_Comp_Code, Exp_Comp_Text);        // Returns Text in Exposure Comp array

          vDriveMode      := Search_Array(Drivemode_Value[offset], Drivemode_Code, Drivemode_Text);         // Returns Text in list

          vShutter        := Search_Array(Shutter_Value[offset], Shutter_Code, Shutter_Text);               // Returns Text in list
          vSensorFormat   := Search_Array(Sensor_Value[offset],   Sensor_Code, Sensor_Text);                // Returns Text in list

          vDNG_Res        := Search_Array((DNG_Res_value[offset]), Image_Res_Code, Image_Res_Text);
          vJPG_Res        := Search_Array((JPG_Res_Value[offset]), Image_Res_Code, Image_Res_Text);         // Returns Text in list

          vFocus          := Search_Array((Focus_Value[offset]),  Focus_Code, Focus_Text);                  // Returns Text in list

          vAFMethod       := Search_Array((AFMethod_Value[offset]),AFMethod_Code, AFMethod_Text);           // Returns Text in list
          vMtrMode        := Search_Array(MeterMode_Value[offset], MeterMode_Code, MeterMode_Text);         // Returns Text in list
          vPanning        := Search_Array(Panning_Value[offset],   Panning_Code, Panning_Text);             // Returns Text in listt

          vJSAFMode       := Search_Array(JSAFMode_Value[offset], JSAFMode_Code, JSAFMode_Text);            // Returns Text in array
          vJSMFMode       := Search_Array(JSMFMode_Value[offset], JSMFMode_Code, JSMFMode_Text);            // Returns Text in array
          vJSOPMode       := Search_Array(JSOPMode_Value[offset], JSOPMode_Code, JSOPMode_Text);            // Returns Text in array
          vJSLock         := Search_Array(JSLock_Value[offset],   JSLock_Code, JSLock_Text);                // Returns Text in array


          // Buttons in Photo Mode
          vButton3        := Search_Array(Button3_Value[offset,Photo],  Button_Code, Button_Text);          // Returns Text in list
          vButton4        := Search_Array(Button4_Value[offset,Photo],  Button_Code, Button_Text);          // Returns Text in list
          vButton9        := Search_Array(Button9_Value[offset,Photo],  Button_Code, Button_Text);          // Returns Text in list
          vButton10       := Search_Array(Button10_Value[offset,Photo], Button_Code, Button_Text);          // Returns Text in list
          vButton20       := Search_Array(Button20_Value[offset,Photo], Button_Code, Button_Text);          // Returns Text in list
          vFnButton       := Search_Array(FNButton_Value[offset,Photo], Button_Code, Button_Text);          // Returns Text in list

          //ShowMessage('Pasm Mode is ' + inttostr(PASMMode));

          vRearDial       := Search_Array(RearDial_Photo_Value[offset,PASMMode], Wheel_Code,  Wheel_Text);       // Returns Text in list
          vRightDial      := Search_Array(RightDial_Photo_Value[offset,PASMMode],Wheel_Code,  Wheel_Text);       // Returns Text in list


          // Buttons in Video Mode
          vButton3_Video  := Search_Array(Button3_Value[offset,Video],  Button_Code, Button_Text);          // Returns Text in list
          vButton4_Video  := Search_Array(Button4_Value[offset,Video],  Button_Code, Button_Text);          // Returns Text in list
          vButton9_Video  := Search_Array(Button9_Value[offset,Video],  Button_Code, Button_Text);          // Returns Text in list
          vButton10_Video := Search_Array(Button10_Value[offset,Video], Button_Code, Button_Text);          // Returns Text in list
          vButton20_Video := Search_Array(Button20_Value[offset,Video], Button_Code, Button_Text);          // Returns Text in list
          vFnButton_Video := Search_Array(FNButton_Value[offset,Video], Button_Code, Button_Text);          // Returns Text in list

          vRearDial_Video   := Search_Array(RearDial_Video_Value[offset,PASMMode], Wheel_Code,  Wheel_Text);     // Returns Text in list
          vRightDial_Video  := Search_Array(RightDial_Video_Value[offset,PASMMode],Wheel_Code,  Wheel_Text);     // Returns Text in list

          // Video Tab

          //showmessage('VP Offset = ' + inttostr(VP_Offset));
          vVidPro           := Search_Array((VidPro_Value[Offset]),  VidPro_Code, VidPro_Text);               // Returns Text in lis

          vVFormat          := Search_Array(Vid_Format_Value[offset,VP_Offset],     Vid_Format_Code,      Vid_Format_Text);
          vVResolution      := Search_Array(Vid_Resolution_Value[offset,VP_Offset], Vid_Resolution_Code,  Vid_Resolution_Text);
          vVFrameRate       := Search_Array(Vid_FrameRate_Value[offset,VP_Offset],  Vid_FrameRate_Code,   Vid_FrameRate_Text);
          vVCodec           := Search_Array(Vid_Codec_Value[offset,VP_Offset],      Vid_Codec_Code,       Vid_Codec_Text);
          vVCompression     := Search_Array(Vid_Compression_Value[offset,VP_Offset],Vid_Compression_Code, Vid_Compression_Text);
          vVYUV             := Search_Array(Vid_YUV_Value[offset,VP_Offset],        Vid_YUV_Code,         Vid_YUV_Text);
          vVBitRate         := Search_Array(Vid_BitRate_Value[offset,VP_Offset],    Vid_BitRate_Code,     Vid_BitRate_Text);
          vVLog             := Search_Array(Vid_Log_Value[offset,VP_Offset],        Vid_Log_Code,         Vid_Log_Text);
          vVSensor          := Search_Array(Vid_Sensor_Value[offset,VP_Offset],     Vid_Sensor_Code,      Vid_Sensor_Text);
          vVAudio           := Search_Array(Vid_Audio_Value[offset,VP_Offset],      Vid_Audio_Code,       Vid_Audio_Text);
          vVMedium          := Search_Array(Vid_Medium_Value[offset,VP_Offset],     Vid_Medium_Code,      Vid_Medium_Text);


          //showmessage('Decoded to here');

          if (vCameraModel ='LEICA SL3') or (vCameraModel ='LEICA SL3-S') or (vCameraModel ='LEICA Fac') then  // Only include Left dial etc for the cameras that support it!
          begin
            vPASMMode       := Search_Array(PASMMode_Value[offset],  PASMMode_Code, PASMMode_Text);         // Returns Text in list
            vLeftDial       := Search_Array(LeftDial_Photo_Value[offset,PASMMode],  Wheel_Code,  Wheel_Text);    // Returns Text in list
            vVidPro         := Search_Array((VidPro_Value[offset]),  VidPro_Code, VidPro_Text);             // Returns Text in list
            vLeftDialRot    := Search_Array(LeftDial_Rotation_Value[offset], Rot_Code, Rot_Text);           // Returns Text in list
            vRearDialRot    := Search_Array(RearDial_Rotation_Value[offset], Rot_Code, Rot_Text);             // Returns Text in list
            vRightDialRot   := Search_Array(RightDial_Rotation_Value[offset], Rot_Code, Rot_Text);            // Returns Text in list

          end;


        If FS_Offset = 0 then
            begin
            vContrast0      := Search_Array((Contrast0_Value[offset]),     Contrast_Code, FilmStyleSetting_Text);  // Returns Text in list
            vHighlight0     := Search_Array((Highlight0_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vShadow0        := Search_Array((Shadow0_Value[offset]),       Contrast_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vSharpness0     := Search_Array((Sharpness0_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Returns Text in list
            vSaturation0    := Search_Array((Saturation0_Value[offset]),   FilmStyleSetting_Code, FilmStyleSetting_Text);  // Returns Text in list
            end

          else if FS_Offset = 1 then
            begin
            vContrast0      := Search_Array((Contrast1_Value[offset]),     Contrast_Code, FilmStyleSetting_Text);  // Returns Text in list
            vHighlight0     := Search_Array((Highlight1_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vShadow0        := Search_Array((Shadow1_Value[offset]),       Contrast_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vSharpness0     := Search_Array((Sharpness1_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Returns Text in list
            vSaturation0    := Search_Array((Saturation1_Value[offset]),   FilmStyleSetting_Code, FilmStyleSetting_Text);  // Returns Text in list
            end

          else if FS_Offset = 2 then
            begin
            vContrast0      := Search_Array((Contrast2_Value[offset]),     Contrast_Code, FilmStyleSetting_Text);  // Returns Text in list
            vHighlight0     := Search_Array((Highlight2_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vShadow0        := Search_Array((Shadow2_Value[offset]),       Contrast_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vSharpness0     := Search_Array((Sharpness2_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Returns Text in list
            vSaturation0    := Search_Array((Saturation2_Value[offset]),   FilmStyleSetting_Code, FilmStyleSetting_Text);  // Returns Text in list
            end

          else if FS_Offset = 3 then
            begin
            vContrast0      := Search_Array((Contrast3_Value[offset]),     Contrast_Code, FilmStyleSetting_Text);  // Returns Text in list
            vHighlight0     := Search_Array((Highlight3_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vShadow0        := Search_Array((Shadow3_Value[offset]),       Contrast_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vSharpness0     := Search_Array((Sharpness3_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Returns Text in list

            end

          else if FS_Offset = 4 then
            begin
            vContrast0      := Search_Array((Contrast4_Value[offset]),     Contrast_Code, FilmStyleSetting_Text);  // Returns Text in list
            vHighlight0     := Search_Array((Highlight4_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vShadow0        := Search_Array((Shadow4_Value[offset]),       Contrast_Code, FilmStyleSetting_Text);  // Get code from DB, lookup the Code
            vSharpness0     := Search_Array((Sharpness4_Value[offset]),    FilmStyleSetting_Code, FilmStyleSetting_Text);  // Returns Text in list

            end;


  end;           // end of Proc


  procedure Save_File();
    begin

    //fileName  pre selected
    //filepath


        var Temp := ExtractFileName(FileName);

        //showmessage('Filename = ' + Temp);

        if Temp = 'Settings.lcs'  then
          begin
              If Licenced then
                begin

                    If (vCameraModel = 'LEICA M11') or (vCameraModel = 'LEICA M')   then  // Output the new Settings File
                      begin
                      New_FileName:= 'Settings.lcse';
                      SaveStream();
                       if Debug then                                                    // Save the output file
                          //showmessage('Saved File = ' + New_FileName);
                      end;

                    If vCameraModel <> 'LEICA M11'   then
                      begin
                      New_FileName:= 'Settings.lcs';
                      SaveStream();
                       if Debug then                                                      // Save the output file
                          //showmessage('Saved File = ' + New_FileName);
                      end;

                end

              else
                begin
                    ShowMessage('The Software is not Licensed to save Files');
                end;
          end

        else
         if Temp = 'Settings1.cus'  then
          begin
          New_FileName:= 'Settings1.cus';
          SaveStream();
          end;

    end;            // End of Proc


  procedure SaveStream();

  //var  ShouldSave: Boolean;
  var  count: LongInt;


     begin

        If Update_Fail = False then
          begin

               Count := Length(Camera_array);
               //showmessage('Count = '+ inttostr(Count));

               // New Filename is ready to save


             {$IFDEF MSWindows}

                  If New_FileName = 'Settings1.cus' then
                    begin
                    FullFileName := (ExtractFilePath(ParamStr(0)) + 'Custom\' + New_FileName);
                    end

                  else
                    begin
                    FullFileName := (ExtractFilePath(ParamStr(0)) + 'Output\' + New_FileName);
                    end;

              {$ELSE}

              {$IFDEF MACOS}

              if (New_FileName = 'Settings.lcs') or (New_FileName = 'Settings.lcse') then
                 begin

                  FullFileName := (GetParentFolder(ParamStr(0), 7) +  'Leica/Output/' + New_FileName);

                  //showmessage('Filename = ' + FullFileName);

                 end

               else
                   if (New_FileName = 'Custom 1.cus')then
                     begin
                      FullFileName := (GetParentFolder(ParamStr(0), 7) +  'Leica/Custom/' + New_FileName);

                      //showmessage('Filename = ' + FullFileName);
                     end;


              {$ENDIF}

            {$ENDIF}



               var Save_FileName := FullFileName;


             {$IFDEF MSWindows}
                     if System.SysUtils.FileExists(Save_FileName) = true then

                      begin

                        Answer := QuestionChanges('File Exists, Overwrite ? ');

                        if Answer = 'true'  then
                            begin
                              Answer := QuestionChanges('Do you really want to delete ? ');

                                        if  Answer = 'true' then
                                        DeleteFile(PChar(Save_FileName));

                            end

                        else
                          begin
                            ShowMessage('File Not Saved ');
                          end;


                      end;

              {$ELSE}

              {$IFDEF MACOS}



              {$ENDIF}

            {$ENDIF}

                //ShowMessage('File to Save = ' + Save_FileName);



              FS := TFileStream.Create(Save_FileName,fmCreate);                      // Create a file to save the changes

                if Assigned(FS)
                then

                  begin

                    FS.Position := 0;                                           // Reset to the beginning of the stream.

                      try
                        //Showmessage('File Opened = ' + FileName);
                        FS.Write(Camera_array[0],Count);         // Send the Camera_Array  to the file

                      finally

                        FS.Free;
                        //Showmessage('File Closed = ' + FileName);
                      end
                  end;





             if System.SysUtils.FileExists(Save_FileName) = False then
               Begin
                //Showmessage('Reached Here');

                FS := TFileStream.Create(Save_FileName,fmCreate);                      // Create a file to save the changes

                  if Assigned(FS)
                  then

                    begin

                      FS.Position := 0;                                           // Reset to the beginning of the stream.

                        try
                          //Showmessage('File Opened = ' + FileName);
                          FS.Write(Camera_array[0],Count);         // Send the Camera_Array  to the file

                        finally

                          FS.Free;
                          //Showmessage('File Closed = ' + FileName);
                        end
                    end;


               End;


          end

          else
            Begin
               ShowMessage('Unable to Converrt file ');
            End;

     end;           // End of Procedure



  Procedure AddQuotes(var Search_Array: array of String);
    Begin
        for var i := 0 to 6 do
        begin
          var sTemp := Search_Array[i];
          sTemp := ('"' + sTemp + '"');
          Search_Array[i] := sTemp;
        end;


    End;

  Procedure RemoveQuotes();
    Begin

    Search_Custom_Text();                                                       // Re-Read the User Profile Names

    sText := COPYRIGHT;
        iLocation := Search_Text(sText, 0, Cusfilesize );                       //Extract the Copywrite from Array
          if iLocation <> -1  then

           begin
            //Showmessage('Text Found at Postion ' + inttostr(iLocation) );

            for var Letter_Index :=iLocation + 15 to iLocation + 24 do
               begin
                Asc := Ord(Camera_array[Letter_Index]);                       // Access Camera Array to
                sChar := sChar + Char(Asc);
               end;

            sChar:=  (Trim(sChar));                                           // Remove aall control Chars
            sChar := sChar.Replace(',', '', [rfReplaceAll, rfIgnoreCase]);    // Remove all instances of , in str
            sChar := sChar.Replace('"', '', [rfReplaceAll, rfIgnoreCase]);    // Remove all instances of " in str

            for var i := 0 to 6 do
            Copyright_Value[i] :=  (sChar);                                   // Add it to the Copywrite Array
            Copyright_Value[Status_Flag] := '1';
            sChar := '';
            iLocation := 0;                                                   // Clear Variables

           end;

    sText := ARTIST;

        iLocation := Search_Text(sText, 0, Cusfilesize );                       //Extract the Artist from Array
          if iLocation <> -1  then

           begin
            //Showmessage('Text Found at Postion ' + inttostr(iLocation) );

            for var Letter_Index :=iLocation + 15 to iLocation + 24 do
               begin
                Asc := Ord(Camera_array[Letter_Index]);                         // Access Camera Array to
                sChar := sChar + Char(Asc);                                     // Extract Artist Name from Array
               end;

            sChar:=  (Trim(sChar));                                             // Remove aall control Chars
            sChar := sChar.Replace(',', '', [rfReplaceAll, rfIgnoreCase]);      // Remove all instances of , in str
            sChar := sChar.Replace('"', '', [rfReplaceAll, rfIgnoreCase]);      // Remove all instances of " in str

            for var i := 0 to 6 do
            Artist_Value[i] :=  (sChar);                                        // Add it to the Copywrite Array
            Artist_Value[Status_Flag] := '1';                                   // Add it to the Artist Field
            sChar := '';                                                        // Clear Variables
            iLocation := 0;

           end;

    End;

function GetParentFolder(folder: String; const cLevels: BYTE = 1) : String;
var
    parent: String;
    level: BYTE;
begin
    // Given "C:\Parent\Child\" or "C:\Parent\Child\MyFile.txt", return "C:\Parent\"
    if (cLevels > 0) then
        begin
        parent := ExcludeTrailingPathDelimiter(folder);
        level := 0;
        while (level < cLevels) do
            begin
            parent := ExcludeTrailingPathDelimiter(ExtractFileDir(ExtractFilePath(parent)));
            Inc(level);
            end;

        Result := IncludeTrailingPathDelimiter(parent);
        end
    else
        Result := folder;
end;


end.              // End of Unit






