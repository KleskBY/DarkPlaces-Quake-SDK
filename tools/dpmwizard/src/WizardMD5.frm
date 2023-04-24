VERSION 5.00
Begin VB.Form frmWizardMD5 
   Caption         =   "DPM Wizard"
   ClientHeight    =   4500
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6735
   Icon            =   "WizardMD5.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4500
   ScaleWidth      =   6735
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnPrev 
      Caption         =   "<< &Back"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   3960
      Width           =   1575
   End
   Begin VB.CommandButton btnNext 
      Caption         =   "&Next >>"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5040
      TabIndex        =   0
      Top             =   3960
      Width           =   1575
   End
   Begin VB.Label Label1 
      Caption         =   "Not done"
      Height          =   255
      Left            =   1920
      TabIndex        =   2
      Top             =   1320
      Width           =   1575
   End
End
Attribute VB_Name = "frmWizardMD5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnPrev_Click()
    SwitchForm Me, frmWizardCreate
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub

