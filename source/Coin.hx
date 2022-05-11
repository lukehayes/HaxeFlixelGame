package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Coin extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x,y);
        makeGraphic(8,8, FlxColor.YELLOW);
    }
}
