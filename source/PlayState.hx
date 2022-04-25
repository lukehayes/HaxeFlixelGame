package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.tweens.FlxTween;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxEmitter;
import Input;

class PlayState extends FlxState
{
    var text : flixel.text.FlxText;
    var xp : Float = 10.0;
    var yp : Float = 10.0;
    var radius : Int = 10;
    var speed : Float = 40.0;
    var movement : Int = 50;
    var sprite : flixel.FlxSprite;
    var box : flixel.FlxSprite;
    var particle : FlxParticle;
    var emitter :  FlxEmitter;

    override public function create()
    {
        super.create();
        //this.text = new flixel.text.FlxText(0, 0, 0, "Initalizing...", 64);
        //this.text.screenCenter();
        //add(this.text);

        this.particle = new FlxParticle();
        this.particle.makeGraphic(10,10, flixel.util.FlxColor.YELLOW);

        this.emitter = new FlxEmitter(200,400);
        this.emitter.makeParticles(1,1, flixel.util.FlxColor.RED,1000);
        //this.emitter.loadParticles(this.particle);
        add(this.emitter);

        this.box = new FlxSprite(200,100);
        this.box.makeGraphic(100,100, flixel.util.FlxColor.CYAN);
        add(this.box);

        //this.sprite = new FlxSprite(300,300);
        this.sprite = new FlxSprite(300,300);
        this.sprite.makeGraphic(100,100, flixel.util.FlxColor.BLUE);
        add(this.sprite);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if(Input.RIGHT())
        {
            this.emitter.start();
            this.xp += this.movement;
        }

        if(Input.LEFT())
        {
            this.xp -= this.movement;
            this.emitter.start();
        }

        if(Input.UP())
        {
            this.yp -= this.movement;
            this.emitter.start();
        }

        if(Input.DOWN())
        {
            this.yp += this.movement;
            this.emitter.start();
        }

        this.sprite.x = this.xp * this.speed * elapsed;
        this.sprite.y = this.yp * this.speed * elapsed;

        trace(FlxObject.updateTouchingFlags(sprite,box));
    }
}
