/**
 * Created with IntelliJ IDEA.
 * User: Sarah
 * Date: 27/11/12
 * Time: 14:57
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.factory.view.ThumbnailViewFactory;
import be.devine.cp3.ibook.view.elements.Element;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.PageVO;

import starling.display.Quad;

import starling.display.Sprite;

public class Thumbnail extends Sprite{

    private var _pageVO:PageVO;
    private var _quad:Quad;
    private var thumbsprite:Sprite;

    public function Thumbnail(pageVO:PageVO) {
        thumbsprite = new Sprite();
        addChild(thumbsprite);
        _pageVO = pageVO;
        _quad = new Quad(200,150,0x3D3D3D);
        thumbsprite.addChild(_quad);
        for each(var elementVO:ElementVO in pageVO.elements){
            var element:Element = ThumbnailViewFactory.createElementFromVO(elementVO);
            thumbsprite.addChild(element);
        }
    }
}
}
