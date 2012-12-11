/**
 * Created with IntelliJ IDEA.
 * User: Sarah
 * Date: 11/12/12
 * Time: 14:13
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elements.pageview {
import be.devine.cp3.ibook.view.elements.Element;
import be.devine.cp3.ibook.vo.ImageVO;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;

import starling.events.Event;
import starling.textures.Texture;

public class ImageElement extends Element{
    private var loader:Loader;
    private var img:Image;
    private var imageVO:ImageVO;
    public function ImageElement(imageVO:ImageVO) {
        this.imageVO = imageVO;

        /* --- IMG LADEN --- */
        loader = new Loader();
        loader.load(new URLRequest(imageVO.url));
        loader.contentLoaderInfo.addEventListener(starling.events.Event.COMPLETE, imgLoadedHandler);


    }

    private function imgLoadedHandler(event:flash.events.Event):void {
        /* --- BACKGROUND TONEN --- */
        var bitmap:Bitmap = event.currentTarget.loader.content as Bitmap;
        img = new Image(Texture.fromBitmap(bitmap));

        /* --- GROOTTE BACKGROUND INSTELLEN --- */
        img.x = imageVO.xpos;
        img.y = imageVO.ypos;

        addChild(img);

        /* --- RESIZEHANDLER --- */
        stage.addEventListener(starling.events.Event.RESIZE, resizeHandler);
    }

    private function resizeHandler(event:starling.events.Event):void {

    }
}
}
