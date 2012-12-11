/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 9/12/12
 * Time: 20:42
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import flash.geom.Point;

import starling.display.DisplayObject;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Scrollbar extends Sprite{

    private var thumb:Quad;
    private var track:Quad;
    private var draggedObject:DisplayObject;
    private var startDragPosition:Point;
    private var trackheight:Number;

    private var _position:Number

    public static const POSITION_CHANGED:String = "Position Changed";

    public function Scrollbar(trackheight:Number) {

        this.trackheight = trackheight;

        startDragPosition = new Point();
        track = new Quad(20, trackheight, 0x3d3d3d);
        addChild(track);

        thumb = new Quad(20, 30, 0x777777);
        thumb.addEventListener(TouchEvent.TOUCH, touchHandler);
        addChild(thumb);

    }

    private function touchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(thumb);
        if(touch != null){
            switch(touch.phase){
                case TouchPhase.BEGAN:
                    draggedObject = event.currentTarget as DisplayObject;
                    touch.getLocation(thumb,startDragPosition);
                    break;

                case TouchPhase.MOVED:
                    if(draggedObject != null){
                        if( touch.globalY - startDragPosition.y < trackheight - thumb.height && touch.globalY - startDragPosition.y > 0){
                            draggedObject.y = touch.globalY - startDragPosition.y;
                            position = thumb.y/(track.height - thumb.height);

                        }

                    }
                    break;

                case TouchPhase.ENDED:
                    draggedObject = null;
                    break;
            }
        }
    }

    public function get position():Number {
        return _position;
    }

    public function set position(value:Number):void {
        if(_position != value){
            _position = value;
            dispatchEvent(new Event(POSITION_CHANGED));
        }
    }
}
}
