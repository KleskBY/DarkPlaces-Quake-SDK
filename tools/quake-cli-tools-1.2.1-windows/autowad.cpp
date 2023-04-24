#include <stdio.h>
#include <Windows.h>
#include <string.h>
#include <errno.h>
#define _GNU_SOURCE
#include <stdlib.h>

#include "empty.h"

#ifndef MAX_PATH
#define MAX_PATH 256
#endif

bool Exists(char* path)
{
	FILE *file;
    if ((file = fopen(path, "rt")))
    {
        fclose(file);
        return true;
    }
    return false;
}

int main(int args, char *argv[])
{
	if(args < 3)
	{
		puts("ERROR: Not enough arguments.");
		system("pause");
		return 1;
	}

	for(int i = 0; i < strlen(argv[1]); i++) if(argv[1][i] == '/') argv[1][i] = '\\';
	for(int i = 0; i < strlen(argv[2]); i++) if(argv[2][i] == '/') argv[2][i] = '\\';
	
	char* exeName = (char*)malloc(MAX_PATH);
	memset(exeName, 0 , MAX_PATH);
	strcpy(exeName, argv[0]);
	while(strstr(exeName + 1, "\\")) exeName = strstr(exeName + 1, "\\") + 1;
	puts(exeName);
	
	char* workingDir = (char*)malloc(MAX_PATH);
	memset(workingDir, 0 , MAX_PATH);
	strcpy(workingDir, argv[0]);
	workingDir[strlen(workingDir) - strlen(exeName)] = '\0';
	puts(workingDir);
	
	char* texturesDir = (char*)malloc(MAX_PATH);
	memset(texturesDir, 0 , MAX_PATH);
	char* texturesPath = argv[1];
	if(texturesPath[strlen(texturesPath)] == '\\')
	{
		texturesDir = strcat(texturesDir, argv[1]);
		texturesPath = strcat(texturesPath, "*");
	}
	else 
	{
		texturesDir = strcpy(texturesDir, argv[1]);
		texturesDir = strcat(texturesDir, "\\");
		texturesPath = strcat(texturesPath, "\\*");
	}
	puts(texturesPath);
	
	char* mapPath = argv[2];
	puts(mapPath);
	
	char* mapName = (char*)malloc(MAX_PATH);
	memset(mapName, 0 , MAX_PATH);
	strcpy(mapName, mapPath);
	while(strstr(mapName + 1, "\\")) 
	{
		mapName = strstr(mapName + 1, "\\");
	};
	mapName = strtok(mapName, ".");
	puts(mapName);
	
	
	//Map output dir
	char* mapDir = (char*)malloc(MAX_PATH);
	memset(mapDir, 0 , MAX_PATH);
	memcpy(mapDir, mapPath, strstr(mapPath, mapName) - mapPath);//strtok(mapPath, mapName);
	
	//DELETEING OLD WAD IF EXISTS
	char* wadName;
	wadName = strcat(mapName, ".wad");
	wadName = strcat(mapDir, mapName);
	FILE *file;
    if ((file = fopen(wadName, "rt")))
    {
        fclose(file);
        remove(wadName);
    }
    puts(wadName);
	
	
	//WRITING EMPTY WAD TO DISK
	FILE * wad = fopen(wadName, "wb");
	if(wad == NULL)
	{
		printf("ERROR: Can't write %s.\r\n", wadName);
		puts(strerror(errno));
		system("pause");
		return 1;
	}
	fwrite(empty, sizeof(empty), 1, wad);
	fclose(wad);
	
	//Getting list of materials
	FILE * map =  fopen(mapPath, "rt");
	if(map == NULL)
	{
		printf("ERROR: File %s cannot be opened.\r\n", mapPath);
		puts(strerror (errno));
		system("pause");
		return 1;
	}
	
	char* goodMaterials = (char*)malloc(10240);
	memset(goodMaterials, 0 , 10240);
	char line[1024];
	while((fgets(line, sizeof(line), map)) != NULL)
	{
		if(line[0] == '(')
		{
			char* material;
			if(material = strstr(line, ")") + 1) 
			{
				if(material = strstr(material, ")") + 1) 
				{
					if(material = strstr(material, ")") + 2) 
					{
						if(strtok(material, " "))
						{
							if(!strstr(goodMaterials, material))
							{
								for(int z = 0; z < strlen(material); z++) if(material[z] == '/') material[z] = '\\';

								char* basePath = (char*)malloc(MAX_PATH);
								memset(basePath, 0, MAX_PATH);
								strcat(basePath, texturesDir);
								strcat(basePath, material);
								

								
								char* possiblePath = (char*)malloc(MAX_PATH);
								memset(possiblePath, 0, MAX_PATH);
								strcat(possiblePath, basePath);
								strcat(possiblePath, ".jpg");
								if(!Exists(possiblePath))
								{
									possiblePath[strlen(possiblePath) - 4] = '\0';
									strcat(possiblePath, ".tga");
								}
								if(!Exists(possiblePath))
								{
									possiblePath[strlen(possiblePath) - 4] = '\0';
									strcat(possiblePath, ".png");
								}
								if(!Exists(possiblePath))
								{
									possiblePath[strlen(possiblePath) - 4] = '\0';
									strcat(possiblePath, ".tif");
								}
								
								char cmd[MAX_PATH] = "wad.exe ";
								memset(cmd, 0, MAX_PATH);
								strcat (cmd, workingDir);
								strcat (cmd, "wad.exe ");
								strcat (cmd, wadName);
								strcat (cmd, " ");
								strcat (cmd, possiblePath);
								strcat (cmd, "\n");
								puts(cmd);
								system(cmd);
								
								{
									int i = strlen(material);
									material[i] = '\n';
									material[i + 1] = '\0';
									goodMaterials = strcat(goodMaterials, material);
								}
							}
						}
					}
				}
			}
		}
	}
	printf("Good mats: %s\n", goodMaterials);
	fclose(map);
	
	//Looking for needed materials 	
	/*
	WIN32_FIND_DATA data;
    HANDLE hFind = FindFirstFile(texturesPath, &data);      // DIRECTORY
    if (hFind != INVALID_HANDLE_VALUE) 
	{
        do 
		{
			if(data.cFileName[0] == '.') continue;
			char filename[MAX_PATH];
			for(int i = 0; i < strlen(data.cFileName); i++) 
			{
				data.cFileName[i] = tolower(data.cFileName[i]);
				filename[i] = data.cFileName[i];
			}
			filename[strlen(data.cFileName)] = '\0';
			if(!strstr(data.cFileName, "_norm") && !strstr(data.cFileName, "_gloss") && !strstr(data.cFileName, ".meta") && !strstr(data.cFileName, "_disp") &&  !strstr(data.cFileName, "_occ") && !strstr(data.cFileName, "_ao") &&  !strstr(data.cFileName, "_height") &&  !strstr(data.cFileName, "_mask") && !strstr(data.cFileName, "_rough") && !strstr(data.cFileName, "_metal")) 
			{
				strtok(data.cFileName, ".");
				if(strstr(goodMaterials, data.cFileName))
				{
					char cmd[MAX_PATH] = "wad.exe ";
					memset(cmd, 0, MAX_PATH);
					strcat (cmd, workingDir);
					strcat (cmd, "wad.exe ");
					strcat (cmd, wadName);
					strcat (cmd, " ");
					strcat (cmd, texturesDir);
					strcat (cmd, filename);
					strcat (cmd, "\n");
					puts(cmd);
					system(cmd);
            	}
        	}
        } 
		while (FindNextFile(hFind, &data));
        FindClose(hFind);
    }
    else
    {
    	printf("ERROR: Invalid path %s", texturesPath);
    	system("pause");
    	return 1;
	}
	*/
	
	char cmd[MAX_PATH] = "";
	strcat (cmd, workingDir);
	strcat (cmd, "defullbright.exe ");
	strcat (cmd, wadName);
	strcat (cmd, "\n");
	system(cmd);
	system("pause");

	return 0;
}