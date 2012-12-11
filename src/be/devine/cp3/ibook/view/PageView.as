/**
 * Created with IntelliJ IDEA.
 * User: Sarah
 * Date: 27/11/12
 * Time: 15:58
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.vo.PageVO;

import flash.display.Sprite;

import flash.display.Sprite;
import flash.events.Event;

import starling.display.Sprite;
import starling.events.Event;

public class PageView extends starling.display.Sprite
{
    private var appModel:AppModel;
    private var page:Page;
    private var xPos:uint = 0;
    private var yPos:uint = 0;
    private var pages:Array;

    public function PageView()
    {
        appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.PAGES_CHANGED, pagesChangedHandler);
    }

    private function pagesChangedHandler(event:flash.events.Event):void {

        pages = new Array();
        for each(var pageVO:PageVO in appModel.pages){
            page = new Page(pageVO);
            page.x += xPos;
            page.y = yPos;
            addChild(page);


            pages.push(page);


            //xPos += 800;
            //xpos: als de stage uitrekt
            xPos += stage.stageWidth;
        }
        stage.addEventListener(starling.events.Event.RESIZE, resizeHandler);
    }

    private function resizeHandler(event:starling.events.Event):void {
        /* --- CONTROLE --- */

        //xPos += stage.stageWidth;
        trace('[pageview] resizehandler');

        xPos = 0;
        for each(var pg:Page in pages)
        {
            trace('[pages] resize');
            pg.x = xPos;
            xPos += stage.stageWidth;

            trace(pg.x);
        }

    }

}
}
