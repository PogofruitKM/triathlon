package;

import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import flixel.FlxCamera;
import flixel.math.FlxRandom;
import flixel.util.FlxTimer;

using StringTools;

class CringeSubstate extends MusicBeatSubstate
{

    public var win:Void->Void = null;
	public var lose:Void->Void = null;
    
    var cantMove:Bool = false;
    var num11:Int = 0;
    var num21:Int = 0;

    var num12:Int = 0;
    var num22:Int = 0;

    var num13:Int = 0;
    var num23:Int = 0;

    var wharToDo:String = '';
    var textu:FlxText;
    var timerTxt:FlxText;
    var AAAAAAAAAAGGGEHGAHG:FlxText;

    var pos:Int = 0;

    var solution:Int = Std.int(Math.POSITIVE_INFINITY);
    //var realSolution:Array<String>;
    var table:Array<Int> = [0, 0, 0, 0];
    var rerolled:Bool = false;
    var okOrNotOk:FlxText;
    var inputtedNumber:Int = 0;
    var aboutToBeInput:Int = 0;
    var questionNumber:Int = 1;
    var judgementTime:Bool = false;
    var overlay:FlxSprite;
    var texto:String = '';
    //var aboutTobeInputFake:String = '';
    
    //var fakePos:Int = 1;

    public function new()
    {
		super();
		overlay = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		overlay.alpha = 0.4;
		add(overlay);
        cantMove = false;
        num12 = new FlxRandom().int(0, 12);
        num22 = new FlxRandom().int(0, 12);
        var num3:Int = new FlxRandom().int(0, 2);
        switch (num3) {
            case 0:
                wharToDo = Std.string(num12) + ' * ' + Std.string(num22) + " = "; // MULTIPLY
                solution = num12 * num22;
            case 1:
                wharToDo = Std.string(num12) + ' + ' + Std.string(num22) + " = "; // ADD
                solution = num12 + num22;
            case 2:
                wharToDo = Std.string(num12) + ' - ' + Std.string(num22) + " = "; // SUBTRACT
                solution = num12 - num22;
        }
        var chance:Bool = new FlxRandom().bool(15);
        if (chance) {
            wharToDo = Std.string(num12) + ' / ' + Std.string(num22) + " = "; // DIVIDE
            solution = Std.int(num12 / num22); // BREAKPOINT 1: What the fuck do i do here????
        }

        pos = 0;

        textu = new FlxText(0, 0, FlxG.width, wharToDo, 50);
        textu.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        textu.screenCenter();
        add(textu);
        textu.alpha = 0;
        if (chance) textu.text = wharToDo + "\nAlso remember that it's rounded towards 0!";

        okOrNotOk = new FlxText(0, 0, FlxG.width, '0', 50);
        okOrNotOk.text = Std.string(aboutToBeInput) + ' <';

        okOrNotOk.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        okOrNotOk.screenCenter();
        okOrNotOk.x = textu.x + 175;
        okOrNotOk.color = FlxColor.YELLOW;
        add(okOrNotOk);
        okOrNotOk.alpha = 0;

        FlxTween.tween(textu, {alpha: 1}, 0.45, {ease: FlxEase.quadOut});
        FlxTween.tween(okOrNotOk, {alpha: 1}, 0.45, {ease: FlxEase.quadOut});
    }

    override function update(elapsed:Float)
    {
        if (FlxG.fullscreen == true) {
            textu.antialiasing = ClientPrefs.globalAntialiasing;
            okOrNotOk.antialiasing = ClientPrefs.globalAntialiasing;
        }
        super.update(elapsed); //i forgot to put it here in the first place :skull:

        okOrNotOk.text = Std.string(aboutToBeInput) + ' <'; //Std.string(aboutToBeInput)
        if (!cantMove) {
            //if (FlxG.keys.justPressed.ANY) {
            if (FlxG.keys.justPressed.ONE) {
                table.insert(pos, 1);
                pos++;
            }
            if (FlxG.keys.justPressed.TWO) {
                table.insert(pos, 2);
                pos++;
            }
            if (FlxG.keys.justPressed.THREE) {
                table.insert(pos, 3);
                pos++;
            }
            if (FlxG.keys.justPressed.FOUR) {
                table.insert(pos, 4);
                pos++;
            }
            if (FlxG.keys.justPressed.FIVE) {
                table.insert(pos, 5);
                pos++;
            }
            if (FlxG.keys.justPressed.SIX) {
                table.insert(pos, 6);
                pos++;
            }
            if (FlxG.keys.justPressed.SEVEN) {
                table.insert(pos, 7);
                pos++;
            }
            if (FlxG.keys.justPressed.EIGHT) {
                table.insert(pos, 8);
                pos++;
            }
            if (FlxG.keys.justPressed.NINE) {
                table.insert(pos, 9);
                pos++;
            }
            if (FlxG.keys.justPressed.ZERO) {
                table.insert(pos, 0);
                pos++;
            }
            if (FlxG.keys.justPressed.BACKSPACE) {
                if (pos > 0) {
                    table.remove(table[pos]);
                    pos--;
                }
            }
            if (FlxG.keys.justPressed.ANY && !FlxG.keys.justPressed.ENTER) { //bulletproof
                FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                var t:String = '';
                switch pos {
                    case 0:
                        t = '0';
                    case 1:
                        t = Std.string(table[0]);
                    case 2:
                        t = Std.string(table[0]) + Std.string(table[1]);
                    case 3:
                        t = Std.string(table[0]) + Std.string(table[1]) + Std.string(table[2]);
                }
                if (pos > 3) {
                    pos = 0;
                    table = [0, 0, 0, 0];
                }
                aboutToBeInput = Std.parseInt(t);
                if (FlxG.keys.justPressed.ALT) {
                    //aboutToBeInput = -aboutToBeInput;
                    if (Std.string(aboutToBeInput).charAt(0) != '-') {
                        aboutToBeInput = -aboutToBeInput;
                    }
                }
            }
            
            //wtf is all that
            

            if (FlxG.keys.justPressed.ENTER) {

                //inputtedNumber = table;
               
                cantMove = true;
                if (aboutToBeInput == solution) {
                    overlay.alpha = 0;
                    textu.alpha = 0;
                    okOrNotOk.alpha = 0;
                    PlayState.instance.wonMath(wharToDo, aboutToBeInput, solution);
                    inputtedNumber = 0;
                    aboutToBeInput = 0;
                    table = [0, 0, 0, 0];
                    pos = 0;
                    close();
                } else {
                    overlay.alpha = 0;
                    textu.alpha = 0;
                    okOrNotOk.alpha = 0;
                    PlayState.instance.loseMath(wharToDo, aboutToBeInput, solution);
                    inputtedNumber = 0;
                    aboutToBeInput = 0;
                    table = [0, 0, 0, 0];
                    pos = 0;
                    close();
                }
            }
        }
    }

    override function beatHit()
    {
        super.beatHit();
    }
    
    override public function close() {
        super.close();
    }
}