/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 9/12/12
 * Time: 02:43
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.view {
import be.devine.cp3.ibook.view.elements.Element;
import be.devine.cp3.ibook.view.elements.thumbnail.ThumbBackgroundElement;
import be.devine.cp3.ibook.view.elements.thumbnail.ThumbButtonElement;
import be.devine.cp3.ibook.view.elements.thumbnail.ThumbImageElement;
import be.devine.cp3.ibook.view.elements.thumbnail.ThumbTextElement;
import be.devine.cp3.ibook.view.elements.thumbnail.ThumbTitelElement;
import be.devine.cp3.ibook.vo.BackgroundVO;
import be.devine.cp3.ibook.vo.ButtonVO;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.ImageVO;
import be.devine.cp3.ibook.vo.TextVO;
import be.devine.cp3.ibook.vo.TitelVO;

public class ThumbnailViewFactory {
    public static function createElementFromVO(elementVO:ElementVO):Element{
        if(elementVO is BackgroundVO)
            return new ThumbBackgroundElement(elementVO as BackgroundVO);
        if(elementVO is TextVO)
            return new ThumbTextElement(elementVO as TextVO);
        if(elementVO is TitelVO)
            return new ThumbTitelElement(elementVO as TitelVO);
        if(elementVO is ButtonVO){
            return new ThumbButtonElement(elementVO as ButtonVO);
        }
        if(elementVO is ImageVO){
            return new ThumbImageElement(elementVO as ImageVO);
        }
        return Element(elementVO);

    }
}
}
