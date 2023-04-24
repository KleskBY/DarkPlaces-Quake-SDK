VERSION 5.00
Begin VB.Form frmWizardSMDbuild 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "frmWizardSMDbuild"
   ClientHeight    =   5985
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8760
   Icon            =   "WizardSMDbuild.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5985
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox flagAddSourcesToBuild 
      Caption         =   "flagAddSourcesToBuild"
      Height          =   255
      Left            =   3120
      TabIndex        =   33
      Top             =   3600
      Width           =   5535
   End
   Begin VB.ListBox List1 
      Enabled         =   0   'False
      Height          =   1425
      ItemData        =   "WizardSMDbuild.frx":08CA
      Left            =   240
      List            =   "WizardSMDbuild.frx":08CC
      TabIndex        =   32
      Top             =   3600
      Width           =   2415
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      Picture         =   "WizardSMDbuild.frx":08CE
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   21
      Top             =   120
      Width           =   495
   End
   Begin VB.TextBox txtScale 
      Height          =   285
      Left            =   3600
      TabIndex        =   20
      Top             =   2760
      Width           =   615
   End
   Begin VB.TextBox txtRotate 
      Height          =   285
      Left            =   3600
      TabIndex        =   19
      Top             =   2400
      Width           =   615
   End
   Begin VB.TextBox txtOffsetX 
      Height          =   285
      Left            =   3600
      TabIndex        =   18
      Top             =   2040
      Width           =   375
   End
   Begin VB.TextBox txtPath 
      Height          =   285
      Left            =   3600
      TabIndex        =   17
      Top             =   1680
      Width           =   1935
   End
   Begin VB.TextBox txtOffsetY 
      Height          =   285
      Left            =   4080
      TabIndex        =   16
      Top             =   2040
      Width           =   375
   End
   Begin VB.TextBox txtOffsetZ 
      Height          =   285
      Left            =   4560
      TabIndex        =   15
      Top             =   2040
      Width           =   375
   End
   Begin VB.TextBox txtName 
      Height          =   285
      Left            =   3600
      TabIndex        =   14
      Top             =   1320
      Width           =   1935
   End
   Begin VB.CheckBox flagBuildPk3 
      Caption         =   "flagBuildPk3"
      Height          =   255
      Left            =   3120
      TabIndex        =   8
      Top             =   4080
      Width           =   3495
   End
   Begin VB.CheckBox flagViewConverterOutput 
      Caption         =   "flagViewConverterOutput"
      Height          =   255
      Left            =   3120
      TabIndex        =   7
      Top             =   3840
      Width           =   4935
   End
   Begin VB.CommandButton btnSaveProject 
      Caption         =   "btnSaveProject"
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
      Left            =   1800
      TabIndex        =   4
      Top             =   5520
      Width           =   2295
   End
   Begin VB.ListBox lstAnim 
      Height          =   1815
      ItemData        =   "WizardSMDbuild.frx":1198
      Left            =   240
      List            =   "WizardSMDbuild.frx":119A
      TabIndex        =   3
      Top             =   1320
      Width           =   2415
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
      TabIndex        =   2
      Top             =   5520
      Width           =   1575
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
      TabIndex        =   1
      Top             =   5520
      Width           =   1575
   End
   Begin VB.CommandButton btnPreviewScript 
      Caption         =   "btnPreviewScript"
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
      Left            =   4800
      TabIndex        =   0
      Top             =   5520
      Width           =   2175
   End
   Begin VB.Frame Frame5 
      Height          =   855
      Left            =   -600
      TabIndex        =   6
      Top             =   5280
      Width           =   10695
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Frame3"
      Height          =   855
      Left            =   -720
      TabIndex        =   22
      Top             =   -120
      Width           =   10335
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
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
         TabIndex        =   23
         Top             =   360
         Width           =   5655
      End
   End
   Begin VB.Frame Frame2 
      Height          =   975
      Left            =   3000
      TabIndex        =   34
      Top             =   4080
      Width           =   5655
      Begin VB.TextBox txtPk3Name 
         Height          =   285
         Left            =   1080
         TabIndex        =   37
         Top             =   280
         Width           =   1095
      End
      Begin VB.ComboBox cmbPk3Compression 
         Height          =   315
         ItemData        =   "WizardSMDbuild.frx":119C
         Left            =   3360
         List            =   "WizardSMDbuild.frx":11AF
         TabIndex        =   36
         Text            =   "0 - Storage (recommended)"
         Top             =   280
         Width           =   2055
      End
      Begin VB.CheckBox flagSaveProject 
         Caption         =   "flagSaveProject"
         Enabled         =   0   'False
         Height          =   255
         Left            =   480
         TabIndex        =   35
         Top             =   600
         Width           =   4455
      End
      Begin VB.Label lblPk3Name 
         Caption         =   "lblPk3Name"
         Height          =   255
         Left            =   360
         TabIndex        =   39
         Top             =   285
         Width           =   735
      End
      Begin VB.Label lblPk3Compression 
         Caption         =   "lblPk3Compression"
         Height          =   255
         Left            =   2280
         TabIndex        =   38
         Top             =   285
         Width           =   975
      End
   End
   Begin VB.Label Label15 
      Alignment       =   2  'Center
      Caption         =   "Label15"
      Enabled         =   0   'False
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
      Left            =   240
      TabIndex        =   31
      Top             =   3240
      Width           =   2415
   End
   Begin VB.Label Label14 
      Caption         =   "Label14"
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
      Left            =   2880
      TabIndex        =   30
      Top             =   3240
      Width           =   5655
   End
   Begin VB.Label Label13 
      Alignment       =   1  'Right Justify
      Caption         =   "Label13"
      ForeColor       =   &H00404040&
      Height          =   255
      Left            =   4440
      TabIndex        =   29
      Top             =   2760
      Width           =   4095
   End
   Begin VB.Label Label12 
      Alignment       =   1  'Right Justify
      Caption         =   "Label12"
      ForeColor       =   &H00404040&
      Height          =   255
      Left            =   4440
      TabIndex        =   28
      Top             =   2400
      Width           =   4095
   End
   Begin VB.Label Label11 
      Alignment       =   1  'Right Justify
      Caption         =   "Label11"
      ForeColor       =   &H00404040&
      Height          =   255
      Left            =   5160
      TabIndex        =   27
      Top             =   2040
      Width           =   3375
   End
   Begin VB.Label Label10 
      Alignment       =   1  'Right Justify
      Caption         =   "Label10"
      ForeColor       =   &H00404040&
      Height          =   255
      Left            =   5760
      TabIndex        =   26
      Top             =   1680
      Width           =   2775
   End
   Begin VB.Label Label9 
      Alignment       =   1  'Right Justify
      Caption         =   "Label9"
      ForeColor       =   &H00404040&
      Height          =   255
      Left            =   5760
      TabIndex        =   25
      Top             =   1320
      Width           =   2775
   End
   Begin VB.Label Label8 
      Caption         =   "Label8"
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
      Left            =   2880
      TabIndex        =   24
      Top             =   960
      Width           =   5655
   End
   Begin VB.Label Label7 
      Caption         =   "Label7"
      Height          =   255
      Left            =   3000
      TabIndex        =   13
      Top             =   2760
      Width           =   855
   End
   Begin VB.Label Label6 
      Caption         =   "Label6"
      Height          =   255
      Left            =   3000
      TabIndex        =   12
      Top             =   2400
      Width           =   855
   End
   Begin VB.Label Label5 
      Caption         =   "Label5"
      Height          =   255
      Left            =   3000
      TabIndex        =   11
      Top             =   2040
      Width           =   855
   End
   Begin VB.Label Label4 
      Caption         =   "Label4"
      Height          =   255
      Left            =   3000
      TabIndex        =   10
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   255
      Left            =   3000
      TabIndex        =   9
      Top             =   1320
      Width           =   735
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Label2"
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
      Left            =   240
      TabIndex        =   5
      Top             =   960
      Width           =   2415
   End
