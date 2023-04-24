Attribute VB_Name = "lngHeaders"
'
' Main language module
'

' common strings
Public Str_Nl As String
Public Str_Com_WindowCaption As String
Public Str_Com_Exit As String
Public Str_Com_Options As String
Public Str_Com_Next As String
Public Str_Com_Prev As String
Public Str_Com_PrevBig As String
Public Str_Com_About As String
Public Str_Com_SaveProject As String
Public Str_Com_GenerateScript As String
Public Str_Com_Finish As String

' frmWizard
Public Str_Wiz_Caption As String
Public Str_Wiz_PathNew As String
Public Str_Wiz_PathContinueLast As String
Public Str_Wiz_PathBuildLast As String
Public Str_Wiz_Open As String
Public Str_Wiz_Preview As String

' frmAbout
Public Str_About_Caption As String
Public Str_About_CreatedBy As String
Public Str_About_Created As String
Public Str_About_IncludeUtils As String
Public Str_About_Include As String
Public Str_About_VersionHistory As String
Public Str_About_VersionHistoryTxt As String
Public Str_About_Message As String
Public Str_About_Ok As String

'frmOPtions
Public Str_WizOptions_Caption As String
Public Str_WizOptions_InfoOptions As String
Public Str_WizOptions_NewProjectName As String
Public Str_WizOptions_BuildPool As String
Public Str_WizOptions_OpenedProjects As String
Public Str_WizOptions_SaveLastBuild As String
Public Str_WizOptions_Language As String
Public Str_WizOptions_ArchivesDir As String
Public Str_WizOptions_ArchivesExt As String
Public Str_WizOptions_Pk3Prefix As String
Public Str_WizOptions_Pk3Ext As String
Public Str_WizOptions_ModelPathPrefix As String
Public Str_WizOptions_InfoUtils As String
Public Str_WizOptions_DPModelPath As String
Public Str_WizOptions_MD52DPMPath As String
Public Str_WizOptions_DPMViewPath As String
Public Str_WizOptions_7zPath As String
Public Str_WizOptions_ImgConvert As String
Public Str_WizOptions_Notes As String
Public Str_WizOptions_ResetToDefaults As String
Public Str_WizOptions_OK As String
Public Str_WizOptions_Apply As String
Public Str_WizOptions_Cancel As String
Public Str_WizOptionsMsgBox As String
Public Str_WizOptionsMsgBox_Caption As String

' frmOpen, frmOpenProgress
Public Str_WizOpen_Caption As String
Public Str_WizOpen_Info As String
Public Str_WizOpen_Open As String
Public Str_WizOpenProg_Caption As String
Public Str_WizOpenProg_SubCaption As String
Public Str_WizOpenProg_Cancel As String

' frmPreview
Public Str_WizPreview_Info As String

' frmWizardCreate
Public Str_WizCreate_Caption As String
Public Str_WizCreate_Option1 As String
Public Str_WizCreate_Option2 As String

' frmWizardSMD
Public Str_WizSMD_Caption As String
Public Str_WizSMD_InfoSource As String
Public Str_WizSMD_InfoAnimList1 As String
Public Str_WizSMD_InfoAnimList2 As String
Public Str_WizSMD_InfoAnimList3 As String

' frmWizardSMDbuild
Public Str_WizSMDbuild_Caption As String
Public Str_WizSMDbuild_InfoAnimList As String
Public Str_WizSMDbuild_InfoTextureList As String
Public Str_WizSMDbuild_InfoModel As String
Public Str_WizSMDbuild_InfoFlags As String
Public Str_WizSMDbuild_ModelName As String
Public Str_WizSMDbuild_ModelPath As String
Public Str_WizSMDbuild_ModelOffset As String
Public Str_WizSMDbuild_ModelRotate As String
Public Str_WizSMDbuild_ModelScale As String
Public Str_WizSMDbuild_InfoModelName As String
Public Str_WizSMDbuild_InfoModelPath As String
Public Str_WizSMDbuild_InfoModelOffset As String
Public Str_WizSMDbuild_InfoModelRotate As String
Public Str_WizSMDbuild_InfoModelScale As String
Public Str_WizSMDbuild_FlagAddSources As String
Public Str_WizSMDbuild_FlagViewOutput As String
Public Str_WizSMDbuild_SaveProject As String
Public Str_WizSMDbuild_MakePk3 As String
Public Str_WizSMDbuild_MakePk3Name As String
Public Str_WizSMDbuild_MakePk3Compression As String

