/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 27/11/12
 * Time: 19:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.factory.view.ElementViewFactory;
import be.devine.cp3.ibook.view.elements.Element;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.PageVO;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;

public class Page extends Sprite{

    private var pageVO:PageVO;
    private var bgwidth:int;
    private var bgheight:int;

    public function Page(pageVo:PageVO) {
        this.pageVO = pageVo;

        //trace(pageVo.elements);
        for each(var elementVO:ElementVO in pageVo.elements){
            var element:Element = ElementViewFactory.createElementFromVO(elementVO);
            addChild(element);
        }
    }
}
}
