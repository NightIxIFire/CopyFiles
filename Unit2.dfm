object Copy: TCopy
  Left = 302
  Top = 178
  Width = 758
  Height = 193
  Caption = 'Copy'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 101
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103':'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 60
    Height = 13
    Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072':'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 62
    Height = 13
    Caption = #1045#1075#1086' '#1088#1072#1079#1084#1077#1088':'
  end
  object Label4: TLabel
    Left = 112
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 72
    Top = 80
    Width = 32
    Height = 13
    Caption = 'Label5'
  end
  object Label6: TLabel
    Left = 72
    Top = 96
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object ProgressBar2: TJvDBProgressBar
    Left = 8
    Top = 56
    Width = 281
    Height = 17
    TabOrder = 0
  end
  object ProgressBar1: TJvProgressBar
    Left = 8
    Top = 8
    Width = 281
    Height = 17
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 120
    Width = 281
    Height = 25
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 304
    Top = 8
    Width = 425
    Height = 137
    DataSource = DS1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIZEFILE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIMECOPY'
        Width = 62
        Visible = True
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 208
    Top = 80
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'D:\CopyFiles\DB.FBD'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 8
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SIZEFILE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TIMECOPY'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 50
      end>
    StoreDefs = True
    TableName = 'FILES'
    Left = 72
  end
  object DS1: TDataSource
    DataSet = IBTable1
    Left = 104
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 40
  end
  object IBQ1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DS1
    Left = 160
  end
end
