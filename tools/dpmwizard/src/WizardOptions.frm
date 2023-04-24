VERSION 5.00
Begin VB.Form frmWizardOptions 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "DPM Wizard"
   ClientHeight    =   5985
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8760
   Icon            =   "WizardOptions.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5985
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtPk3Ext 
      Height          =   285
      Left            =   2520
      TabIndex        =   37
      Top             =   3840
      Width           =   1695
   End
   Begin VB.TextBox txtPk3Prefix 
      Height          =   285
      Left            =   2520
      TabIndex        =   35
      Top             =   3480
      Width           =   1695
   End
   Begin VB.TextBox txtModelPathPrefix 
      Height          =   285
      Left            =   2520
      TabIndex        =   33
      Top             =   4200
      Width           =   1695
   End
   Begin VB.TextBox txtToolTexConvert 
      Height          =   285
      Left            =   6720
      TabIndex        =   31
      Top             =   3120
      Width           =   1695
   End
   Begin VB.TextBox txtOpenPath 
      Height          =   285
      Left            =   2520
      TabIndex        =   28
      Top             =   2400
      Width           =   1695
   End
   Begin VB.TextBox txtArchiveExt 
      Height          =   285
      Left            =   2520
      TabIndex        =   26
      Top             =   3120
      Width           =   1695
   End
   Begin VB.TextBox txtArchivePath 
      Height          =   285
      Left            =   2520
      TabIndex        =   24
      Top             =   2760
      Width           =   1695
   End
   Begin VB.TextBox txtDPMVIEW 
      Height          =   285
      Left            =   6720
      TabIndex        =   21
      Top             =   2400
      Width           =   1695
   End
   Begin VB.TextBox txt7Z 
      Height          =   285
      Left            =   6720
      TabIndex        =   20
      Top             =   2760
      Width           =   1695
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      Picture         =   "WizardOptions.frx":08CA
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   15
      Top             =   120
      Width           =   495
   End
   Begin VB.TextBox txtBuildPath 
      Height          =   285
      Left            =   2520
      TabIndex        =   12
      Top             =   2040
      Width           =   1695
   End
   Begin VB.TextBox txtMD52DPM 
      Height          =   285
      Left            =   6720
      TabIndex        =   10
      Top             =   2040
      Width           =   1695
   End
   Begin VB.CommandButton btnDefaults 
      Caption         =   "btnDefaults"
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
      TabIndex        =   9
      Top             =   5520
      Width           =   1695
   End
   Begin VB.ComboBox cmbLanguage 
      Height          =   315
      ItemData        =   "WizardOptions.frx":1194
      Left            =   6720
      List            =   "WizardOptions.frx":119E
      TabIndex        =   8
      Text            =   "English"
      Top             =   4200
      Width           =   1695
   End
   Begin VB.TextBox txtSMD2DPM 
      Height          =   285
      Left            =   6720
      TabIndex        =   7
      Top             =   1680
      Width           =   1695
   End
   Begin VB.TextBox txtLastBuildIni 
      Height          =   285
      Left            =   2520
      TabIndex        =   6
      Top             =   1680
      Width           =   1695
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "btnCancel"
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
      TabIndex        =   2
      Top             =   5520
      Width           =   1575
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "btnOK"
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
      Left            =   3720
      TabIndex        =   1
      Top             =   5520
      Width           =   1575
   End
   Begin VB.CommandButton btnApply 
      Caption         =   "btnApply"
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
      Left            =   5400
      TabIndex        =   0
      Top             =   5520
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Height          =   1095
      Left            =   -240
      TabIndex        =   14
      Top             =   5280
      Width           =   9015
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Frame3"
      Height          =   855
      Left            =   -720
      TabIndex        =   16
      Top             =   -120
      Width           =   10335
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "Label9"
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
         TabIndex        =   17
         Top             =   360
         Width           =   7815
      End
   End
   Begin VB.Label Label16 
      Caption         =   "Label16"
      Height          =   255
      Left            =   360
      TabIndex        =   38
      Top             =   3840
      Width           =   2055
   End
   Begin VB.Label Label15 
      Caption         =   "Label15"
      Height          =   255
      Left            =   360
      TabIndex        =   36
      Top             =   3480
      Width           =   2055
   End
   Begin VB.Label Label6 
      Caption         =   "Label6"
      Height          =   255
      Left            =   360
      TabIndex        =   34
      Top             =   4200
      Width           =   2055
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   255
      Left            =   4560
      TabIndex        =   32
      Top             =   3120
      Width           =   2535
   End
   Begin VB.Label Label10 
      Alignment       =   2  'Center
      Caption         =   "Label10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   375
      Index           =   2
      Left            =   240
      TabIndex        =   30
      Top             =   4800
      Width           =   8295
   End
   Begin VB.Label Label14 
      Caption         =   "Label14"
      Height          =   255
      Left            =   360
      TabIndex        =   29
      Top             =   2400
      Width           =   2055
   End
   Begin VB.Label Label13 
      Caption         =   "Label13"
      Height          =   255
      Left            =   360
      TabIndex        =   27
      Top             =   3120
      Width           =   2055
   End
   Begin VB.Label Label5 
      Caption         =   "Label5"
      Height          =   255
      Left            =   360
      TabIndex        =   25
      Top             =   2760
      Width           =   2055
   End
   Begin VB.Label Label12 
      Caption         =   "Label12"
      Height          =   255
      Left            =   4560
      TabIndex        =   23
      Top             =   2400
      Width           =   2415
   End
   Begin VB.Label Label11 
      Caption         =   "Label11"
      Height          =   255
      Left            =   4560
      TabIndex        =   22
      Top             =   2760
      Width           =   2535
   End
   Begin VB.Label Label10 
      Caption         =   "Label10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   255
      Index           =   1
      Left            =   4440
      TabIndex        =   19
      Top             =   1200
      Width           =   3975
   End
   Begin VB.Label Label10 
      Caption         =   "Label10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   18
      Top             =   1200
      Width           =   3975
   End
   Begin VB.Label Label8 
      Caption         =   "Label8"
      Height          =   255
      Left            =   360
      TabIndex        =   13
      Top             =   2040
      Width           =   2055
   End
   Begin VB.Label Label7 
      Caption         =   "Label7"
      Height          =   255
      Left            =   4560
      TabIndex        =   11
      Top             =   2040
      Width           =   2175
   End
   Begin VB.Label Label4 
      Caption         =   "Label4"
      Height          =   255
      Left            =   4560
      TabIndex        =   5
      Top             =   4200
      Width           =   2055
   End
   Begin VB.Label Label3 
      Caption         =   "Label3"
      Height          =   255
      Left            =   4560
      TabIndex        =   4
      Top             =   1680
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "Label2"
      Height          =   255
      Left            =   360
      TabIndex        =   3
      Top             =   1680
      Width           =   2055
   End
