object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Demo - DTCatraca'
  ClientHeight = 188
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Caminho'
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 59
    Height = 13
    Caption = 'n'#186' Comanda'
  end
  object edtCaminho: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'C:\TEMP'
  end
  object Button1: TButton
    Left = 8
    Top = 152
    Width = 121
    Height = 25
    Cursor = crHandPoint
    Caption = 'Gerar XML'
    TabOrder = 1
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 97
    Width = 121
    Height = 49
    Cursor = crHandPoint
    Caption = 'Status'
    ItemIndex = 0
    Items.Strings = (
      '1 - Bloqueado'
      '2 - Livre')
    TabOrder = 2
  end
  object edtComanda: TEdit
    Left = 8
    Top = 70
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '123'
  end
  object Memo1: TMemo
    Left = 135
    Top = 24
    Width = 363
    Height = 156
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object DTCatraca1: TDTCatraca
    ModeloCatraca = ctHenry
    Left = 208
    Top = 48
  end
end