End
Attribute VB_Name = "frmWizardSMDbuild"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' load previously used config to controls
Private Sub LoadConfig()
    ' load animations
    Me.lstAnim.Clear
    Dim tPos As Integer
    tPos = 0
    Do While (tPos < Compilation_ScriptAnimlistCount)
        Me.lstAnim.AddItem Compilation_ScriptAnimlist(tPos)
        tPos = tPos + 1
    Loop
    
    ' fix the model path to always include "models/" dir
    ' and name of model must never have a path
    Me.txtName.tExt = FileName_StripPath(Compilation_ScriptModelName)
    If (Left(Compilation_ScriptModelPath, Len(Program_ModelsDir)) = Program_ModelsDir) Then
        Me.txtPath.tExt = Mid(Compilation_ScriptModelPath, Len(Program_ModelsDir) + 1, 10000)
    Else
        Me.txtPath.tExt = Compilation_ScriptModelPath
    End If
    Me.txtOffsetX.tExt = Str(Compilation_ScriptModelOfs(0))
    Me.txtOffsetY.tExt = Str(Compilation_ScriptModelOfs(1))
    Me.txtOffsetZ.tExt = Str(Compilation_ScriptModelOfs(2))
    Me.txtRotate.tExt = Str(Compilation_ScriptModelRotate)
    Me.txtScale.tExt = Str(Compilation_ScriptModelScale)
    
    ' load flags
    Me.flagBuildPk3.Value = Compilation_BuilkPk3
    If (Compilation_BuilkPk3_Name = "unnamed") Then
        Me.txtPk3Name.tExt = Compilation_ScriptModelName
    Else
        Me.txtPk3Name.tExt = Compilation_BuilkPk3_Name
    End If
    Me.cmbPk3Compression.tExt = Compilation_BuilkPk3_Compression
    Me.flagSaveProject.Value = Compilation_SaveProject
    Me.flagAddSourcesToBuild.Value = Compilation_AddSourcesToBuild
    Me.flagViewConverterOutput.Value = Compilation_ViewConverterOutput