End
Attribute VB_Name = "frmWizardOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnApply_Click()
    Program_LastBuildIni = Me.txtLastBuildIni.tExt
    Program_ToolPathSMD2DPM = Me.txtSMD2DPM.tExt
    Program_ToolPathMD52DPM = Me.txtMD52DPM.tExt
    Program_ToolPathDPMView = Me.txtDPMVIEW.tExt
    Program_ToolPath7Z = Me.txt7Z.tExt
    Program_Buildpath = Me.txtBuildPath.tExt
    Program_Language = Me.cmbLanguage.tExt
    Program_Openpath = Me.txtOpenPath.tExt
    Program_Archivepath = Me.txtArchivePath.tExt
    Program_ArchiveExt = Me.txtArchiveExt.tExt
    Program_ModelsDir = Me.txtModelPathPrefix.tExt
    Program_Pk3Prefix = Me.txtPk3Prefix.tExt
    Program_Pk3Extension = Me.txtPk3Ext.tExt
    Program_ToolImgConvert = Me.txtToolTexConvert.tExt
    
    Call SaveAppConfig
End Sub

Private Sub btnCancel_Click()
    SwitchForm Me, frmWizard
End Sub

Private Sub btnDefaults_Click()
    If (MsgBox(Str_WizOptionsMsgBox, vbYesNo, Str_WizOptionsMsgBox_Caption) = vbNo) Then Exit Sub
    Call FlushAppConfig
    Call Form_Activate
End Sub

Private Sub btnOK_Click()
    Call btnApply_Click
    SwitchForm Me, frmWizard
End Sub

Private Sub Form_Activate()
    Call LoadAppConfig
    
    Me.txtLastBuildIni.tExt = Program_LastBuildIni
    Me.txtSMD2DPM.tExt = Program_ToolPathSMD2DPM
    Me.txtMD52DPM.tExt = Program_ToolPathMD52DPM
    Me.txtDPMVIEW.tExt = Program_ToolPathDPMView
    Me.txt7Z.tExt = Program_ToolPath7Z
    Me.txtBuildPath.tExt = Program_Buildpath
    Me.cmbLanguage.tExt = Program_Language
    Me.txtOpenPath.tExt = Program_Openpath
    Me.txtArchivePath.tExt = Program_Archivepath
    Me.txtArchiveExt.tExt = Program_ArchiveExt
    Me.txtModelPathPrefix.tExt = Program_ModelsDir
    Me.txtPk3Prefix.tExt = Program_Pk3Prefix
    Me.txtPk3Ext.tExt = Program_Pk3Extension
    Me.txtToolTexConvert.tExt = Program_ToolImgConvert
End Sub
Private Sub Form_Deactivate()
    Unload Me
End Sub

Private Sub Form_Load()

    ' load language
    Me.Caption = Str_Com_WindowCaption
    Me.Label9.Caption = Str_WizOptions_Caption
    Me.Label10(0).Caption = Str_WizOptions_InfoOptions
    Me.Label8.Caption = Str_WizOptions_BuildPool
    Me.Label14.Caption = Str_WizOptions_OpenedProjects
    Me.Label2.Caption = Str_WizOptions_SaveLastBuild
    Me.Label4.Caption = Str_WizOptions_Language
    Me.Label5.Caption = Str_WizOptions_ArchivesDir
    Me.Label13.Caption = Str_WizOptions_ArchivesExt
    Me.Label10(1).Caption = Str_WizOptions_InfoUtils
    Me.Label3.Caption = Str_WizOptions_DPModelPath
    Me.Label7.Caption = Str_WizOptions_MD52DPMPath
    Me.Label12.Caption = Str_WizOptions_DPMViewPath
    Me.Label11.Caption = Str_WizOptions_7zPath
    Me.Label10(2).Caption = Str_WizOptions_Notes
    Me.btnDefaults.Caption = Str_WizOptions_ResetToDefaults
    Me.btnOK.Caption = Str_WizOptions_OK
    Me.btnApply.Caption = Str_WizOptions_Apply
    Me.btnCancel.Caption = Str_WizOptions_Cancel
    Me.Label15.Caption = Str_WizOptions_Pk3Prefix
    Me.Label16.Caption = Str_WizOptions_Pk3Ext
    Me.Label6.Caption = Str_WizOptions_ModelPathPrefix
    Me.Label1.Caption = Str_WizOptions_ImgConvert
End Sub

