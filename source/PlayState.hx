package;

import flixel.FlxG;
import flixel.FlxState;
import Player;
import tilemap.Tilemap;

class PlayState extends FlxState
{
    var text   : flixel.text.FlxText;
    var player : Player;
    var map    : Tilemap;

    override public function create()
    {
        super.create();

        this.text = new flixel.text.FlxText(0, 0, 0, "Initalizing...", 64);
        this.text.screenCenter();
        add(this.text);

        this.map = new Tilemap("TestTilemap.json", "TileImage.png");
        this.map.background.screenCenter();
        this.map.walls.screenCenter();
        add(this.map.background);
        add(this.map.walls);

        this.player = new Player();
        this.player.setCameraFollow();
        add(this.player);

    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        player.update(elapsed);

        // Basic collision check for player on walls!
        FlxG.collide(this.player, this.map.walls);

    }
}
