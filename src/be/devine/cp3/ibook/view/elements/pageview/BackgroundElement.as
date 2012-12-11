/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 15:32
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elements.pageview {
import be.devine.cp3.ibook.view.elements.*;
import be.devine.cp3.ibook.vo.BackgroundVO;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;
import starling.events.Event;
import starling.textures.Texture;


public class BackgroundElement extends Element{
    private var loader:Loader;
    private var background:Image;

    public function BackgroundElement(backgroundVO:BackgroundVO) {
        /* --- BACKGROUND LADEN --- */
        loader = new Loader();
        loader.load(new URLRequest(backgroundVO.url));
        loader.contentLoaderInfo.addEventListener(starling.events.Event.COMPLETE, bgLoadedHandler);

    }

    private function bgLoadedHandler(event:flash.events.Event):void {
        /* --- BACKGROUND TONEN --- */
        var bitmap:Bitmap = event.currentTarget.loader.content as Bitmap;
        background = new Image(Texture.fromBitmap(bitmap));

        /* --- GROOTTE BACKGROUND INSTELLEN --- */
        background.width = stage.stageWidth;
        background.height = stage.stageHeight;
        addChild(background);

        /* --- RESIZEHANDLER --- */
        stage.addEventListener(starling.events.Event.RESIZE, resizeHandler);
    }

    private function resizeHandler(event:starling.events.Event):void {
        /* --- CONTROLE --- */
            //trace('[backgroundelement] resizeHandler');

        /* --- AANPASSEN WANNEER STAGEWIDTH/HEIGHT VERANDERT --- */
        background.width = stage.stageWidth;
        background.height = stage.stageHeight;

    }
}
}
