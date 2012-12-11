package be.devine.cp3.ibook {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.service.PageService;
import be.devine.cp3.ibook.view.PageView;
import be.devine.cp3.ibook.view.TimelineView;
import be.devine.cp3.ibook.view.VolgendeButton;
import be.devine.cp3.ibook.view.VorigeButton;
import be.devine.cp3.ibook.vo.PageVO;


import flash.events.Event;
import flash.ui.Keyboard;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Button;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Application extends Sprite
{
    private var appModel:AppModel;

    private var _vorigeButton:VorigeButton;
    private var _volgendeButton:VolgendeButton;
    private var _knoppen:Sprite;

    private var _pageView:PageView;
    private var _timelineView:TimelineView;

    private var defaultBackground:Quad;
    private var bgwidth:int;
    private var bgheigth:int;

    private var _pageService:PageService;

    public function Application()
    {

        appModel = AppModel.getInstance();
        _knoppen= new Sprite();

        /* --- PAGE --- */
        _pageView = new PageView();
        addChild(_pageView);

        /* --- TIMELINE --- */
        _timelineView = new TimelineView();
        addChild(_timelineView);

        _timelineView.addEventListener(TimelineView.TIMELINE_BUTTON_CLICKED, timelineButtonClicked);

        _pageService = new PageService();
        _pageService.addEventListener(flash.events.Event.COMPLETE, xmlCompleteHandler);
        _pageService.loadXML();

        /* --- VORIGE --- */
        _vorigeButton = new VorigeButton();
        _knoppen.addChild(_vorigeButton);
        _vorigeButton.addEventListener(TouchEvent.TOUCH, vorigeTouchHandler);
        _vorigeButton.alpha = 0.3;

        /* --- VOLGENDE --- */
        _volgendeButton = new VolgendeButton();
        _volgendeButton.x = _vorigeButton.x + _vorigeButton.width + 100;
        _knoppen.addChild(_volgendeButton);
        addChild(_knoppen);
        _volgendeButton.addEventListener(TouchEvent.TOUCH, volgendeTouchHandler);
        _volgendeButton.alpha = 0.3;


        appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, currentPageChangedHandler);

        addEventListener(starling.events.Event.ADDED_TO_STAGE,addedToStageHandler);
    }



    /* --- TOUCH HANDLERS --- */
    private function vorigeTouchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(_vorigeButton);

        /* --- MOVED --- */
        var tween:Tween = new Tween(_vorigeButton,.3, Transitions.EASE_IN);
        tween.animate("alpha",.3);
        Starling.juggler.add(tween);

        if(touch != null)
        {
            switch(touch.phase)
            {
                case TouchPhase.BEGAN:
                    var tween:Tween = new Tween(_vorigeButton,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);
                    break;
                case TouchPhase.ENDED:
                    //trace("vorige");
                    var tween:Tween = new Tween(_vorigeButton,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);
                        appModel.goToPrevousPage();
                    break;
                case TouchPhase.HOVER:
                    var tween:Tween = new Tween(_vorigeButton,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);
                    break;
            }
        }
    }

    private function volgendeTouchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(_volgendeButton);

        /* --- MOVED --- */
        var tween:Tween = new Tween(_volgendeButton,.3, Transitions.EASE_IN);
        tween.animate("alpha",.3);
        Starling.juggler.add(tween);


        if(touch != null)
        {
            switch(touch.phase)
            {
                case TouchPhase.BEGAN:
                    var tween:Tween = new Tween(_volgendeButton,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);
                    break;
                case TouchPhase.ENDED:
                    var tween:Tween = new Tween(_volgendeButton,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);

                    appModel.goToNexPage();

                    break;
                case TouchPhase.HOVER:
                    var tween:Tween = new Tween(_volgendeButton,.3, Transitions.EASE_IN);
                    tween.animate("alpha",1);
                    Starling.juggler.add(tween);
                    break;
            }
        }
    }

    private function timelineButtonClicked(event:starling.events.Event):void {
        //_timelineView.x = 30;
       showTimeline();

    }

    private function showTimeline():void{
        if(appModel.timelineVisible)
        {
            appModel.timelineVisible = false;
            var tween:Tween = new Tween(_timelineView, 0.5, Transitions.EASE_IN);
            //tween.moveTo(30,0);
            var newX:Number;
            tween.animate("x",-_timelineView.width + 40);
            Starling.juggler.add(tween);
        }
        else
        {
            appModel.timelineVisible = true;
            var tween:Tween = new Tween(_timelineView, 0.5, Transitions.EASE_IN);
            //tween.moveTo(30,0);
            var newX:Number;
            tween.animate("x",0);
            Starling.juggler.add(tween);
        }
    }

    private function xmlCompleteHandler(event:flash.events.Event):void {
        appModel.pages = _pageService.pages;
        appModel.currentPage = appModel.pages[0];
        displayCurrentPage();
    }

    private function addedToStageHandler(event:starling.events.Event):void {
        defaultBackground = new Quad(stage.stageWidth, stage.stageHeight, 0X3D3D3D);
        addChildAt(defaultBackground,  0);
        _knoppen.y = stage.stageHeight - _knoppen.height - 20;
        _knoppen.x = (stage.stageWidth - _knoppen.width) /2;
        stage.addEventListener(starling.events.Event.RESIZE, resizeHandler);
        _timelineView.x = -_timelineView.width + 40;
        stage.addEventListener(KeyboardEvent.KEY_UP, keyBoardHandler);
    }

    private function keyBoardHandler(event:KeyboardEvent ):void {
        switch(event.keyCode){
            case Keyboard.RIGHT:
                appModel.goToNexPage();
                break;

            case Keyboard.LEFT:
                appModel.goToPrevousPage();
                break;

            case Keyboard.SPACE:
                showTimeline();
                break;
        }
    }

    private function resizeHandler(event:starling.events.Event):void {
        defaultBackground.width = stage.stageWidth;
        defaultBackground.height = stage.stageHeight;
        _knoppen.y = stage.stageHeight - _knoppen.height - 20;
        _knoppen.x = (stage.stageWidth - _knoppen.width) /2;
    }

    private function currentPageChangedHandler(event:flash.events.Event):void {
        displayCurrentPage();
    }

    private function displayCurrentPage():void {
        if(appModel.currentPage){
            var huidigePage:int = appModel.pages.indexOf(appModel.currentPage);
            var tween:Tween = new Tween(_pageView,.4, Transitions.EASE_IN);
            //tween.animate("x", huidigePage * -800);
            tween.animate("x", huidigePage * -stage.stageWidth);
            Starling.juggler.add(tween);
        }
    }
}
}
