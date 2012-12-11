/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 15:32
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elements.thumbnail {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.elements.*;
import be.devine.cp3.ibook.vo.ButtonVO;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Button;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class ThumbButtonElement extends Element{

    /*private var button:Button;
    private var target:int;
    private var appModel:AppModel;
    private var text:TextField;

    [Embed(source="/../media/spritesheet.xml", mimeType="application/octet-stream")]
    public static const SpriteSheetXML:Class;

    [Embed(source="/../media/spritesheet.png")]
    public static const SpriteSheetTexture:Class;*/

    public function ThumbButtonElement(buttonVO:ButtonVO) {
       /* appModel = AppModel.getInstance();

        var texture:Texture = Texture.fromBitmap(new SpriteSheetTexture());
        var xml:XML = XML(new SpriteSheetXML());
        var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);


        if(buttonVO.target >= appModel.pages.length){
            target = appModel.pages.length;
        }else{
            target = buttonVO.target;
        }

        var buttonText:String = "naar pagina " + String(target);

        button = new Button(textureAtlas.getTexture("button"));
        button.addEven$tListener(TouchEvent.TOUCH, touchHandler);
        button.alpha = .3;
        button.text = buttonText;
        button.x = 150;
        button.fontName = "ProximaNovaRegular";
        button.fontSize = 15;
        addChild(button);*/

    }

  /*  private function touchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(button);
        var tween:Tween = new Tween(button,.3, Transitions.EASE_IN);
        tween.animate("alpha",.3);
        Starling.juggler.add(tween);


        if(touch != null)
        {
            switch(touch.phase)
            {
                case TouchPhase.BEGAN:
                    var tween:Tween = new Tween(button,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);
                    break;
                case TouchPhase.ENDED:
                    var tween:Tween = new Tween(button,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);
                    appModel.currentPage = appModel.pages[target - 1];

                    var tween:Tween = new Tween(button,.3, Transitions.EASE_IN);
                    tween.animate("alpha",.3);
                    Starling.juggler.add(tween);
                    break;
                    break;
                case TouchPhase.HOVER:
                    var tween:Tween = new Tween(button,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);
                    break;
            }
        }
    }*/
}
}