' frmWizardSMDbuildDPM
Public Str_WizSMDbuildDPM_Caption As String
Public Str_WizSMDbuildDPM_PreviewModel As String
Public Str_WizSMDbuildDPM_Rebuild As String
Public Str_WizSMDbuildDPM_StopBuild As String
Public Str_WizSMDbuildDPM_OpenBuildDir As String
Public Str_WizSMDbuildDPM_MainMenu As String
Public Str_WizSMDbuildDPM_Init As String
Public Str_WizSMDbuildDPM_InitError As String
Public Str_WizSMDbuildDPM_CheckTools As String
Public Str_WizSMDbuildDPM_CopySrcFiles As String
Public Str_WizSMDbuildDPM_CopyTextures As String
Public Str_WizSMDbuildDPM_CopyTextureLayers As String
Public Str_WizSMDbuildDPM_CopyTexturesError As String
Public Str_WizSMDbuildDPM_CreateSkin As String
Public Str_WizSMDbuildDPM_Created As String
Public Str_WizSMDbuildDPM_SaveProject As String
Public Str_WizSMDbuildDPM_Saved As String
Public Str_WizSMDbuildDPM_GenScript As String
Public Str_WizSMDbuildDPM_Building As String
Public Str_WizSMDbuildDPM_BatchWritten As String
Public Str_WizSMDbuildDPM_BatchExecuted As String
Public Str_WizSMDbuildDPM_BuildingInProgress As String
Public Str_WizSMDbuildDPM_BuildComplete As String
Public Str_WizSMDbuildDPM_Path As String
Public Str_WizSMDbuildDPM_ModelPath As String
Public Str_WizSMDbuildDPM_CreatePk3 As String
Public Str_WizSMDbuildDPM_UsingPrefix As String
Public Str_WizSMDbuildDPM_UsingCompression As String
Public Str_WizSMDbuildDPM_Create7ZFileConfMsgbox As String
Public Str_WizSMDbuildDPM_Create7ZFileConfMsgboxCap As String
Public Str_WizSMDbuildDPM_Create7ZFileConfNewName As String
Public Str_WizSMDbuildDPM_Create7ZFileConfNewNameCap As String
Public Str_WizSMDbuildDPM_Create7ZFileConfNameError As String
Public Str_WizSMDbuildDPM_Create7ZFileConfNameErrorCap As String

' clsBuild module
Public Str_clsBuild_Tab As String
Public Str_clsBuild_Warning As String
Public Str_clsBuild_RunTimeError As String
Public Str_clsBuild_DelDirTreeErr As String
Public Str_clsBuild_DelDirTreeErr1 As String
Public Str_clsBuild_StartBuildProc As String
Public Str_clsBuild_ShutdownBuild As String
Public Str_clsBuild_StopBuild As String
Public Str_clsBuild_BasePath As String
Public Str_clsBuild_UseDir As String
Public Str_clsBuild_UsePathError1 As String
Public Str_clsBuild_UsePathError2 As String
Public Str_clsBuild_UsePathReason As String
Public Str_clsBuild_CreatePath As String
Public Str_clsBuild_CreatePathError As String
Public Str_clsBuild_Check As String
Public Str_clsBuild_CheckError As String
Public Str_clsBuild_CheckNotFound As String
Public Str_clsBuild_CheckFound As String
Public Str_clsBuild_CheckRuntimeError As String
Public Str_clsBuild_AddFile As String
Public Str_clsBuild_AddDone As String
Public Str_clsBuild_AddNotFound As String
Public Str_clsBuild_AddError As String
Public Str_clsBuild_AddWarning1 As String
Public Str_clsBuild_AddWarning2 As String
Public Str_clsBuild_AddReason As String

' generic function of languages handling
Public Sub LoadLanguages()
    Str_Nl = Chr(13) & Chr(10)

    Select Case Program_Language
        Case "English"
            LoadLang_English
        Case "Russian"
            LoadLang_Russian
        Case Else
            ' load from .ini?
    End Select
End Sub



