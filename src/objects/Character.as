/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 15:41
 */
package objects {

    import starling.display.Image;
    import starling.text.TextField;

    public class Character extends BaseObject
    {
        private var _bg:Image;
        private var _textField:TextField;
        private var _char:String;

        public function Character() {
            super();
        }

        override protected function draw():void
        {
            _bg = new Image(Assets.getAtlas().getTexture("cell"));
            addChild(_bg);

            _textField = new TextField(24, 33, _char, Assets.getArialFont().name, 24, 0xFFFFFF);
            addChild(_textField);
        }

        public function setText(value:String):void
        {
            _char = value.toUpperCase();
        }
    }
}
