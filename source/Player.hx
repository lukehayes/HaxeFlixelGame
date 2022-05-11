package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import Input;

// All player functionality lives inside here.
class Player extends FlxSprite
{
    static inline var SPEED : Float = 130.0;
    var xp                  : Float = 10.0;
    var yp                  : Float = 10.0;

    public function new(x:Float = 100, y:Float = 100)
    {
        super(x,y);
        makeGraphic(8,8, FlxColor.BLUE);
        drag.x = drag.y = 600;
    }

    public function setCameraFollow()
    {
        FlxG.camera.follow(this, TOPDOWN, 5);
    }

    public function updateMovement()
    {
        // Setup basic direction variables
        var up    :Bool = false;
        var down  :Bool = false;
        var left  :Bool = false;
        var right :Bool = false;

        // Set the direction values to actual key presses.
        up    = FlxG.keys.anyPressed([UP,    W]);
        down  = FlxG.keys.anyPressed([DOWN,  S]);
        left  = FlxG.keys.anyPressed([LEFT,  A]);
        right = FlxG.keys.anyPressed([RIGHT, D]);

        // Stop movement is two opposite directions are pressed.
        if(up && down)
            up = down = false;
        if(left && right)
            left = right = false;

        if(up||down||left||right)
        {
            var newAngle:Float = 0;
            if (up)
            {
                newAngle = -90;
                if (left)
                    newAngle -= 45;
                else if (right)
                    newAngle += 45;
            }
            else if (down)
            {
                newAngle = 90;
                if (left)
                    newAngle += 45;
                else if (right)
                    newAngle -= 45;
            }
            else if (left)
                newAngle = 180;
            else if (right)
                newAngle = 0;

            velocity.set(SPEED, 0);
            velocity.rotate(FlxPoint.weak(0,0), newAngle);
        }

    }

    override public function update(elapsed:Float)
    {
        updateMovement();
        super.update(elapsed);
    }
}
