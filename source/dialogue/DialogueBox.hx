package dialogue;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class DialogueBox extends FlxSprite
{
    public var text : FlxText;

    public function new(x:Float = 0, y : Float = 0, ?text : String)
    {
        super(x,y);
        makeGraphic(FlxG.width,100, FlxColor.GRAY);

        this.text = new FlxText(0,50, FlxG.width, text, 16);
        this.text.autoSize = false;
        this.text.alignment = flixel.text.FlxTextAlign.CENTER;
    }
}
