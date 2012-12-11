/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 20/11/12
 * Time: 17:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.model {
import be.devine.cp3.ibook.vo.PageVO;
import be.devine.cp3.ibook.vo.PageVO;

import flash.display.Sprite;

import flash.events.Event;
import flash.events.EventDispatcher;

import flash.net.URLLoader;
import flash.net.URLRequest;


public class AppModel extends EventDispatcher{
    private var _currentPageIndex:int;
    private var _currentPage:PageVO;
    private var _pages:Vector.<PageVO>;
    private var _timelineVisible:Boolean;
    private var pagesChanged:Boolean;
    private var currentPageChanged:Boolean;
    private var _hasNextpage:Boolean;
    private var _hasPreviouspagePage:Boolean;

    public static const PAGES_CHANGED:String = "pages Changed";
    public static const CURRENT_PAGE_CHANGED:String = "current Page Changed";
    public static var instance:AppModel;

    public static function getInstance():AppModel{
        if(instance == null){
            instance = new AppModel(new Enforcer());
        }

        return instance;
    }

    public function AppModel(e:Enforcer) {
        if(e == null){
            throw new Error("AppModel is a SingleTon")
        }
    }

    public function get currentPageIndex():int {
        if(_pages && _currentPage){
            return _pages.indexOf(_currentPage);
        }
        return -1;
    }

    public function get currentPage():PageVO {
        return _currentPage;
    }

    public function set currentPage(value:PageVO):void {
        if(_currentPage != value){
            _currentPage = value;
            currentPageChanged = true;
            commitProperties();
            dispatchEvent(new Event(CURRENT_PAGE_CHANGED));
        }
    }

    public function get pages():Vector.<PageVO> {
        return _pages;
    }

    public function set pages(value:Vector.<PageVO>):void {
        if(_pages != value){
            _pages = value;
            pagesChanged = true;
            commitProperties();
            dispatchEvent(new Event(PAGES_CHANGED));

        }
    }

    public function commitProperties():void{
        if(pagesChanged){
            pagesChanged = false;

            if(_pages){
                _currentPage = _pages[0];
            }
        }

        if(currentPageChanged){
            //trace(_currentPageIndex);
            currentPageChanged = false;
        }

    }

    public function goToNexPage():void{
        if(hasNextPage){
            currentPage = _pages[currentPageIndex + 1];
        }

    }

    public function goToPrevousPage():void{
        if(hasPreviousPage){
            currentPage = _pages[currentPageIndex - 1];
        }
    }

    public function get hasPreviousPage():Boolean {
        var index:int = currentPageIndex;
        return index > 0;
    }

    public function get hasNextPage():Boolean {
        var index:int = currentPageIndex;

        return (index > -1 && (index + 1) < _pages.length)
    }

    public function get timelineVisible():Boolean {
        return _timelineVisible;
    }

    public function set timelineVisible(value:Boolean):void {
       if(_timelineVisible != value)
       {
           _timelineVisible = value;
       }

    }

    public function set currentPageIndex(value:int):void {
        if(_currentPageIndex != value){
            _currentPageIndex = value;
            _currentPageIndex = _pages.indexOf(_currentPage);
        }
    }
}
}

internal class Enforcer{}