End Sub

' save config from controls
Private Sub SaveConfig()
    Dim tPos As Integer

    ' save animations
    Compilation_ScriptAnimlistCount = Me.lstAnim.ListCount
    tPos = 0
    Do While (tPos <= Me.lstAnim.ListCount)
        Compilation_ScriptAnimlist(tPos) = Me.lstAnim.List(tPos)
        tPos = tPos + 1
    Loop
    
    ' fix the model path to always include "models/" dir
    ' and name of model must never have a path
    Compilation_ScriptModelName = FileName_StripPath(Me.txtName.tExt)
    Compilation_ScriptModelPath = Me.txtPath.tExt
    Do While (Right(Compilation_ScriptModelPath, 1) = "\")
        Compilation_ScriptModelPath = Mid(Compilation_ScriptModelPath, 1, Len(Compilation_ScriptModelPath) - 1)
    Loop
    If (Left(Compilation_ScriptModelPath, Len(Program_ModelsDir)) <> Program_ModelsDir) Then Compilation_ScriptModelPath = Program_ModelsDir & Compilation_ScriptModelPath
    
    ' model options
    Compilation_ScriptModelOfs(0) = StrToSingle(Me.txtOffsetX.tExt)
    Compilation_ScriptModelOfs(1) = StrToSingle(Me.txtOffsetY.tExt)
    Compilation_ScriptModelOfs(2) = StrToSingle(Me.txtOffsetZ.tExt)
    Compilation_ScriptModelRotate = StrToSingle(Me.txtRotate.tExt)
    Compilation_ScriptModelScale = StrToSingle(Me.txtScale.tExt)
    
    ' save flags
    Compilation_BuilkPk3 = Me.flagBuildPk3.Value
    Compilation_BuilkPk3_Name = Me.txtPk3Name.tExt
    Compilation_BuilkPk3_Compression = StrToInteger(Left(Me.cmbPk3Compression.tExt, 1))
    Compilation_SaveProject = StrToInteger(Me.flagSaveProject.Value)
    Compilation_AddSourcesToBuild = Me.flagAddSourcesToBuild.Value
    Compilation_ViewConverterOutput = Me.flagViewConverterOutput.Value
End Sub

' shows script preview
Private Sub ShowScriptPreview()
    frmWizardSMDscript.Show
    frmWizardSMDscript.txtScript.tExt = BuildSMDScript(False)
End Sub

' saves project
Private Sub SaveIni()
    If (Program_LastBuildIni = "") Then Exit Sub
    Call SaveConfig
    Call ProjectSaveIni
End Sub

'
' Controls
'

Private Sub btnNext_Click()
    Call SaveIni
    SwitchForm Me, frmWizardSMDbuildDPM
End Sub


Private Sub btnPrev_Click()
    SwitchForm Me, frmWizardSMD
End Sub

Private Sub btnPreviewScript_Click()
    Call ShowScriptPreview
End Sub

Private Sub btnSaveProject_Click()
    Call SaveIni
End Sub

Private Sub flagBuildPk3_Click()
    If (Me.flagBuildPk3.Value = 0) Then
        Me.lblPk3Compression.Enabled = False
        Me.lblPk3Name.Enabled = False
        Me.txtPk3Name.Enabled = False
        Me.flagSaveProject.Enabled = False
        Me.cmbPk3Compression.Enabled = False
    Else
        Me.lblPk3Compression.Enabled = True
        Me.lblPk3Name.Enabled = True
        Me.txtPk3Name.Enabled = True
        Me.flagSaveProject.Enabled = True
        Me.cmbPk3Compression.Enabled = True
    End If
End Sub

Private Sub Form_Activate()
    Call LoadConfig
    Call flagBuildPk3_Click
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub

Private Sub Form_Load()
    ' load language
    Me.Caption = Str_Com_WindowCaption
    Me.btnPrev.Caption = Str_Com_Prev
    Me.btnSaveProject.Caption = Str_Com_SaveProject
    Me.btnPreviewScript.Caption = Str_Com_GenerateScript
    Me.btnNext.Caption = Str_Com_Finish
    Me.Label3.Caption = Str_WizSMDbuild_Caption
    Me.Label2.Caption = Str_WizSMDbuild_InfoAnimList
    Me.Label15.Caption = Str_WizSMDbuild_InfoTextureList
    Me.Label8.Caption = Str_WizSMDbuild_InfoModel
    Me.Label14.Caption = Str_WizSMDbuild_InfoFlags
    Me.Label1.Caption = Str_WizSMDbuild_ModelName
    Me.Label4.Caption = Str_WizSMDbuild_ModelPath
    Me.Label5.Caption = Str_WizSMDbuild_ModelOffset
    Me.Label6.Caption = Str_WizSMDbuild_ModelRotate
    Me.Label7.Caption = Str_WizSMDbuild_ModelScale
    Me.Label9.Caption = Str_WizSMDbuild_InfoModelName
    Me.Label10.Caption = Str_WizSMDbuild_InfoModelPath
    Me.Label11.Caption = Str_WizSMDbuild_InfoModelOffset
    Me.Label12.Caption = Str_WizSMDbuild_InfoModelRotate
    Me.Label13.Caption = Str_WizSMDbuild_InfoModelScale
    Me.flagAddSourcesToBuild.Caption = Str_WizSMDbuild_FlagAddSources
    Me.flagViewConverterOutput.Caption = Str_WizSMDbuild_FlagViewOutput
    Me.flagSaveProject.Caption = Str_WizSMDbuild_SaveProject
    Me.flagBuildPk3.Caption = Str_WizSMDbuild_MakePk3
    Me.lblPk3Name.Caption = Str_WizSMDbuild_MakePk3Name
    Me.lblPk3Compression.Caption = Str_WizSMDbuild_MakePk3Compression
End Sub
