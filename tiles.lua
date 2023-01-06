--tiles types, each tile is 8x8 in game pixels, this has to corresponde with tilesDefinitions.pixelsInTileWidth and tilesDefinitions.pixelsInTileHeight
tiles = {
    dontDraw = {
        {0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0},
    },
    box = {
        {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'},
        {'w', 0, 0, 0, 0, 0, 0, 'w'},
        {'w', 0, 0, 0, 0, 0, 0, 'w'},
        {'w', 0, 0, 0, 0, 0, 0, 'w'},
        {'w', 0, 0, 0, 0, 0, 0, 'w'},
        {'w', 0, 0, 0, 0, 0, 0, 'w'},
        {'w', 0, 0, 0, 0, 0, 0, 'w'},
        {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'},
    },
    colorTest = {
        {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'},
        {'w', 'r', 'r', 'g', 'g', 'b', 'b', 'w'},
        {'w', 'r', 'r', 'g', 'g', 'b', 'b', 'w'},
        {'w', 'r', 'r', 'g', 'g', 'b', 'b', 'w'},
        {'w', 'r', 'r', 'g', 'g', 'b', 'b', 'w'},
        {'w', 'r', 'r', 'g', 'g', 'b', 'b', 'w'},
        {'w', 'r', 'r', 'g', 'g', 'b', 'b', 'w'},
        {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'},
    },
}

--color types used in tiles pixels, you can change names to numbers to generate and modify tiles through programming 
colors = {
    w = {255, 255, 255, 1},
    r = {255, 0, 0, 1},
    g = {0, 255, 0, 1},
    b = {0, 0, 255, 1},
}

--default game definitions
tilesDefinitions = {
    pixelsInTileWidth = 8,
    pixelsInTileHeight = 8,
    tilesInWidth = 40,
    tilesInHeight = 25,
    aspectRatioWidth = 4,
    aspectRatioHeight = 3,
}

--ajust game to current window size, you have to call this in main with current window size
tilesResolution = {}
function gameResolutioninWindow(windowWidth, windowHeight)
    tilesResolution.widthCenter = 0
    tilesResolution.heightCcenter = 0
    tilesResolution.width = windowWidth
    tilesResolution.height = windowHeight
    --make best aproximation of game aspect ratio to fit in current monitor resolution
    if windowWidth / windowHeight > tilesDefinitions.aspectRatioWidth / tilesDefinitions.aspectRatioHeight then
        tilesResolution.width = windowHeight * tilesDefinitions.aspectRatioWidth / tilesDefinitions.aspectRatioHeight
        tilesResolution.widthCenter = (windowWidth - tilesResolution.width) / 2
    elseif windowWidth / windowHeight < tilesDefinitions.aspectRatioWidth / tilesDefinitions.aspectRatioHeight then
        tilesResolution.height = windowWidth * tilesDefinitions.aspectRatioHeight / tilesDefinitions.aspectRatioWidth
        tilesResolution.heightCcenter = (windowHeight - tilesResolution.height) / 2
    end

    --the exact size of game tile and game tile pixel in monitor pixels
    tilesResolution.tileWidth = tilesResolution.width / tilesDefinitions.tilesInWidth
    tilesResolution.tileHeight = tilesResolution.height / tilesDefinitions.tilesInHeight
    tilesResolution.tilePixelWidth = tilesResolution.tileWidth / tilesDefinitions.pixelsInTileWidth
    tilesResolution.tilePixelHeight = tilesResolution.tileHeight / tilesDefinitions.pixelsInTileHeight
end

--Draw tile, tile type, position in x and with. Position is in number of tiles. Ex. 40 tiles in width xPosition => 0 < 40 
function drawTile(tile, xPosition, yPosition)
    if xPosition < tilesDefinitions.tilesInWidth and yPosition < tilesDefinitions.tilesInHeight then
        for  yTilePixel, row in ipairs(tile) do
            for xTilePixel, tilePixelColorReference in ipairs(row) do
                if tilePixelColorReference ~= 0 then
                    color = colors[tilePixelColorReference]
                    love.graphics.setColor(color[1], color[2], color[3], color[4])
                    love.graphics.rectangle('fill',
                        (xPosition * tilesResolution.tileWidth) + (tilesResolution.tilePixelWidth * (xTilePixel - 1) + tilesResolution.widthCenter),
                        (yPosition * tilesResolution.tileHeight) + (tilesResolution.tilePixelHeight * (yTilePixel - 1) + tilesResolution.heightCcenter),
                        tilesResolution.tilePixelWidth, tilesResolution.tilePixelHeight)
                end
            end
        end
    end
end