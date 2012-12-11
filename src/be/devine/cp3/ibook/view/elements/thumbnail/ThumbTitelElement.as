/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 15:32
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elements.thumbnail {
import be.devine.cp3.ibook.factory.view.TextFieldFactory;
import be.devine.cp3.ibook.view.elements.*;
import be.devine.cp3.ibook.vo.TitelVO;

import starling.events.Event;
import starling.text.TextField;

public class ThumbTitelElement extends Element{
    private var titel:TextField;
    public function ThumbTitelElement(titelVO:TitelVO) {
        titel = TextFieldFactory.createThumbTitle(titelVO.content);
        addChild(titel);
    }
}
}
