# Why?
	We want to be able to reliably identify what has been changed, and what needs to be updated.
	By keeping a list of all the files that need to be deployed into a fresh Avorion install, as well as 'merged'
	files such as server/server.lua, we can easily and reliably do this.

# How
	## installation
	Copy over all files from the Avorion folder to a fresh Avorion install's Avorion folder.

	## Updating mods
	### new mods
	* Simply add all new files to the file structure.
	* If files are already present, run a comparison, or find out what needs to happen.
	* Check to see what vanilla files need modified, e.g. /server/server.lua

	## existing Mods
	* Check mod log history/version history for compatibility notes for upgrading
	* copy over new files
	* verify no stale files are present (e.g. did mod remove or rename some of its files?)
	* Verify the registration prodcedure hasnt changed

# Current mods
 The XeroSpace Advanced Server is running the following Mods:

## Third party mods; developed by others, repective licenses and copyright apply:

 * [Unique Xsotan Artifacts](https://www.avorion.net/forum/index.php?topic=1918.0)
 * ~[Bigger Threats](https://www.avorion.net/forum/index.php/topic,3936.msg22279.html#msg22279)~ outdated, [fixed here](https://github.com/Joeppie/AvorionModFixes/tree/master/BetterThreats_v1.1)
 * [Out of Sector Production](https://www.avorion.net/forum/index.php?topic=1322.0)
 * [ShipScriptLoader](http://www.avorion.net/forum/index.php/topic,3918.0.html)
 * [Carrier Commander](http://www.avorion.net/forum/index.php/topic,4268.0.html)
 * [LogLevels](https://github.com/dirtyredz/LogLevels)

 ## [EndlessExpanse]() Mods written specially for XeroSpaceAdvanced
 * - SupplyAndDemand - ResourceDepots regenerate/degenerate the appropriate resources.
 * - ACCESS - modified spawns for better availability of resources.
 * - WIP/unnamed concept - Daemon process that re-generates hidden sectors.
