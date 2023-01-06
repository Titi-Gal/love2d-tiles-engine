# love2d-tiles-engine
 
I countend in this old DOS game printscreen 40x25 (WxH) tiles. This would result in an 8:5 aspect ratio if tiles we're squares.
In old DOS games pixels we're vertically streched to fit 4:3 (8:6) aspect ratio, in the printscreen I counted the image resolution is 1600x1200 resulting in each tile with size of 40x48 image pixels.
Each tile is 8x8 in the game, so each in game pixel corresponds to 5x6 of the image pixel.
I never knew pixels we're vertically streched in DOS games before this.

In this simple code you can define how many tiles your game should have in width/height and in which aspect ratio it should be displayed.

In tiles.lua you can define colors and tiles to use.
In main.lua there is a simple usage example.

https://www.neogaf.com/threads/ms-dos-games-and-aspect-ratio.1108226/

