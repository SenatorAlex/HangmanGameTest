/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 15:37
 */
package objects {

    public class CharacterList extends BaseObject
    {
        private var _characters:Vector.<Character>;
        private const _characterWidth:int = 30;

        public function CharacterList()
        {
            super();
        }

        override protected function draw():void
        {
            _characters = new <Character>[];
        }

        public function addCharacter(char:String):void
        {
            var character:Character = new Character();
            character.setText(char);
            character.x = _characters.length * _characterWidth;
            _characters.push(character);
            addChild(character);
        }

        public function getSize():int
        {
            return _characters.length;
        }
    }
}
