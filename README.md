# GunGame Mod for Counter-Strike 1.6

## What is this?
GunGame is one of most dynamic modifications in terms of gameplay. In this it is similar to CSDM mod, which uses a similar game mechanic:
- purchase menu is not available;
- money is not given out;
- weapon cannot be thrown away and it disappears after death of the owner.

In the GunGame modification, players are respawned with a weapon corresponding to their level and a knife. For killing enemy, player is awarded a new level, and with it a weapon. By default, knife - is last weapon you can get. Winner will be player who is the first to commit murders with a knife (in team mode, team that was this player in wins).
 
## Composition of the modification
`regg_core` - basis of modification <br>
`regg_balancer` - plugin allows you to control the balance of teams <br>
`regg_controller` - control of game modes (single, team, FFA) <br>
`regg_informer` - displays the current level of player or team, as well as weapons and number of points <br>
`regg_leader` - displays current leader of game <br>
`regg_map_cleaner` - clearing maps from unnecessary entities <br>
`regg_notify` - notification plugin <br>
`regg_warmup` - warmup mode before starting main mode <br>
`regg_show_winner` - shows winner at end of game

Requirements
=============
- [ReHLDS](https://github.com/dreamstalker/rehlds/) 3.8.0.702 or higher
- [ReGameDLL_CS](https://github.com/s1lentq/ReGameDLL_CS/) 5.19.0.490 or higher
- Metamod-r (or Metamod-P)
- [AMX Mod X](https://github.com/alliedmodders/amxmodx/) 1.9.0 or higher
- [ReAPI](https://github.com/s1lentq/reapi) 5.18.0.205 or higher
* Tip: Recommend using the latest versions.

Installation
=============

- Compile `*.sma` files
- Move compiled files `*.amxx` to `amxmodx/plugins/`
- Copy `configs/*.*` files to `amxmodx/configs` directory
