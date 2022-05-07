package tilemap;

import sys.io.File;
import haxe.Json;
import openfl.utils.Assets;
import flixel.tile.FlxTilemap;

/**
  Load and parse a Tiled tilemap from a JSON file.
 */
class Tilemap
{
    public var mapData    :Dynamic;
    public var background :FlxTilemap;
    public var walls      :FlxTilemap;

    public function new(jsonFile : String, tilesetImage:String)
    {
        this.mapData     = Json.parse(Assets.getText('assets/data/${jsonFile}'));
        this.background = new FlxTilemap();
        this.walls      = new FlxTilemap();

        background.loadMapFromArray(mapData.layers[0].data, mapData.width, mapData.height, tilesetImage, 16,16, null, 1);
        walls.loadMapFromArray(mapData.layers[1].data, mapData.width, mapData.height, tilesetImage, 16,16, null, 1);
    }

}