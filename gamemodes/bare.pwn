#include <a_samp>
#include	<sscanf2>

main()
{
	print("\n/*-----------------------------------*\\");
	print("|*=====[TS Base GameMode Loaded]=====*|");
	print("\\*-----------------------------------*/\n");
}

new bool:JustConnected[MAX_PLAYERS];

#define COLOR_WHITE						0xFFFFFFFF

public OnPlayerRequestClass(playerid, classid)
{
	TogglePlayerSpectating(playerid, true);
	if(JustConnected[playerid])
	{
		JustConnected[playerid] = false;
		SetTimerEx("OnPlayerRequestClass", 100, false, "ii", playerid, classid);
	}
	else
	{
		TogglePlayerSpectating(playerid, false);
		SpawnPlayer(playerid);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid,"~r~T~w~exture ~r~S~w~tudio ~b~1.9~g~d",5000,5);
	JustConnected[playerid] = true;
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText("TS 1.9d");
	UsePlayerPedAnims();

	AddPlayerClass(265,1322.1832,1564.2081,10.8203,300.1425,0,0,0,0,-1,-1);
	//AddPlayerClass(265,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,-1,-1);

	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!strcmp("/gopos", cmdtext))
	{
		new
			interiorID,
			Float: coordinates[3];

		if(sscanf(params, "fffd", coordinates[0], coordinates[1], coordinates[2], interiorID))
		{
			SendClientMessage(playerid , COLOR_WHITE,"/gopos [x] [y] [z] [interior]");
		}
		else
		{
			SetPlayerInterior(playerid, interiorID);
			SetPlayerPos(playerid, coordinates[0], coordinates[1], coordinates[2]);
		}

		return 1;
	}
	return 1;
}