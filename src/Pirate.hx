package;


import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Assets;
import nme.Lib;


class Pirate extends Sprite {
	
	
	public function new () {
		
		super ();
		
		var bitmap = new Bitmap (Assets.getBitmapData ("assets/bootstrap/pirate.png"));
    	bitmap.scaleX = bitmap.scaleY = Math.random () + 0.5;
    	bitmap.x = - bitmap.width / 2;
    	bitmap.y = - bitmap.height / 2;
    	
		x = Math.random () * Lib.current.stage.stageWidth;
		y = Math.random () * Lib.current.stage.stageHeight;
		addChild (bitmap);
		
		_vr = (Math.random()*0.2 - 0.1) * (180 / Math.PI);
        _vx = Math.random()*70 - 35;
        _vy = Math.random()*70 - 35;
		
	}
	
	
	public function update (dt :Float) {
		
        var w = stage.stageWidth;
        var h = stage.stageHeight;

        var perSecond = 0.05*dt;
        x += _vx*perSecond;
        y += _vy*perSecond;
        rotation += _vr*perSecond;

        _vy += 0.75*perSecond;

        if (y > h) {
            _vy *= -0.8;
            y = h;
            if (Math.random() < 0.5) {
                _vy -= Math.random()*12;
            }
        }

        if (x > w) {
            _vx *= -0.8;
            x = w;

        } else if (x < 0) {
            _vx *= -0.8;
            x = 0;
        }
    }

    private var _vx :Float;
    private var _vy :Float;
    private var _vr :Float;
	
	
}