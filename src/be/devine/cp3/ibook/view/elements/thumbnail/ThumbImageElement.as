/**
 * Created with IntelliJ IDEA.
 * User: Sarah
 * Date: 11/12/12
 * Time: 14:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elements.thumbnail {
import be.devine.cp3.ibook.view.elements.Element;
import be.devine.cp3.ibook.vo.ImageVO;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;
import starling.textures.Texture;

public class ThumbImageElement extends Element{
    private var loader:Loader;
    private var img:Image;
    private var imageVO:ImageVO;

    public function ThumbImageElement(imageVo:ImageVO) {
        this.imageVO = imageVo;

            loader = new Loader();
            loader.load(new URLRequest(imageVo.url));
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imgLoadedHandler);
    }

    private function imgLoadedHandler(event:Event):void {
        var bitmap:Bitmap = event.currentTarget.loader.content as Bitmap;
        img = new Image(Texture.fromBitmap(bitmap));
        img.width = img.width/7;
        img.scaleY = img.scaleX;
        if(img.height > 150){
            img.height = img.height/7;
            img.scaleX = img.scaleY;
        }
        img.x = imageVO.xpos/7;
        img.y = imageVO.ypos/4;
        addChild(img);
    }
}
}
