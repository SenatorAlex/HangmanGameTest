/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 16:22
 */
package model {

    import events.WordDictionaryEvent;

    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    import starling.events.EventDispatcher;

    public class Hangman extends EventDispatcher
    {
        private var _wins:int = 0;
        private var _loses:int = 0;
        private var _wordDictionary:Vector.<String> = new <String>[];
        private var _currentWord:String;

        public function Hangman()
        {
            loadWords();
        }

        private function loadWords():void
        {
            var loader = new URLLoader();
            loader.addEventListener(Event.COMPLETE,
                function onLoaded(e:Event):void {
                    var wordsArray:Array = e.target.data.split(",");
                    while(wordsArray.length > 0) {
                        _wordDictionary.push(wordsArray.pop());
                    }
                    dispatchEvent(new WordDictionaryEvent(WordDictionaryEvent.LOADED));
                }
            );

            loader.load(new URLRequest("file://C:/Work/HangmanGame/assets/text/words.txt"));
        }

        public function get wins():int {
            return _wins;
        }

        public function set wins(value:int):void {
            _wins = value;
        }

        public function get loses():int {
            return _loses;
        }

        public function set loses(value:int):void {
            _loses = value;
        }

        public function get currentWord():String {
            return _currentWord;
        }

        public function startNewGame():void
        {
            _currentWord = _wordDictionary[Math.floor(Math.random()* _wordDictionary.length)];
        }
    }
}
