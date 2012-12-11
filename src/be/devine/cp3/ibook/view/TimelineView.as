/**
 * Created with IntelliJ IDEA.
 * User: Sarah
 * Date: 27/11/12
 * Time: 14:57
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {


import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.vo.PageVO;

import flash.events.Event;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class TimelineView extends Sprite
{
    private var _timelineButton:TimelineButton;
    private var achtergrond:Quad;
    private var bgwidth:Number = 240;
    private var bgheight:Number = 10;
    private var _thumbnailContainer:ThumbnailContainer;
    private var _scrollbar:Scrollbar;

    public static const TIMELINE_BUTTON_CLICKED:String = "timeline button clicked";
    public static const VIEWCHANGED:String = "The view changed";

    public function TimelineView()
    {

        achtergrond = new Quad(bgwidth,bgheight, 0X4F4F4F);
        addChild(achtergrond);

        _timelineButton = new TimelineButton();
        _timelineButton.y = 10;
        _timelineButton.x = achtergrond.width + 10;
        _timelineButton.alpha = .3;
        _timelineButton.addEventListener(TouchEvent.TOUCH, buttonTouchHandler);
        addChild(_timelineButton);


        _thumbnailContainer = new ThumbnailContainer();
        _thumbnailContainer.x = _thumbnailContainer.y = 10;
        addChild(_thumbnailContainer);

        /*_scrollbar = new Scrollbar(600);
        _scrollbar.addEventListener(Scrollbar.POSITION_CHANGED, positionChangedHandler);
        _scrollbar.x = this.width-_scrollbar.width - 45;
        addChild(_scrollbar); */

        addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

    }

    private function positionChangedHandler(event:starling.events.Event):void {
        var nieuweYpos:int = -((_thumbnailContainer.height - bgheight)* _scrollbar.position);
        var tween:Tween = new Tween(_thumbnailContainer, .4);
        tween.animate("y",nieuweYpos);
        Starling.juggler.add(tween);
    }



    private function buttonTouchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(_timelineButton);
        var tween:Tween = new Tween(_timelineButton, .3, Transitions.EASE_IN);
        tween.animate("alpha",.3);
        Starling.juggler.add(tween);

        if(touch != null){
            switch(touch.phase){
                case TouchPhase.ENDED:
                    dispatchEvent(new starling.events.Event(TIMELINE_BUTTON_CLICKED));
                    break;

                case TouchPhase.HOVER:
                    var tween:Tween = new Tween(_timelineButton,.3, Transitions.EASE_IN);
                    tween.animate("alpha", 1);
                        Starling.juggler.add(tween);
                    break;
            }
        }
    }

    private function addedToStageHandler(event:starling.events.Event):void {
        /* --- BACKGROUND --- */
        bgheight = stage.stageHeight;
        achtergrond.height = bgheight;

        /* --- SROLLBAR --- */
        _scrollbar = new Scrollbar(stage.stageHeight);
        _scrollbar.addEventListener(Scrollbar.POSITION_CHANGED, positionChangedHandler);
        _scrollbar.x = this.width-_scrollbar.width - 45;
        addChild(_scrollbar);

        /* --- RESIZE --- */
        stage.addEventListener(starling.events.Event.RESIZE, resizeHandler)
    }

    private function resizeHandler(event:starling.events.Event):void {
        /* --- BACKGROUND --- */
        bgheight = stage.stageHeight;
        achtergrond.height = bgheight;

        /* --- SCROLLBAR --- */
        _scrollbar = new Scrollbar(stage.stageHeight);
        _scrollbar.addEventListener(Scrollbar.POSITION_CHANGED, positionChangedHandler);
        _scrollbar.x = this.width-_scrollbar.width - 45;
        addChild(_scrollbar);

    }


}
}
