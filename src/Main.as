package {

import be.devine.cp3.ibook.Application;

import flash.display.DisplayObject;
import flash.display.MovieClip;

import flash.display.Screen;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;


import starling.core.Starling;

public class Main extends Sprite
{
    private var starling:Starling;

    public function Main()
    {
        /* --- CONTROLE --- */
        //trace('--- MAIN ---    main');

        /* --- STAGE --- */
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        /* --- WINDOW --- */
        stage.nativeWindow.visible = true;
        stage.nativeWindow.width = 800;
        stage.nativeWindow.height = 600;
        stage.nativeWindow.x = (Screen.mainScreen.bounds.width - 800) * .5;
        stage.nativeWindow.y = (Screen.mainScreen.bounds.height - 600) * .5;
        stage.nativeWindow.title = "IBOOK04";


        /* --- Starling --- */

        starling = new Starling(Application, stage);
        starling.start();

        stage.addEventListener(Event.RESIZE, eventResizeHandler);


    }

    public function eventResizeHandler(event:Event = null):void
    {
        starling.viewPort = new Rectangle(0,0, stage.stageWidth, stage.stageHeight);
        starling.stage.stageHeight = stage.stageHeight;
        starling.stage.stageWidth = stage.stageWidth;
    }
}
}
