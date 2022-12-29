function love.load()
    
    -----------------display, aspectratio, resolution stuff-----------------
    --[[
        I countend in this old DOS game printscreen 40x25 (WxH) tiles, each tile with 8 pixels
        This would result in an 8:5 aspect ratio if tiles we're squares.
        Pixels we're vertically streched to fit 4:3 (8:6) aspect ratio. in the printscreen 1600:1200 resolution pixels are 40x48
        I never knew pixels we're vertically streched before this
        https://www.neogaf.com/threads/ms-dos-games-and-aspect-ratio.1108226/
    --]]

    --original scale in pixels and aspectratio to display
    pixelsInTileWidth = 8
    pixelsInTileHeight = 8
    tilesInWidth = 40
    tilesInHeight = 25
    aspectRatioWidth = 4
    aspectRatioHeight = 3

    --game in fullscreen and width and height of display
    love.window.setMode(0,0,{fullscreen= true})
    displayWidth, displayHeight = love.window.getMode()

    --make best defined aspect ratio aproximation of current display resolution
    widthCentralization = 0
    heightCentralization = 0
    gameDisplayWidth = displayWidth
    gameDisplayHeight = displayHeight
    if displayWidth / displayHeight > aspectRatioWidth / aspectRatioHeight then
        gameDisplayWidth = displayHeight * aspectRatioWidth / aspectRatioHeight
        widthCentralization = (displayWidth - gameDisplayWidth) / 2

    elseif displayWidth / displayHeight < aspectRatioWidth / aspectRatioHeight then
        gameDisplayHeight = displayWidth * aspectRatioHeight / aspectRatioWidth
        heightCentralization = (displayHeight - gameDisplayHeight) / 2
    end
    
    --the exact pixels and tiles is streched to fit a defined aspect ratio aproximation in any resolution and aspect ratio
    titleScaledWidthPx = gameDisplayWidth / tilesInWidth
    titleScaledHeightPx = gameDisplayHeight / tilesInHeight
    pixelScaledWidthPx = titleScaledWidthPx / pixelsInTileWidth
    pixelScaledHeightPx = titleScaledHeightPx / pixelsInTileHeight

    -----------------tiles avaliable-----------------
    require('tiles')

    
    -----------------level logic-----------------
    cycles = diagonalsCycles(6)
    userPath = {0, 2, 5, 1}
    highlightedCycle = 2

end

function love.draw()
end

function drawTile(tile, xLeft, yTop)
    for  yPixel, row in ipairs(tile) do
        for xPixel, isToDraw in ipairs(row) do
            if isToDraw == 1 then
                love.graphics.rectangle('fill',
                    (xLeft * titleScaledWidthPx) + (pixelScaledWidthPx * (xPixel - 1) + widthCentralization),
                    (yTop * titleScaledHeightPx) + (pixelScaledHeightPx * (yPixel - 1) + heightCentralization),
                    pixelScaledWidthPx, pixelScaledHeightPx)
            end
        end
    end
end