/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 15:32
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elements.pageview {
import be.devine.cp3.ibook.view.elements.*;
import be.devine.cp3.ibook.factory.view.TextFieldFactory;
import be.devine.cp3.ibook.vo.TitelVO;

import starling.events.Event;

import starling.text.TextField;

public class TitelElement extends Element{
    private var titel:TextField;
    public function TitelElement(titelVO:TitelVO) {
        titel = TextFieldFactory.createTitle(titelVO.content);
        addChild(titel);

        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler)
    }

    private function addedToStageHandler(event:Event):void {
        titel.x = (stage.stageWidth - titel.width)/2;

        /* --- RESIZE --- */
        stage.addEventListener(Event.RESIZE, resizeHandler);
    }

    private function resizeHandler(event:Event):void {
        titel.x = (stage.stageWidth - titel.width)/2;
    }
}
}
