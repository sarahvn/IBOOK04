/**
 * Created with IntelliJ IDEA.
 * User: Sarah
 * Date: 27/11/12
 * Time: 14:56
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class TimelineButton extends Sprite{


    [Embed(source="/../media/spriteSheet.xml", mimeType="application/octet-stream")]
    public static const SpriteSheetXML:Class;

    [Embed(source="/../media/spriteSheet.png")]
    public static const SpriteSheetTexture:Class;


    public function TimelineButton(){

        var texture:Texture = Texture.fromBitmap(new SpriteSheetTexture());
        var xml:XML = XML(new SpriteSheetXML());
        var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
        var frames:Vector.<Texture> = textureAtlas.getTextures("timeline");

        var spritesheet:MovieClip = new MovieClip(frames, 10);
        spritesheet.loop = false;
        addChild(spritesheet);

        Starling.juggler.add(spritesheet);
    }
}
}
