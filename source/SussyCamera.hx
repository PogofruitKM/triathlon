package;

import flixel.FlxCamera;

using StringTools;

class SussyCamera extends FlxCamera
{
	public var copyAngle:Bool = true;
	public var copyAlpha:Bool = true;
	public var copyVisible:Bool = true;
	public var copyZoom:Bool = true;
	public var copyColor:Bool = true;


	public var cameraFollow:FlxCamera;

	public function new(xx:Int=0, yy:Int = 0, width:Int = 1280, height:Int = 720, zoom:Float = 1)
	{
		super();
		//targetCamera = new FlxCamera(xx, yy, width, height, zoom);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		/*if (sprTracker != null) {
			setPosition(sprTracker.x + xAdd, sprTracker.y + yAdd);
			scrollFactor.set(sprTracker.scrollFactor.x, sprTracker.scrollFactor.y);

			if(copyAngle)
				angle = sprTracker.angle + angleAdd;

			if(copyAlpha)
				alpha = sprTracker.alpha * alphaMult;

			if(copyVisible) 
				visible = sprTracker.visible;
		}*/
		//just copypasted attachedsprite
		//feelin good
		if (cameraFollow != null) {
			setPosition(cameraFollow.x, cameraFollow.y);
			
			if (copyAngle) angle = cameraFollow.angle;
			if (copyAlpha) alpha = cameraFollow.alpha;
			if (copyVisible) visible = cameraFollow.visible;
			if (copyZoom) zoom = cameraFollow.zoom;
			if (copyColor) color = cameraFollow.color;
		}
	}
}
