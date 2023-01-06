function love.load()
    require('tiles')

    --window size to fullscreen and get windowWidth, windowHeight
    love.window.setMode(0,0,{fullscreen= true})
    windowWidth, windowHeight = love.window.getMode()

    --these are the default values, don't have to be defined, you can change if you want
    tilesDefinitions.tilesInWidth = 40
    tilesDefinitions.tilesInHeight = 25
    tilesDefinitions.aspectRatioWidth = 4
    tilesDefinitions.aspectRatioHeight = 3

    --call this function to ajust game resolution to best fit current window size
    gameResolutioninWindow(windowWidth, windowHeight)    
end

function love.draw()
    for yPosition = 0, tilesDefinitions.tilesInHeight - 1, 1 do
        for xPosition = 0, tilesDefinitions.tilesInWidth - 1, 1 do
            drawTile(tiles.colorTest, xPosition, yPosition)
        end
    end
end