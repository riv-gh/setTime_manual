unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, XPMan;

type
  TForm1 = class(TForm)
    Button1: TButton;
    MonthCalendar1: TMonthCalendar;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure SetDateTime(Year, Month, Day, Hour, Minu, Sec, MSec: Word);
var
  NewDateTime: TSystemTime;
begin
  FillChar(NewDateTime, SizeOf(NewDateTime), #0);
  NewDateTime.wYear := Year;
  NewDateTime.wMonth := Month;
  NewDateTime.wDay := Day;
  NewDateTime.wHour := Hour;
  NewDateTime.wMinute := Minu;
  NewDateTime.wSecond := Sec;
  NewDateTime.wMilliseconds := MSec;
  SetLocalTime(NewDateTime);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  N : TDate;
  day, mounth, year, hours, minutes, seconds : integer;
begin
  //SetDateTime(2020,1,1,1,1,1,1);
  N := (MonthCalendar1.Date);
  day := strToInt( formatdatetime('d', N) );
  mounth := strToInt( formatdatetime('m', N) );
  year := strToInt( formatdatetime('YYYY', N) );

  hours := strToInt(Edit1.Text);
  minutes := strToInt(Edit2.Text);
  seconds := strToInt(Edit3.Text);

  SetDateTime(year,mounth,day,hours,minutes,seconds,0);
  //button1.Caption := formatdatetime('m', N);
end;

end.
