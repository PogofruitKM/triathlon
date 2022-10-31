

function onCreate()
	makeLuaSprite('carpet', '1', -500, -200);
	setScrollFactor('carpet', 0.9, 0.9);
	scaleObject('carpet', 0.75, 0.5);

	makeLuaSprite('windows11', '2', -500, -200);
	setScrollFactor('windows11', 0.9, 0.9);
	scaleObject('windows11', 0.75, 0.5);

	makeLuaSprite('bookshelfWhatTheFu', '3', -500, -200);
	setScrollFactor('bookshelfWhatTheFu', 0.9, 0.9);
	scaleObject('bookshelfWhatTheFu', 0.75, 0.5);

	makeLuaSprite('fgBookshelf', '4', -500, -200);
	setScrollFactor('fgBookshelf', 0.9, 0.9);
	scaleObject('fgBookshelf', 0.75, 0.5); --intended 0.65, 0.4 SCALE for 0.9 ZOOMS!1!

	makeLuaSprite('fgCHAIR', '5', -500, -200); --intended -600 Y
	setScrollFactor('fgCHAIR', 1.1, 1.1); --new intended -300, 0 AXIS
	scaleObject('fgCHAIR', 1.5, 1.5);

	addLuaSprite('carpet', false);
	addLuaSprite('windows11', false);
	addLuaSprite('bookshelfWhatTheFu', false);
	addLuaSprite('fgBookshelf', false);
	addLuaSprite('fgCHAIR', true);

	close(true);
end