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

    public function placeEntities()
    {
        var entities = this.mapData.layers[2];

        //trace(entities.objects[0]);

        //for(object in entities.objects)
        //{
            //trace(object);
        //}

    }

    public function getPlayerEntityPosition() : FlxPoint
    {
        var playerEntity = this.mapData.layers[2].objects[0];
        return new FlxPoint(playerEntity.x, playerEntity.y);
    }

}
