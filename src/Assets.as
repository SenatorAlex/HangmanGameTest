/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 13:03
 */
package {

    import flash.display.Bitmap;
    import flash.media.Sound;
    import flash.utils.Dictionary;

    import starling.text.BitmapFont;
    import starling.text.TextField;

    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class Assets
    {
        private static var _gameTextures:Dictionary = new Dictionary();
        private static var _sounds:Dictionary = new Dictionary();
        private static var _gameTextureAtlas:TextureAtlas;

        [Embed(source="../assets/hangmanAssets.png")]
        public static const AtlasTextureHangman:Class;

        [Embed(source="../assets/hangmanAssets.xml", mimeType="application/octet-stream")]
        public static const AtlasXmlHangman:Class;

        [Embed(source="../assets/arial_24_white_0.png")]
        public static const ArialFontTexture:Class;

        [Embed(source="../assets/arial_24_white.fnt", mimeType="application/octet-stream")]
        public static const ArialFontXML:Class;

        [Embed(source="../assets/sounds/click.mp3")]
        public static var clickSound:Class;

        [Embed(source="../assets/sounds/win.mp3")]
        public static var winSound:Class;

        [Embed(source="../assets/sounds/lose.mp3")]
        public static var loseSound:Class;

        public static function getArialFont():BitmapFont
        {
            var fontTexture:Texture = Texture.fromBitmap(new ArialFontTexture());
            var fontXML:XML = XML(new ArialFontXML());

            var font:BitmapFont = new BitmapFont(fontTexture, fontXML);
            TextField.registerBitmapFont(font);
            return font;
        }

        public static function getAtlas():TextureAtlas
        {
            if (_gameTextureAtlas == null)
            {
                var texture:Texture = getTexture("AtlasTextureHangman");
                var xml:XML = XML(new AtlasXmlHangman());
                _gameTextureAtlas = new TextureAtlas(texture, xml);
            }
            return _gameTextureAtlas;
        }

        public static function getTexture(name:String):Texture
        {
            if (_gameTextures[name] == undefined)
            {
                var bitmap:Bitmap = new Assets[name]();
                _gameTextures[name] = Texture.fromBitmap(bitmap);
            }
            return _gameTextures[name];
        }

        public static function getSound(name:String):Sound
        {
            if (_sounds[name] == undefined)
            {
                _sounds[name] = new Assets[name]();
            }
            return _sounds[name];
        }
    }
}
