Fog of War (v 2.01)
===

This script adds "fog of war" to maps. A map specified as having fog of war has tiles that are (fully or partially) obscured until the player gets within visual range. The amount of fog of war to disappear as the player moves depends on the visual range specified. Gamers with experience playing Real Time Strategy games like Warcraft, Age of Empires, etc. should be quite familiar with the concept.

This script supports two kinds of fog of war: static and dynamic.

Static fog of war is the kind that typically hides terrain in RTS games. It covers the entire map until the player explores the area, discovering the underlying terrain. Once static fog of war disappears from an area of the map, it stays gone indefinitely (even if loading a saved game, leaving the map and returning later, going to the menu, etc).

Dynamic fog of war is identical to the static kind except that it doesn't stay gone forever: as soon as the player leaves visual range of an explored tile, dynamic fog of war covers it again. This kind is typically used to hide enemy units in RTS games.

![Fog of war screenshot](http://s88387243.onlinehome.us/rmxp/fog_of_war/fog_of_war.jpg)

Features
---

* both types of fog of war supported
* customizable view range
* customizable fog autotile (plug in your own if you wish)
* doesn't take up any tileset or autotile slots
* handles move events (jumping, speed)
* works with [Cogwheel's Pixel Movement script](http://members.jcom.home.ne.jp/cogwheel/script/move.txt)
* persists between saves, teleports, etc.
* customizable opacity
* can be turned on and off dynamically

Note: I've taken great pains to optimize this script as much as possible (which unfortunately reduces the readability of the code). There shouldn't be much visible effect on frame rate.

Demo
---
See `demo` directory. Requires RMXP, of course.


Installation
---
Copy the script in `src`, and open the Script Editor within RMXP. At the bottom of the list of classes on the left side of the new window, you'll see one called "Main". Right click on it and select "Insert". In the newly created entry in the list, paste this script.

Finally, copy `lib/dynamic-maps.rb` below this script. 

Usage
---

There's no need to add the autotile via the database. Just place the file in the autotile folder, import it, and change the FOW_AT_NAME constant to the appropriate filename. To change the colour of the fog of war you must create a new autotile. (However, opacity is customizable by constants below.)
 
To indicate a map is to have either (or both) of these kinds of fog of war, include `<fow>` in its name (via "Map properties"). To enable both static and dynamic fow, you can either add nothing more (since it's the default), or add `<s><d>` (or `<d><s>`). To enable one or the other, just add the appropriate one (e.g. `<s>` for static, `<d>` for dynamic). You may also optionally specify a visual range between 0 and 9 in the map name (e.g. `<5>`), noting that 3 is  the default.

Here are some example map names:

* `your-map-name <fow><2>` (defaults to static &amp; dynamic on; range specified as 2)
* `your-map-name <fow><s>` (only static fow is on; range defaults to 3)
* `your-map-name <fow><d><8>` (only dynamic fow is on; range specified as 8)
 
Alternatively, fog of war can be setup via a call script event command using the fog_of_war global method. Detailed instructions are just before the method itself.

The ranges work as follows:

```
 range = 0 reveals just the square on which the player stands

 range = 1 is the same as range 0 plus four adjacent tiles
 i.e.   @
       @P@
        @

 range = 2 is the same as range 1 plus eight additional tiles
  i.e.  @
       @@@
      @@P@@
       @@@
        @

 range = 3 (default) is the same as range 2 plus twelve additional tiles
  i.e.  @
       @@@
      @@@@@
     @@@P@@@
      @@@@@
       @@@
        @

 etc.
```


