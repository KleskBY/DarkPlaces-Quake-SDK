VERSION 5.00
Begin VB.Form frmWizardSMDscript 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "SMD Script preview"
   ClientHeight    =   5025
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4560
   Icon            =   "WizardSMDscript.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5025
   ScaleWidth      =   4560
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtScript 
      Height          =   4335
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   120
      Width           =   4335
   End
   Begin VB.CommandButton btnClose 
      Caption         =   "Close preview"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   4560
      Width           =   4335
   End
End
Attribute VB_Name = "frmWizardSMDscript"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnClose_Click()
    SwitchForm Me, frmWizardSMDbuild
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub


Private Sub Form_Load()
    ' load language
    Me.btnClose.Caption = Str_Com_Finish
    Me.Caption = Str_Com_WindowCaption
End Sub
