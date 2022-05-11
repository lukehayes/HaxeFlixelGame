package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Coin extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x,y);
        makeGraphic(8,8, FlxColor.YELLOW);
    }

    override public function kill()
    {
        alive = false;
        FlxTween.tween(this,
                {alpha:0, y: y - 16},
                0.33,
                {ease: FlxEase.circOut, onComplete: this.finishKill}
                );
    }

    public function finishKill(_)
    {
        exists = false;
    }
}
