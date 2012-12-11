/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 15:30
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.view {
import be.devine.cp3.ibook.view.elements.pageview.BackgroundElement;
import be.devine.cp3.ibook.view.elements.pageview.ButtonElement;
import be.devine.cp3.ibook.view.elements.Element;
import be.devine.cp3.ibook.view.elements.pageview.ImageElement;
import be.devine.cp3.ibook.view.elements.pageview.TextElement;
import be.devine.cp3.ibook.view.elements.pageview.TitelElement;
import be.devine.cp3.ibook.vo.BackgroundVO;
import be.devine.cp3.ibook.vo.ButtonVO;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.ImageVO;
import be.devine.cp3.ibook.vo.TextVO;
import be.devine.cp3.ibook.vo.TitelVO;


public class ElementViewFactory {
    public static function createElementFromVO(elementVO:ElementVO):Element{
        if(elementVO is BackgroundVO)
            return new BackgroundElement(elementVO as BackgroundVO);
        if(elementVO is TextVO)
            return new TextElement(elementVO as TextVO);
        if(elementVO is TitelVO)
            return new TitelElement(elementVO as TitelVO);
        if(elementVO is ButtonVO)
            return new ButtonElement(elementVO as ButtonVO);
        if(elementVO is ImageVO)
            return new ImageElement(elementVO as ImageVO);
        return Element(elementVO);

    }
}
}
