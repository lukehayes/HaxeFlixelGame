package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import Player;
import HUD;
import tilemap.Tilemap;

class PlayState extends FlxState
{
    var text   : flixel.text.FlxText;
    var player : Player;
    var map    : Tilemap;
    var coins  : FlxTypedGroup<Coin>;
    var hud    : HUD;

    override public function create()
    {

        this.hud = new HUD();
        add(this.hud);

        super.create();

        this.text = new flixel.text.FlxText(0, 0, 0, "Initalizing...", 64);
        this.text.screenCenter();
        add(this.text);

        this.map = new Tilemap("Tilemap.json", "TileImage.png");
        this.map.background.screenCenter();
        this.map.walls.screenCenter();
        add(this.map.background);
        add(this.map.walls);
        add(this.map.pickups);

        this.coins = new FlxTypedGroup<Coin>();
        add(this.coins);
        coins.add(new Coin(this.map.doorCoinPosition().x + 4, this.map.doorCoinPosition().y + 4));

        this.player = new Player();
        this.player.setCameraFollow();
        this.player.setPosition(
                this.map.getPlayerEntityPosition().x,
                this.map.getPlayerEntityPosition().y
                );
        add(this.player);

    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        player.update(elapsed);

        // Basic collision check for player on walls!
        FlxG.collide(this.player, this.map.walls);
        FlxG.overlap(this.player, this.coins, this.playerTouchCoin);
    }

    // Callback for when a player collides with a coin
    public function playerTouchCoin(player: Player, coin: Coin)
    {
        if(player.alive && player.exists && coin.alive && coin.exists)
        {
            coin.kill();
            hud.updateHud();
        }
    }
}
