package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
    var text : flixel.text.FlxText;
    var xp : Float = 10.0;
    var yp : Float = 10.0;
    var radius : Int = 10;
    var speed : Float = 40.0;

    override public function create()
    {
        super.create();
        this.text = new flixel.text.FlxText(0, 0, 0, "Initalizing...", 64);
        this.text.screenCenter();
        add(this.text);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        this.xp += 1;
        this.text.x = (Math.cos(this.xp) * this.radius) * this.speed * elapsed;
        this.text.y = (Math.sin(this.xp) * this.radius) * this.speed * elapsed;
        trace(FlxG.height);
    }
}
