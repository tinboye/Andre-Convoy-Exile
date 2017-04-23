# Andre-Convoy-Exile
Andre Convoy Ported over from Epoch

Modified from https://epochmod.com/forum/topic/34352-release-andre-convoy-patrol/
With Exile objects.

Donnovan has given me permission to port this over from his epoch version. Full credit goes to him for making this amazing script.

There are some issues within exile where the soldiers do not fire back at players. Donnovan has looked through the script and does not see any reason why this is the case either. So if anyone has a solution, please post bug fixes or do a pull request and I will update the code.

# Installation

-add the andre_convoy folder to your Exile.mapname.pbo
-if init.sqf exists add
    ```execVM "andre_convoy\andre_convoy.sqf";```
-Edit andre_convoy\andre_convoy.sqf and set your convoy settings.

-You will see ```_spawns = [```
  If you want to customize where convoys spawn for a map that is not in the file then add your own coordinates.
  just follow the pattern of arrays
 
```,
		//MapName (5)
		[
			[[vehicle spawn position],[nothing],spawn angle,spawn radius]
		]```

