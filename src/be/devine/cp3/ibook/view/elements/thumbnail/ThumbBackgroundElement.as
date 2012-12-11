/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 15:32
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elements.thumbnail {
import be.devine.cp3.ibook.view.elements.*;
import be.devine.cp3.ibook.vo.BackgroundVO;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;
import starling.events.Event;
import starling.textures.Texture;

public class ThumbBackgroundElement extends Element{
    private var loader:Loader;
    private var background:Image;

    public function ThumbBackgroundElement(backgroundVO:BackgroundVO) {
        loader = new Loader();
        loader.load(new URLRequest(backgroundVO.url));
        loader.contentLoaderInfo.addEventListener(starling.events.Event.COMPLETE, bgLoadedHandler);

    }

    private function bgLoadedHandler(event:flash.events.Event):void {
        var bitmap:Bitmap = event.currentTarget.loader.content as Bitmap;
        background = new Image(Texture.fromBitmap(bitmap));
        background.width = 200;
        background.scaleY = background.scaleX;
        if(background.height > 150){
            background.height = 150;
            background.scaleX = background.scaleY;
        }
        addChild(background);
    }
}
}
