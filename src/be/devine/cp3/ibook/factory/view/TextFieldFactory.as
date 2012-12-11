/**
 * Created with IntelliJ IDEA.
 * User: Jessy
 * Date: 4/12/12
 * Time: 16:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.view {


import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TextFieldFactory {
    [Embed(source="/../media/fonts/ProximaNovaExCn-Bold.otf", embedAsCFF="false", fontFamily="ProximaNovaBold")]
    private static const ProximaNovaBold:Class;

    [Embed(source="/../media/fonts/ProximaNovaExCn-Regular.otf", embedAsCFF="false", fontFamily="ProximaNovaRegular")]
    private static const ProximaNovaRegular:Class;

    public static function createTitle(text:String):TextField{
        var titel:TextField = new TextField(200, 100, text, "ProximaNovaBold",32,0XFFFFFF);
        titel.hAlign = HAlign.CENTER;
        titel.vAlign = VAlign.CENTER;
        return titel;
    }

    public static function createThumbTitle(text:String):TextField{
        var titel:TextField = new TextField(100, 100, text, "ProximaNovaRegular",9,0XFFFFFF);
        titel.hAlign = HAlign.CENTER;
        titel.vAlign = VAlign.TOP;
        return titel;
    }

    public static function createTextField(text:String):TextField{
        var textField:TextField = new TextField(500, 500, text, "ProximaNovaRegular", 18, 0XFFFFFF);
        textField.hAlign = HAlign.LEFT;
        textField.vAlign = VAlign.CENTER;
        return textField;
    }

    public static function createThumbTextField(text:String):TextField{
        var textField:TextField = new TextField(150, 100, text, "ProximaNovaRegular", 4, 0XFFFFFF);
        textField.hAlign = HAlign.LEFT;
        textField.vAlign = VAlign.CENTER;
        return textField;
    }

}
}