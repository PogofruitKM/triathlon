package;

import flixel.FlxG;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;


class NerdBoard extends FlxBasic
{
	public var finishCallback:Void->Void = null;
	public var music:String = ''; //maybe they'll give it to me later???? - Cyachao
    var cooldown:Float = 1.5; //1.5 seconds??

	public function new()
	{
		super();

		new FlxTimer().start(0, function(tmr:FlxTimer)
		{
			if(music != '')
			{
				FlxG.sound.playMusic(Paths.music(music), 0, false);
				FlxG.sound.music.fadeIn();
			}
		});
		PlayState.instance.add(this);
	}

	override function update(elapsed)
	{
		super.update(elapsed);

        if (cooldown >= 0) cooldown -= elapsed;
		if (FlxG.keys.justPressed.SHIFT && cooldown <= 0) {
            finishCallback(); //yes that's it
        }

	}
}