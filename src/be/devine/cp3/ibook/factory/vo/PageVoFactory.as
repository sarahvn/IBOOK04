/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 14:45
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.vo {
import be.devine.cp3.ibook.view.Page;
import be.devine.cp3.ibook.vo.PageVO;

public class PageVoFactory {
    public static function createPageVO(pagexml:XML):PageVO{
        var pageVo:PageVO = new PageVO();
        for each(var element:XML in pagexml.elements.element){
            pageVo.elements.push(ElementVoFactory.createElement(element));
        }
        return pageVo;
    }
}
}
