VERSION 5.00
Begin VB.Form frmWizardCreate 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "frmWizardCreate"
   ClientHeight    =   5985
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8760
   Icon            =   "WizarCreate.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5985
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      Picture         =   "WizarCreate.frx":08CA
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   6
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton btnPrev 
      Caption         =   "btnPrev"
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
      TabIndex        =   4
      Top             =   5520
      Width           =   3375
   End
   Begin VB.CommandButton btnNext 
      Caption         =   "btnNext"
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
      Left            =   7080
      TabIndex        =   3
      Top             =   5520
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4095
      Left            =   240
      TabIndex        =   0
      Top             =   960
      Width           =   8295
      Begin VB.OptionButton Option2 
         Caption         =   "Option2"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   360
         TabIndex        =   2
         Top             =   960
         Width           =   6375
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Option1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   360
         TabIndex        =   1
         Top             =   480
         Value           =   -1  'True
         Width           =   6375
      End
   End
   Begin VB.Frame Frame2 
      Height          =   975
      Left            =   -960
      TabIndex        =   5
      Top             =   5280
      Width           =   9735
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Frame3"
      Height          =   855
      Left            =   -720
      TabIndex        =   7
      Top             =   -120
      Width           =   10335
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1560
         TabIndex        =   8
         Top             =   360
         Width           =   7815
      End
   End
End
Attribute VB_Name = "frmWizardCreate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnNext_Click()
    If (Me.Option1.Value = True) Then
        SwitchForm Me, frmWizardSMD
        Exit Sub
    End If
    If (Me.Option2.Value = True) Then
        SwitchForm Me, frmWizardMD5
        Exit Sub
    End If
End Sub

Private Sub btnPrev_Click()
    SwitchForm Me, frmWizard
End Sub

Private Sub Form_Activate()
    Me.Option1.Value = False
    Me.Option2.Value = False
    If (Compilation_Format = dpgFormatSMD) Then Me.Option1.Value = True
    If (Compilation_Format = dpgFormatMD5) Then Me.Option2.Value = True
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub

Private Sub Form_Load()
    ' load language
    Me.Caption = Str_Com_WindowCaption
    Me.btnNext.Caption = Str_Com_Next
    Me.btnPrev.Caption = Str_Com_PrevBig
    Me.Option1.Caption = Str_WizCreate_Option1
    Me.Option2.Caption = Str_WizCreate_Option2
    Me.Label1.Caption = Str_WizCreate_Caption
End Sub
