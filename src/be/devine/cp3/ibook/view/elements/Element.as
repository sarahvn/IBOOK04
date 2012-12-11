/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 15:34
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elements {
import be.devine.cp3.ibook.vo.ElementVO;

import starling.display.Sprite;

public class Element extends Sprite {
    private var _elementVO:ElementVO;

    public function element(elementVO:ElementVO){
        this._elementVO = elementVO;
    }
}
}
