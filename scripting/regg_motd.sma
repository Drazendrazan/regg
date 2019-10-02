#pragma semicolon 1

#include <amxmodx>
#include <reapi>
#include "include/regg.inc"

#if !defined MAX_MAPNAME_LENGTH
	#define MAX_MAPNAME_LENGTH 64
#endif

new const STYLES_URL[] = "http://localhost/regungame.css";

public plugin_init() {
	register_plugin("[ReAPI] GunGame MOTD", "0.1.0-alpha", "F@nt0M");
}

public ReGG_FinishPost(const killer, const victim) {
	showMotd(killer, victim);
}

showMotd(const winner, const looser) {
	new motd[MAX_MOTD_LENGTH], len = 0;

	new nextMap[MAX_MAPNAME_LENGTH];
	// get_cvar_string("amx_nextmap", nextMap, charsmax(nextMap));
	
	new winnerClassName[3], looserClassName[3];
	getTeamClassname(winner, winnerClassName, charsmax(winnerClassName));
	getTeamClassname(looser, looserClassName, charsmax(looserClassName));
	
	len = formatex(
		motd, charsmax(motd), 
		"<!DOCTYPE html>^n<html><head><meta charset=^"utf-8^"><link rel=^"stylesheet^" href=^"%s^"></head>",
		STYLES_URL
	);

	len += formatex(motd[len], charsmax(motd) - len, "<body><h3>[GUNGAME]</h3>");

	len += formatex(
		motd[len], charsmax(motd) - len,
		"<hr class=^"%s^"><div class=^"%s^"><span class=^"name^">%n</span> победил!</div>",
		winnerClassName, winnerClassName, winner
	);
	
	len += formatex(
		motd[len], charsmax(motd) - len,
		"<hr class=^"%s^"><div class=^"%s^">Последним был убит: <span class=^"name^">%n</span></div>",
		winnerClassName, looserClassName, looser
	);
	
	len += formatex(
		motd[len], charsmax(motd) - len,
		"<hr class=^"%s^"><div>Следующая карта: <span class=^"map^">%s</span></div></body></html>",
		winnerClassName, nextMap
	);

	new players[MAX_PLAYERS], num;
	get_players(players, num, "ch");
	for (new i = 0; i < num; i++) {
		show_motd(players[i], motd, "GunGame");
	}
}

getTeamClassname(const id, buffer[], const len) {
	switch (TeamName:get_member(id, m_iTeam)) {
		case TEAM_TERRORIST: return copy(buffer, len, "tt");
		case TEAM_CT: return copy(buffer, len, "tt");
	}
	return 0;
}