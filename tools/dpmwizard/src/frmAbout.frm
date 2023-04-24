VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "frmAbout"
   ClientHeight    =   5880
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6840
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5880
   ScaleWidth      =   6840
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtVersionHistory 
      BackColor       =   &H8000000F&
      Height          =   1455
      Left            =   2400
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   9
      Text            =   "frmAbout.frx":08CA
      Top             =   2760
      Width           =   4215
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      Picture         =   "frmAbout.frx":08DE
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   1
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton btnClose 
      Caption         =   "btnClose"
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
      Left            =   5040
      TabIndex        =   0
      Top             =   5400
      Width           =   1695
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Height          =   855
      Left            =   -600
      TabIndex        =   2
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
         TabIndex        =   3
         Top             =   360
         Width           =   7815
      End
   End
   Begin VB.Frame Frame2 
      Height          =   1455
      Left            =   -2520
      TabIndex        =   11
      Top             =   5160
      Width           =   9495
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      Caption         =   "Label5"
      Height          =   1095
      Left            =   120
      TabIndex        =   13
      Top             =   1560
      Width           =   2055
   End
   Begin VB.Label Label12 
      Alignment       =   2  'Center
      Caption         =   "Label12"
      Height          =   615
      Left            =   120
      TabIndex        =   12
      Top             =   4440
      Width           =   6615
   End
   Begin VB.Label Label8 
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   4680
      Width           =   6615
   End
   Begin VB.Label Label7 
      Caption         =   "Label7"
      Height          =   1095
      Left            =   2400
      TabIndex        =   8
      Top             =   1560
      Width           =   4335
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      Caption         =   "Label6"
      Height          =   1455
      Left            =   0
      TabIndex        =   7
      Top             =   2760
      Width           =   2175
   End
   Begin VB.Label Label4 
      Caption         =   "Programmed by"
      Height          =   255
      Index           =   0
      Left            =   0
      TabIndex        =   6
      Top             =   0
      Width           =   1695
   End
   Begin VB.Label Label3 
      Caption         =   "Label3"
      Height          =   615
      Left            =   2400
      TabIndex        =   5
      Top             =   960
      Width           =   4335
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Label2"
      Height          =   615
      Left            =   120
      TabIndex        =   4
      Top             =   960
      Width           =   2055
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnClose_Click()
    SwitchForm Me, frmWizard
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub

Private Sub Form_Load()
    ' load language
    Me.Caption = Str_Com_WindowCaption
    Me.btnClose.Caption = Str_About_Ok
    Me.Label1.Caption = Str_About_Caption
    Me.Label2.Caption = Str_About_CreatedBy
    Me.Label3.Caption = Str_About_Created
    Me.Label5.Caption = Str_About_IncludeUtils
    Me.Label7.Caption = Str_About_Include
    Me.Label6.Caption = Str_About_VersionHistory
    Me.txtVersionHistory.tExt = Str_About_VersionHistoryTxt
    Me.Label12.Caption = Str_About_Message
End Sub
