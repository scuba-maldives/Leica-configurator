unit DisplayArrayFMX;

interface

uses
  Arrays, Data.Bind.Components, Data.Bind.Grid, FandPs, FMX.ComboEdit, 
  FMX.Controls, FMX.Controls.Presentation, FMX.Dialogs, FMX.DialogService, 
  FMX.Edit, FMX.ExtCtrls, FMX.Forms, FMX.Graphics, FMX.Grid, FMX.Layouts, 
  FMX.ListBox, FMX.Memo, FMX.Memo.Types, FMX.Menus, FMX.NumberBox, FMX.Objects, 
  FMX.ScrollBox, FMX.SpinBox, FMX.StdCtrls, FMX.Text, FMX.Types, MyTypes, 
  Quick.Log, Quick.Logger, Quick.Logger.Provider.Files,
  System.Classes, System.IOUtils, System.Notification, System.SysUtils, 
  System.Types, System.UITypes, System.Variants,FMX.EditBox;

type
    TDisplayArray = class(TForm)

    Read_Array: TButton;
    CancelBtn: TButton;
    Array_Display: TMemo;
    End_Address: TSpinBox;
    Memo_Text: TMemo;
    Camera_Type: TMemo;
    Start_Address: TSpinBox;
    NumberBox1: TNumberBox;
    GoNumber: TButton;
    Find: TButton;
    SearchText: TMemo;
    File_Type: TMemo;
    CheckBox1: TCheckBox;
    NextText: TButton;
    NextNumber: TButton;
    Show2DArray1: TButton;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Read_ArrayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure End_AddressChange(Sender: TObject);
    procedure NumberBox1ChangeValue(Sender: TObject);
    procedure FindNumberClick(Sender: TObject);
    procedure FindTextClick(Sender: TObject);
    procedure NextNumberClick(Sender: TObject);
    procedure NextTextClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Show2DArray1Click(Sender: TObject);
    procedure Show2DArray2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DisplayArray1: TDisplayArray;

  iMaxItems : Double;
  iCurrent  : LongInt;

  sLine     : string;
  sChar     : string;
  sCamera   : string;
  sAsc      : String;
  str       : string;

  iRow      : integer;
  iCol      : integer;
  Asc       : Integer;
  iAsc      : Integer;
  Index     : Integer;
  iTemp     : Double;
  iTemp2     : Double;
  iRowTotal : Integer;

  Buf       : PChar;
  Result    : PChar;

implementation

    uses Main_FormFMX, DecodeFMX, Camera_Parameters, Constants, ShowWheelsFMX, ShowButtonsFMX;

{$R *.FMX}


  procedure TDisplayArray.CancelBtnClick(Sender: TObject);
  begin
      //Array_Display.Clear;
      DisplayArray1.Close;
  end;

  procedure TDisplayArray.FormCreate(Sender: TObject);
  begin
       //Array_Display.Clear;
       //Camera_Type.Clear;
       Start_Address.value := 0;
       Start_Address.Max := Length(Camera_Array);
       End_Address.value := Length(Camera_Array);


       File_Type.text:= FileType;

       CheckBox1.IsChecked := True;

       // Read File Header and display in a Memo Field

       sChar := '';

         for var iLoop :=4 to 47 do         // Access Header of Array
           Begin
             iAsc := Ord(Camera_array[iLoop]);
             //ShowMessage('Char read: ' + Char(iAsc));
             sChar := sChar + Char(iAsc);
             //headerBytes := sChar;
           End;

       Memo_Text.Lines.Text :=  sChar;         // Update File Name Field


       Read_ArrayClick(Sender);

  end;

procedure TDisplayArray.FindNumberClick(Sender: TObject);

  begin
         // Find Number Button
         iTemp := End_Address.Value;
         iTemp2 := Start_Address.Value;

    for var iLoop := 0 to CUSfileSize do
         begin
            if NumberBox1.Value = Camera_array[iLoop] then

              begin
                Start_Address.Value := iLoop;
                End_Address.Value := iLoop+100;
                Read_ArrayClick(Sender);
                Start_Address.Value := Start_Address.Value+1;
                exit

              end

         end;

         Showmessage('Number not Found');

  end;


