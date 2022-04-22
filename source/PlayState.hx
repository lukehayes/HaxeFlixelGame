package;

import flixel.FlxState;

class PlayState extends FlxState
{
    var text : flixel.text.FlxText;
    var xp : Int = 100;
    var yp : Int = 100;
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
        this.text.x = this.xp * this.speed * elapsed;
    }
}
