package tilemap;

import sys.io.File;
import haxe.Json;
import openfl.utils.Assets;
import flixel.tile.FlxTilemap;
import flixel.math.FlxPoint;

/**
  Load and parse a Tiled tilemap from a JSON file.
 */
class Tilemap
{
    public  var mapData    :Dynamic;
    public  var background :FlxTilemap;
    public  var walls      :FlxTilemap;
    public  var pickups    :FlxTilemap;
    private var tileSize   :Int;

    public function new(jsonFile : String, tilesetImage:String, tileSize : Int = 16)
    {
        this.mapData    = Json.parse(Assets.getText('assets/data/${jsonFile}'));
        this.background = new FlxTilemap();
        this.walls      = new FlxTilemap();
        this.pickups    = new FlxTilemap();

        background.loadMapFromArray(mapData.layers[0].data, mapData.width, mapData.height, 'assets/images/${tilesetImage}', tileSize,tileSize, null, 1);
        walls.loadMapFromArray(mapData.layers[1].data, mapData.width, mapData.height, 'assets/images/${tilesetImage}', tileSize,tileSize, null, 1);
        pickups.loadMapFromArray(mapData.layers[2].data, mapData.width, mapData.height, 'assets/images/${tilesetImage}', tileSize,tileSize, null, 1);
    }

    public function doorCoinPosition() : FlxPoint
    {
        var doorCoin = this.mapData.layers[3].objects[1];
        return new FlxPoint(doorCoin.x, doorCoin.y);
    }

    public function getPlayerEntityPosition() : FlxPoint
    {
        var playerEntity = this.mapData.layers[3].objects[0];
        //trace(playerEntity);
        trace(Type.getClass(playerEntity));
        return new FlxPoint(0,0);
    }

}
