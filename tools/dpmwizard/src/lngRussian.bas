Attribute VB_Name = "lngRussian"
'
' Russian language module
'

Public Sub LoadLang_Russian()
    ' generic strings
    Str_Com_WindowCaption = "������ DPM"
    Str_Com_Exit = "&�����"
    Str_Com_Options = "�����&����"
    Str_Com_Next = "&����� >>"
    Str_Com_Prev = "<< &�����"
    Str_Com_PrevBig = "&����� (������ ���������)"
    Str_Com_About = "&� ���������"
    Str_Com_SaveProject = "&��������� ������"
    Str_Com_GenerateScript = "&������ �������"
    Str_Com_Finish = "&��������� >>"
    
     ' frmWizard
    Str_Wiz_Caption = "������ DPM ������������ ���"
    Str_Wiz_PathNew = "&����� ������"
    Str_Wiz_PathContinueLast = "&���������� ���������� ������"
    Str_Wiz_PathBuildLast = "��������� ���������� ������"
    Str_Wiz_Open = "&������� ������ ������"
    Str_Wiz_Preview = "�&������ ������ � ������������ DPM"
    
    ' frmAbout
    Str_About_Caption = "� ��������� ������ DPM ������ 0.5"
    Str_About_CreatedBy = "�����"
    Str_About_Created = "����� �. [VorteX] ��������" & Str_Nl & "RazorWind Games"
    Str_About_IncludeUtils = "�������� � ���� c������� ���������������� �������"
    Str_About_Include = "dpmodel (�) Forest [LordHavoc] Hale" & Str_Nl & "dpmview (�) Forest [LordHavoc] Hale" & Str_Nl & "md52dpm (�) [Riot]" & Str_Nl & "7zip (�) ����� ������" & Str_Nl & "ImageMagick converter � ImageMagick Studio LLC"
    Str_About_VersionHistory = "������� ������"
    Str_About_VersionHistoryTxt = "������ 0.5..." & Str_Nl & "    ��������� ������"
    Str_About_Message = "���� ��� ����������� ��� ������� ��� �� ������ �������� � ��������� " & Str_Nl & "������ ��� e-mail �� paul.vortex@gmail.com" & Str_Nl & "C �������, VorteX"
    Str_About_Ok = "���-����..."
    
    ' frmOptions
    Str_WizOptions_Caption = "��������� ���������"
    Str_WizOptions_InfoOptions = "����� ����� � ������"
    Str_WizOptions_NewProjectName = "��� ����� ������ �������"
    Str_WizOptions_BuildPool = "����� ������"
    Str_WizOptions_OpenedProjects = "����� ��������"
    Str_WizOptions_SaveLastBuild = "���� ���������� �����"
    Str_WizOptions_Language = "���� ����������"
    Str_WizOptions_ArchivesDir = "����� �������"
    Str_WizOptions_ArchivesExt = "���������� �������"
    Str_WizOptions_Pk3Prefix = "������� Pk3-�������"
    Str_WizOptions_Pk3Ext = "���������� Pk3-�������"
    Str_WizOptions_ModelPathPrefix = "������� ���� �������"
    Str_WizOptions_InfoUtils = "��������������/������"
    Str_WizOptions_DPModelPath = "DPModel"
    Str_WizOptions_MD52DPMPath = "MD5toDPM"
    Str_WizOptions_DPMViewPath = "DPM Viewer"
    Str_WizOptions_7zPath = "��������� 7Z"
    Str_WizOptions_ImgConvert = "��������� �������"
    Str_WizOptions_Notes = "�������: ��� ���� � ������ �������������"
    Str_WizOptions_ResetToDefaults = "���. ��������"
    Str_WizOptions_OK = "OK"
    Str_WizOptions_Apply = "���������"
    Str_WizOptions_Cancel = "������"
    Str_WizOptionsMsgBox = "�� �������?"
    Str_WizOptionsMsgBox_Caption = "����� �������� �� �������� �� ���������"
    
    ' frmOpen, frmOpenProgress
    Str_WizOpen_Caption = "�������� ������� ������"
    Str_WizOpen_Info = "�������� ���� �������"
    Str_WizOpen_Open = "&������� >>"
    Str_WizOpenProg_Caption = "���������� ���������"
    Str_WizOpenProg_SubCaption = "��������"
    Str_WizOpenProg_Cancel = "������� [Escape] ��� ������"
    
    ' frmPreview
    Str_WizPreview_Info = "�������� ������ .DPM, ������� ����������� ����������"

    ' frmWizardCreate
    Str_WizCreate_Caption = "�������� ��� ������"
    Str_WizCreate_Option1 = "������� DPM �� ���� ������� Half-Life1/2 SMD"
    Str_WizCreate_Option2 = "�������������� Doom 3 MD5 � DPM"
    
    ' frmWizardSMD
    Str_WizSMD_Caption = "������� DPM �� ���� ������� Half-Life1/2 SMD"
    Str_WizSMD_InfoSource = "���� � ��������� SMD-�������"
    Str_WizSMD_InfoAnimList1 = "������ ����"
    Str_WizSMD_InfoAnimList2 = "������ ���� ��� ���"
    Str_WizSMD_InfoAnimList3 = "��������� - �������� "
    
    ' frmWizardSMDbuild
    Str_WizSMDbuild_Caption = "����� ������ � ��������� ���������"
    Str_WizSMDbuild_InfoAnimList = "������ ����"
    Str_WizSMDbuild_InfoTextureList = "������ �������"
    Str_WizSMDbuild_InfoModel = "����� ������ (������ ����������� \ � �����)"
    Str_WizSMDbuild_InfoFlags = "������"
    Str_WizSMDbuild_ModelName = "���"
    Str_WizSMDbuild_ModelPath = "����"
    Str_WizSMDbuild_ModelOffset = "����."
    Str_WizSMDbuild_ModelRotate = "���."
    Str_WizSMDbuild_ModelScale = "����."
    Str_WizSMDbuild_InfoModelName = "��������� ���������� ��� [���].dpm"
    Str_WizSMDbuild_InfoModelPath = "������ �������� models\ � ������"
    Str_WizSMDbuild_InfoModelOffset = "�������� ��������� ������"
    Str_WizSMDbuild_InfoModelRotate = "�������������� ������� (�������)"
    Str_WizSMDbuild_InfoModelScale = "�������������� ������ (1 = ������� �������)"
    Str_WizSMDbuild_FlagAddSources = "��������� ��������� ������ � �������"
    Str_WizSMDbuild_FlagViewOutput = "���������� ���������� ����������� SMD->DPM"
    Str_WizSMDbuild_SaveProject = "��������� ������ � ������ ��� ������� ����������"
    Str_WizSMDbuild_MakePk3 = "������� .Pk3-���� � �������"
    Str_WizSMDbuild_MakePk3Name = "���"
    Str_WizSMDbuild_MakePk3Compression = "����������"
    
    ' frmWizardSMDbuildDPM
    Str_WizSMDbuildDPM_Caption = "������ DPM"
    Str_WizSMDbuildDPM_PreviewModel = "&������ ������"
    Str_WizSMDbuildDPM_Rebuild = "&�����������"
    Str_WizSMDbuildDPM_StopBuild = "&�������"
    Str_WizSMDbuildDPM_OpenBuildDir = "&������� ����� ������"
    Str_WizSMDbuildDPM_MainMenu = "&������� ����"
    Str_WizSMDbuildDPM_Init = "�������������..."
    Str_WizSMDbuildDPM_InitError = "����������� ������: ����� ������ ������. ���������, �� �������� �� ������� ������ � �� �������� �� � ������ ������ ��������."
    Str_WizSMDbuildDPM_CheckTools = "�������� ����������� ������..."
    Str_WizSMDbuildDPM_CopySrcFiles = "����������� �������� ������..."
    Str_WizSMDbuildDPM_CopyTextures = "����������� �������..."
    Str_WizSMDbuildDPM_CopyTextureLayers = "����������� �������������� ������� (norm, gloss, glow � �.�.)..."
    Str_WizSMDbuildDPM_CopyTexturesError = "������: ���� �� ������"
    Str_WizSMDbuildDPM_CreateSkin = "�������� .skin-�������.."
    Str_WizSMDbuildDPM_Created = "������"
    Str_WizSMDbuildDPM_SaveProject = "���������� ������� ������..."
    Str_WizSMDbuildDPM_Saved = "��������"
    Str_WizSMDbuildDPM_GenScript = "�������� ������� ������..."
    Str_WizSMDbuildDPM_Building = "������..."
    Str_WizSMDbuildDPM_BatchWritten = "bat-������ �������� �"
    Str_WizSMDbuildDPM_BatchExecuted = "bat-������ �������."
    Str_WizSMDbuildDPM_BuildingInProgress = "������ ��������..."
    Str_WizSMDbuildDPM_BuildComplete = "������ ���������:"
    Str_WizSMDbuildDPM_Path = "���� "
    Str_WizSMDbuildDPM_ModelPath = "���� � ������"
    Str_WizSMDbuildDPM_CreatePk3 = "�������� .pk3-�����..."
    Str_WizSMDbuildDPM_UsingPrefix = "�������"
    Str_WizSMDbuildDPM_UsingCompression = "����������"
    Str_WizSMDbuildDPM_Create7ZFileConfMsgbox = "���� � ����� ������ ��� ����������, �� ������ ������������ ����� ���� ������ ����?"
    Str_WizSMDbuildDPM_Create7ZFileConfMsgboxCap = "�������� ���� ������"
    Str_WizSMDbuildDPM_Create7ZFileConfNewName = "������� ��� ��������� ����� " & Chr(13) & Chr(10) & " " & Chr(13) & Chr(10) & " ��� ����� �� ����� ��������� ��������� �������: \ / : *, ? '' < > |" & Chr(13) & Chr(10) & " " & Chr(13) & Chr(10) & "�� ��������� ��������� �������� ��������� ��������� ��� �����"
    Str_WizSMDbuildDPM_Create7ZFileConfNewNameCap = "����� ��� ��������� �����"
    Str_WizSMDbuildDPM_Create7ZFileConfNameError = "�� ����� �������� ���, ���������� ���"
    Str_WizSMDbuildDPM_Create7ZFileConfNameErrorCap = "������"

    ' clsBuild module
    Str_clsBuild_Tab = "    "
    Str_clsBuild_Warning = "��������"
    Str_clsBuild_RunTimeError = "������ ���������"
    Str_clsBuild_DelDirTreeErr = " DelDirTree: "
    Str_clsBuild_DelDirTreeErr1 = " DelDirTree: ���������� ������� �������� �����"
    Str_clsBuild_StartBuildProc = "����� �������� ������"
    Str_clsBuild_ShutdownBuild = "�������."
    Str_clsBuild_StopBuild = "������ ��������."
    Str_clsBuild_BasePath = "������� ����"
    Str_clsBuild_UseDir = "���� ������"
    Str_clsBuild_UsePathError1 = "������: ���������� �������� ������ � ���� ������"
    Str_clsBuild_UsePathError2 = "."
    Str_clsBuild_UsePathReason = "�������: ������ ���������"
    Str_clsBuild_CreatePath = "������� ����"
    Str_clsBuild_CreatePathError = "������: ���������� ������� ����"
    Str_clsBuild_Check = "��������"
    Str_clsBuild_CheckError = "������: n����������� ���� �� ������."
    Str_clsBuild_CheckNotFound = "�� ������."
    Str_clsBuild_CheckFound = "������."
    Str_clsBuild_CheckRuntimeError = "������: ������ ���������"
    Str_clsBuild_AddFile = "����"
    Str_clsBuild_AddDone = "���������."
    Str_clsBuild_AddNotFound = "�� ������."
    Str_clsBuild_AddError = "������: ���������� �������� ����������� ����."
    Str_clsBuild_AddWarning1 = "��������: ������ ���������"
    Str_clsBuild_AddWarning2 = "��������: ���������� ����������� ���� � �������� ����"
    Str_clsBuild_AddReason = "�������: ������ ���������"
End Sub
