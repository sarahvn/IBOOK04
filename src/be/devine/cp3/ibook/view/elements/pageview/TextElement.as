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
import be.devine.cp3.ibook.vo.TextVO;

import starling.text.TextField;

public class TextElement extends Element{
    private var text:TextField;
    public function TextElement(textVO:TextVO) {
        text = TextFieldFactory.createTextField(textVO.content);
        addChild(text);

        text.x = 50;
        text.y = -40;
    }
}
}