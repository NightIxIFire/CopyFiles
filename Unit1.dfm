object CopyFiles: TCopyFiles
  Left = 278
  Top = 324
  BorderStyle = bsDialog
  Caption = 'CopyFiles'
  ClientHeight = 111
  ClientWidth = 127
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMinimized
  PixelsPerInch = 96
  TextHeight = 13
  object OpenButton: TButton
    Left = 19
    Top = 9
    Width = 89
    Height = 25
    Caption = 'Source file'
    TabOrder = 0
    OnClick = OpenButtonClick
  end
  object SaveToButton: TButton
    Left = 19
    Top = 41
    Width = 89
    Height = 25
    Caption = 'Destination path'
    TabOrder = 1
    OnClick = SaveToButtonClick
  end
  object CopyFilesButton: TButton
    Left = 19
    Top = 72
    Width = 89
    Height = 25
    Caption = 'Copy files'
    TabOrder = 2
    OnClick = CopyFilesButtonClick
  end
  object OpenDialog: TJvOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Height = 0
    Width = 0
    Left = 91
    Top = 9
  end
  object SelectDirectory: TJvSelectDirectory
    Left = 91
    Top = 41
  end
end
