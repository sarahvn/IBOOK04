/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 14:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.vo {
import be.devine.cp3.ibook.vo.BackgroundVO;
import be.devine.cp3.ibook.vo.ButtonVO;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.ImageVO;
import be.devine.cp3.ibook.vo.TextVO;
import be.devine.cp3.ibook.vo.TitelVO;

public class ElementVoFactory {

    public static function createElement(element:XML):ElementVO{
        switch("" + element.@type){
            case"background": return createBackgroundVO(element);
            case"titel": return createTitelVO(element);
            case"text": return createTextVO(element);
            case"button": return createButtonVO(element);
            case "image": return createImageVO(element);
        }
        return null
    }

    public static function createBackgroundVO(element:XML):BackgroundVO{
        var elementVO:BackgroundVO = new BackgroundVO();
        elementVO.url = element.url;
        return elementVO;
    }

    public static function createTitelVO(element:XML):TitelVO{
        var elementVO:TitelVO = new TitelVO();
        elementVO.content = element.content;
        //trace("create title");
        return elementVO;
    }

    public static function createTextVO(element:XML):TextVO{
        var elementVO:TextVO = new TextVO();
        elementVO.content = element.content;
        //trace("create text");
        return elementVO;
    }

        public static function createButtonVO(element:XML):ButtonVO{
        var elementVO:ButtonVO = new ButtonVO();
        elementVO.target = int(element.target);
        //trace("create button");
        return elementVO;
    }

    public static function createImageVO(element:XML):ImageVO
    {
        var imageVO:ImageVO = new ImageVO();
        imageVO.url = element.url;
        imageVO.xpos = element.xpos;
        imageVO.ypos = element.ypos;
        trace("create image");
        return imageVO;
    }


}
}
