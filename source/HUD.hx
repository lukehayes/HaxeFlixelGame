package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;

class HUD extends FlxTypedGroup<FlxSprite>
{
    var healthCounter : FlxSprite;

    public function new()
    {
        super();
        this.healthCounter = new FlxSprite().makeGraphic(20,5, FlxColor.RED);
        this.add(healthCounter);

        // Iterate through each added item in the group.
        forEach(function(sprite){
            sprite.scrollFactor.set(0,0);
        });
    }

    public function updateHud()
    {
        trace("Called");
        var colors : Array<FlxColor> = [FlxColor.GREEN, 
                                        FlxColor.BLUE,
                                        FlxColor.ORANGE];

        var rng = new flixel.math.FlxRandom();
        trace(rng.int(0,2));
        trace(colors[rng.int(0,2)]);
        this.healthCounter.color = colors[rng.int(0,2)];
    }
}

