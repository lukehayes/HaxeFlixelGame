package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import Input;

// All player functionality lives inside here.
class Player extends FlxSprite
{
    var speed  : Float = 30.0;
    var xp     : Float = 10.0;
    var yp     : Float = 10.0;

    public function new(x:Float = 100, y:Float = 100)
    {
        super(x,y);
        makeGraphic(16,16, FlxColor.BLUE);
    }

    public function setCameraFollow()
    {
        FlxG.camera.follow(this, TOPDOWN, 5);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if(Input.RIGHT())
        {
            this.xp += this.speed;
        }

        if(Input.LEFT())
        {
            this.xp -= this.speed;
        }

        if(Input.UP())
        {
            this.yp -= this.speed;
        }

        if(Input.DOWN())
        {
            this.yp += this.speed;
        }

        this.x = this.xp * this.speed * elapsed;
        this.y = this.yp * this.speed * elapsed;
    }
}
