# love2d-tiles-engine
 
I countend in this old DOS game printscreen 40x25 (WxH) tiles. This would result in an 8:5 aspect ratio if tiles we're squares.

In old DOS games pixels we're vertically streched to fit 4:3 (8:6) aspect ratio. The image I counted was 1600x1200 pixels resulting in each tile with size of 40x48 pixels.

Each tile is 8x8 in game pixels, so each in game pixel corresponds to 5x6 image pixels. I never knew pixels we're vertically streched in DOS games before this.

You can use this simple code to define how many tiles your game should have in width and height, also which aspect ratio it should be.
The tiles will be displayed in the best aproximation possible to a given window size.

In tiles.lua you can define colors and tiles to use.

In main.lua there is a simple usage example.

https://www.neogaf.com/threads/ms-dos-games-and-aspect-ratio.1108226/

