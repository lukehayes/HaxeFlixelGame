package;

import flixel.FlxG;

/**
* Simple helper functions to help getting input quickly.
*/
class Input
{
    static public function LEFT() : Bool
    {
        if(FlxG.keys.justPressed.A)
        {
            return true;
        }else 
        {

            return false;
        }
    }

    static public function RIGHT() : Bool
    {
        if(FlxG.keys.justPressed.D)
        {
            return true;
        }else 
        {

            return false;
        }
    }

    static public function UP() : Bool
    {
        if(FlxG.keys.justPressed.W)
        {
            return true;
        }else 
        {

            return false;
        }
    }

    static public function DOWN() : Bool
    {

        if(FlxG.keys.justPressed.S)
        {
            trace("Going down");
            return true;
        }else 
        {

            return false;
        }
    }
}
