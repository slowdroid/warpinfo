# Warp Info Panel (WIP)

## About

Adds a warp info widget that – unlike the default one – continuously updates the amount of warp cells needed. Comes in handy when partially slowboating a route.

This is still very much work in progress. Might not always show the correct cell amount. Rest assured though, the amount of warp cells actually used when warping can't be influenced by lua scripts and will stay the same.

![screenshot of panel](https://slow.re/du/imgs/warpinfo.jpg)

## Installation

Can be run on a control seat or programming board. I recommend a programming board because it's easier to install and won't get overwritten, eg. when updating the HUD script.

### copypasta the conf file to a separate prorgamming board
1) open the raw version of the config.json file, select all and copy it to clipboard
2) right click the programming board; paste lua configuration
3) go into build mode; select the linking tool; right click on the control unit; select an out plug to link to; link the corresponding slot of the programming board to the core and the warp drive
4) how to go about hiding the default warp widget depends on the flight/hud script used; try searching the lua code for "warpdrive.show()" (the slot might be named differently depending on your script) and comment it out by adding two dashes "--" in front of it

### manually adding lua code to an existing control seat (that already has a lua script loaded)
1) right click on the control seat; edit lua script
2) add a new filter "start()"; copypasta the content of the matching file into the new filter
3) add a new filter "tick(warpInfo)"; copypasta the content of the matching file into the new filter
4) make sure the slot naming and linking is coherent
5) how to go about hiding the default warp widget depends on the flight script used; try searching the lua code for "warpdrive.show()" and comment it out by adding to dashes "--" in front of it

## Usage
* I recommend activating the programming board after entering the seat, as the ships weight and some info from the warp drive are only updated when entering a control seat.
* use alt + j to activate warp
