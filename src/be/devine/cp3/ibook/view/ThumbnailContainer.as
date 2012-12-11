/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 9/12/12
 * Time: 15:16
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.vo.PageVO;

import flash.events.Event;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ThumbnailContainer extends Sprite{

    private var appModel:AppModel;
    private var thumbnails:Vector.<Thumbnail>;
    public function ThumbnailContainer() {
        appModel = AppModel.getInstance();

        thumbnails = new Vector.<Thumbnail>();
        appModel.addEventListener(AppModel.PAGES_CHANGED, pagesChangedHandler);
        appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, currentPageChangedHandler);
    }

    private function currentPageChangedHandler(event:Event):void {
        display();
    }

    private function pagesChangedHandler(event:Event):void {
        for each(var pageVO:PageVO in appModel.pages){
            var yPos:int;
            var thumbnail:Thumbnail = new Thumbnail(pageVO);
            thumbnail.y += yPos;
            addChild(thumbnail);

            yPos += thumbnail.height + 10;
            thumbnails.push(thumbnail);
        }
        display();
    }

    private function display():void {
        trace(appModel.pages.indexOf(appModel.currentPage));
        for each(var thumbnail:Thumbnail in thumbnails){
            if(thumbnails.indexOf(thumbnail) != appModel.pages.indexOf(appModel.currentPage)){
                thumbnail.alpha = .3;
                thumbnail.addEventListener(TouchEvent.TOUCH, touchHandler);
            }else{
                thumbnail.alpha = 1;
                thumbnail.removeEventListener(TouchEvent.TOUCH, touchHandler);
            }
        }
    }

    private function touchHandler(event:TouchEvent):void {

        var huidigeThumb:Thumbnail = event.currentTarget as Thumbnail;
        var touch:Touch = event.getTouch(huidigeThumb);
        huidigeThumb.alpha = .3;
        if(touch != null){
            switch(touch.phase){
                case TouchPhase.ENDED:
                    appModel.currentPage = appModel.pages[thumbnails.indexOf(huidigeThumb)];
                    break;

                case TouchPhase.HOVER:
                    huidigeThumb.alpha = 1;
                    break;
            }
        }
    }
}
}
