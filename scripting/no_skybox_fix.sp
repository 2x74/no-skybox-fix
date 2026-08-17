#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

#define SKY_MATERIAL "black"

public Plugin myinfo =
{
    name        = "No Skybox Fix",
    author      = "luna",
    description = "Forces a solid black skybox on maps that ship without one (fixes sky 'hall of mirrors' bug)",
    version     = "1.3",
    url         = "https://angelgirl.cloud"
};

ConVar g_cvEnabled;

public void OnPluginStart()
{
    g_cvEnabled = CreateConVar("sm_noskybox_enabled", "1", "1 = force black skybox on every map, 0 = disabled", FCVAR_NOTIFY);
    RegAdminCmd("sm_forceblacksky", Command_ForceBlackSky, ADMFLAG_CONFIG, "Force black skybox right now");
    AutoExecConfig(true, "no_skybox_fix");
}

public void OnMapStart()
{
    AddFileToDownloadsTable("materials/skybox/blackbk.vmt");
    AddFileToDownloadsTable("materials/skybox/blackdn.vmt");
    AddFileToDownloadsTable("materials/skybox/blackft.vmt");
    AddFileToDownloadsTable("materials/skybox/blacklf.vmt");
    AddFileToDownloadsTable("materials/skybox/blackrt.vmt");
    AddFileToDownloadsTable("materials/skybox/blackup.vmt");

    if (g_cvEnabled.BoolValue)
    {
        ApplyBlackSky();
    }
}

void ApplyBlackSky()
{
    ConVar skyname = FindConVar("sv_skyname");
    if (skyname != null)
    {
        skyname.SetString(SKY_MATERIAL);
        PrintToServer("[No Skybox Fix] sv_skyname set to '%s'.", SKY_MATERIAL);
    }
}

public Action Command_ForceBlackSky(int client, int args)
{
    ApplyBlackSky();
    ReplyToCommand(client, "[SM] sv_skyname forced to '%s'.", SKY_MATERIAL);
    return Plugin_Handled;
}
