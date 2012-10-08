#if flambe
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.debug.FpsDisplay;
import flambe.display.FillSprite;
import flambe.display.Font;
import flambe.display.ImageSprite;
import flambe.display.Sprite;
import flambe.display.TextSprite;
import flambe.Entity;
import flambe.System;
#else
import nme.display.FPS;
import nme.display.Sprite;
import nme.events.Event;
import nme.text.TextField;
import nme.Lib;
#end


class Piratemark #if !flambe extends Sprite #end {
	
	
    public function new () {
    	
    	#if flambe
		
		System.init ();
		
		var manifest = Manifest.build ("bootstrap");
		var loader = System.loadAssetPack (manifest);
		
		loader.get (function (pack:AssetPack) {
			
			var background = new Entity ().add (new FillSprite (0xffffff, System.stage.width, System.stage.height));
	        System.root.addChild (background);
	        
	        System.stage.resize.connect (function () {
	        	
	            var sprite = background.get (FillSprite);
	            sprite.width._ = System.stage.width;
	            sprite.height._ = System.stage.height;
	            
	        });
	        
	        for (i in 0...10) {
	        	
	            var pirate = new Entity ().add (new ImageSprite (pack.loadTexture("pirate.png"))).add (new Bouncy ());
	            
	            var sprite = pirate.get (Sprite);
	            sprite.setXY (Math.random () * System.stage.width, Math.random () * System.stage.height);
	            sprite.setScale (Math.random () + 0.5);
	            sprite.centerAnchor ();

	            System.root.addChild (pirate);
	            
	        }
	        
	        System.root.addChild (new Entity ().add (new TextSprite (new Font (pack, "tinyfont"))).add (new FpsDisplay ()));
			
		});
		
		#else
		
    	super ();
    	
    	var background = new Sprite ();
    	background.graphics.beginFill (0xFFFFFF);
    	background.graphics.drawRect (0, 0, Lib.current.stage.stageWidth, Lib.current.stage.stageHeight);
    	addChild (background);
    	
    	var pirates = new Array <Pirate> ();
    	
    	for (i in 0...10) {
    		
    		var pirate = new Pirate ();
    		pirates.push (pirate);
    		addChild (pirate);
    		
    	}
    	
    	addChild (new FPS ());
    	
    	var cacheTime = Lib.getTimer ();
    	addEventListener (Event.ENTER_FRAME, function (event:Event) {
    		
    		var currentTime = Lib.getTimer ();
	    	var deltaTime = currentTime - cacheTime;
	    	cacheTime = currentTime;
	    	
	    	for (pirate in pirates) {
	    			
	    		pirate.update (deltaTime);
	    		
	    	}
    		
    	});
    	
    	#end
    	
    }
    
    
}