procedure TDisplayArray.FindTextClick(Sender: TObject);

  begin


  var Found : Boolean := False;
  var iPosition: Integer;

       // Find Text Button
       iTemp := End_Address.Value;

      str:=SearchText.Lines[0];
      //Showmessage('Search for String '+ str + ' from ' + inttostr(Start_Address.Value) +' to ' + inttostr(End_Address.Value));

          begin

              iPosition := Search_Text(str,0,CUSfileSize-1 );

              If iPosition  <> -1 then


                 begin
                      Start_Address.Value := iPosition-1;
                      End_Address.Value := iPosition + 97;
                      Read_ArrayClick(Sender);
                      //Start_Address.Value := Start_Address.Value+1;

                      Found := True;

                      exit
                 end


          end;




       if Found <> true then
        begin
         //Showmessage('String not Found');
         Start_Address.Value := 0;
        end;
  end;

procedure TDisplayArray.NextTextClick(Sender: TObject);

  begin
        //SearchText.Clear;
        SearchText.Lines.add (str);
        Start_Address.Value := End_Address.Value-9;
        End_Address.Value   := iTemp;
        FindTextClick(Sender);
  end;

procedure TDisplayArray.NextNumberClick(Sender: TObject);

  begin
        Start_Address.Value :=  End_Address.Value-9;
        End_Address.Value   := iTemp;
        FindNumberClick(Sender);
  end;



procedure TDisplayArray.NumberBox1ChangeValue(Sender: TObject);
  begin
        // Search Number

  end;

procedure TDisplayArray.Read_ArrayClick(Sender: TObject);

  Begin
    //checkCameraModel ();
    Camera_Type.Text :=  vCameraModel;
    File_Type.text:= FileType;

     iCurrent := 0;
     iRow := 0;
     sChar := '';
     sCamera := '';


     var isascii :=False; //Boolean;



     //SpinEdit1.MaxValue :=  Length(displayed_array)-1;
     iMaxItems := End_Address.value;

     //Array_Display.Clear;

     SearchText.Lines.Text :=  '';

     if (FileType = 'Custom') or (FileType = 'Import') then

            begin

                 while iCurrent < iMaxItems+10 do
                    begin
                          if CheckBox1.IsChecked then

                                Begin

                                  sLine := 'Row' + inttostr(iRow) + '  ' ;

                                    for iCol := 1 to 100 do

                                          begin
                                          inc  (iCurrent);
                                          if iCurrent <= iMaxItems then

                                                 if (Camera_array[iCurrent-1] > 32) and (Camera_array[iCurrent-1] < 127) then          // ASCII

                                                           begin
                                                                isascii := True;
                                                                sLine := sLine + chr(Camera_array[iCurrent-1]) + '  ';         // Convert to ASCII

                                                           end

                                                    else


                                          end;

                                    if isascii then

                                        begin
                                            Array_Display.Lines.Add (sLine);
                                            iRow := iRow + 10;
                                            isascii := False;
                                        end

                                    else

                                        begin
                                            iRow := iRow + 10;
                                            isascii := False;
                                        end;

                                end




                         else

                               Begin

                                  sLine := 'Row' + inttostr(iRow) + '  ' ;                     // Numeric

                                    for iCol := 1 to 10 do

                                          begin
                                          inc  (iCurrent);
                                          iRowTotal := iRowTotal +  Camera_array[iCurrent-1] ;

                                          if iCurrent <= iMaxItems then


                                                    begin

                                                      sLine := sLine + IntToStr(Camera_array[iCurrent-1]) + #9;

                                                    end;

                                          end;

                                    sLine := sLine + IntToStr(iRowTotal);

                                    Array_Display.Lines.Add (sLine);
                                    iRow := iRow + 10;
                                    iRowTotal := 0;

                               end;



                   end;

                   Array_Display.SelStart := 0;                                         // Set Cursor to Start of MemoBox
                   Array_Display.SelLength:=1;

                   //ShowMessage('All bytes read:');

            end;
  end;



procedure TDisplayArray.Show2DArray1Click(Sender: TObject);
begin
     Application.CreateForm(TDialsForm, DialsForm);
     DialsForm.Show;
end;

procedure TDisplayArray.Show2DArray2Click(Sender: TObject);
begin
     Application.CreateForm(TButtonsForm, ButtonsForm);
     ButtonsForm.Show;
end;



procedure TDisplayArray.SpinButton1DownClick(Sender: TObject);
  begin
    iMaxItems:=iMaxItems-100
  end;



procedure TDisplayArray.CheckBox1Click(Sender: TObject);
  begin
    End_Address.value := CusFilesize;
    Read_ArrayClick(Sender);
  end;


procedure TDisplayArray.End_AddressChange(Sender: TObject);
  begin
    iMaxItems:=iMaxItems+100
  end;

end.          // End of Unit

