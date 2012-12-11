/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 11:47
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.service {
import be.devine.cp3.ibook.factory.vo.PageVoFactory;
import be.devine.cp3.ibook.vo.PageVO;

import flash.net.URLLoader;
import flash.net.URLRequest;

import flash.events.Event;

import flash.events.EventDispatcher;

public class PageService extends EventDispatcher{
    public var pages:Vector.<PageVO>;
    public function PageService() {

    }

    public function loadXML():void{
        var xmlLoader:URLLoader = new URLLoader();
        xmlLoader.addEventListener(Event.COMPLETE, xmlLoadedHandler);
        xmlLoader.load(new URLRequest('assets/xml/paginas.xml'));
    }

    private function xmlLoadedHandler(e:Event):void{
        var pages:Vector.<PageVO> = new Vector.<PageVO>();
        var ingeladenXML:XML = new XML(e.target.data);
        for each(var pagina:XML in ingeladenXML.pagina){
            pages.push(PageVoFactory.createPageVO(pagina));
        }
        this.pages = pages;
        dispatchEvent(new Event(Event.COMPLETE));
    }

}
}
