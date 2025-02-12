unit CTLoaderFMX;

interface

uses
  Constants, Data.Bind.Components, Data.Bind.Grid, FMX.Controls, 
  FMX.Controls.Presentation, FMX.Dialogs, FMX.Edit, FMX.ExtCtrls, FMX.Forms, 
  FMX.Graphics, FMX.Grid, FMX.Layouts, FMX.ListBox, FMX.Memo, FMX.StdCtrls, 
  FMX.Types, System.Classes, System.Notification, System.SysUtils, 
  System.Types, System.UITypes, System.Variants, FMX.ComboEdit;


type
    TOFSelector = class(TForm)
    CTLoader_OK: TButton;
    CTLoader_Cancel: TButton;
    CameraTypeCB: TComboEdit;

    procedure FormCreate(Sender: TObject) ;
    procedure CTLoader_OKClick(Sender: TObject);
    procedure CTLoader_CancelClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OFSelector: TOFSelector;

implementation

{$R *.FMX}


procedure TOFSelector.FormCreate(Sender: TObject) ;

Begin

         //Showmessage('Camera Type ' + vCameraModel);

         If vCameraModel = 'LEICA SL'   then
         OFSelector.CameraTypeCB.ItemIndex := 0 ;

         If vCameraModel = 'LEICA SL2'   then
         OFSelector.CameraTypeCB.ItemIndex := 1 ;

         If vCameraModel = 'LEICA SL2S'   then
         OFSelector.CameraTypeCB.ItemIndex := 2 ;

         If vCameraModel = 'LEICA SL3'   then
         OFSelector.CameraTypeCB.ItemIndex := 3 ;

         If vCameraModel = 'LEICA SL3-S'   then
         OFSelector.CameraTypeCB.ItemIndex := 4 ;

         If vCameraModel = 'LEICA Q'   then
         OFSelector.CameraTypeCB.ItemIndex := 5 ;

         If vCameraModel = 'LEICA Q2'   then
         OFSelector.CameraTypeCB.ItemIndex := 6 ;

         If vCameraModel = 'LEICA Q3'   then
         OFSelector.CameraTypeCB.ItemIndex := 7 ;

         If vCameraModel = 'LEICA Q3 43'   then
         OFSelector.CameraTypeCB.ItemIndex := 8 ;

         If vCameraModel = 'LEICA M'   then
         OFSelector.CameraTypeCB.ItemIndex := 9 ;

         If vCameraModel = 'LEICA M11'   then
         OFSelector.CameraTypeCB.ItemIndex := 10 ;

         If vCameraModel = 'Leica Q2 Mono'   then
         OFSelector.CameraTypeCB.ItemIndex := 11 ;



End;



procedure TOFSelector.CTLoader_CancelClick(Sender: TObject);
begin
 // Cancel Action

   {Main_Form.Show; }
  vCameraModel := 'None Selected' ;
  OFSelector.Close;

end;

procedure TOFSelector.CTLoader_OKClick(Sender: TObject);
begin
     // Pass file type back to Main
     //Showmessage('Camera Type '+ inttostr(CameraTypeCB.ItemIndex));

           Case CameraTypeCB.ItemIndex of

        -1: vExportCameraModel := 'None Selected' ;
         0: vExportCameraModel := 'LEICA SL' ;
         1: vExportCameraModel := 'LEICA SL2';
         2: vExportCameraModel := 'LEICA SL2S' ;
         3: vExportCameraModel := 'LEICA SL3' ;
         4: vExportCameraModel := 'LEICA SL3-S';
         5: vExportCameraModel := 'LEICA Q' ;
         6: vExportCameraModel := 'LEICA Q2';
         7: vExportCameraModel := 'LEICA Q3';
         8: vExportCameraModel := 'LEICA Q3 43';
         9: vExportCameraModel := 'LEICA M';
         10: vExportCameraModel := 'LEICA M11';
         11: vExportCameraModel := 'LEICA Q2 MONO';


      end;

       if CameraTypeCB.ItemIndex >= 0  then
         {Main_Form.Show; }
          OFSelector.Close
       else
        Showmessage('Please select Camera Type');

end;


end.




