package {

    import avmplus.factoryXml;

    import enums.Screen;

    import events.NavigationEvent;
    import events.WordDictionaryEvent;

    import flash.utils.Dictionary;

    import model.Hangman;

    import screens.BaseScreen;
    import screens.GameRules;
    import screens.GameScreen;

    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Event;

    public class HangmanGame extends Sprite
    {
        private var _screens:Dictionary;

        private var _bg:Image;
        private var _screenGameRules:GameRules;
        private var _screenGame:GameScreen;
        private var _gameModel:Hangman;
        private var _wordsLoaded:Boolean = false;

        public function HangmanGame()
        {
            super();
            _screens = new Dictionary();
            _gameModel = new Hangman();
            _gameModel.addEventListener(WordDictionaryEvent.LOADED, gameModel_loadedHandler);

            this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        }

        private function addedToStageHandler(event:Event):void
        {
            new Theme(stage);

            addEventListener(NavigationEvent.CHANGE_SCREEN, changeScreenHandler);

            drawBG();

            _screenGameRules = new GameRules(_gameModel);
            _screens[Screen.RULES] = _screenGameRules;
            addChild(_screenGameRules);
            if (_wordsLoaded) {
                _screenGameRules.initialize();
            }

            _screenGame = new GameScreen(_gameModel);
            _screens[Screen.GAME] = _screenGame;
            _screenGame.disposeTemporarily();
            addChild(_screenGame);
        }

        private function drawBG():void
        {
            _bg = new Image(Assets.getAtlas().getTexture("bg"));
            this.addChild(_bg);
        }

        private function changeScreenHandler(event:NavigationEvent):void
        {
            var origin:BaseScreen = _screens[event.params.origin] as BaseScreen;
            var destination:BaseScreen = _screens[event.params.destination] as BaseScreen;
            origin.disposeTemporarily();
            destination.initialize();
        }

        private function gameModel_loadedHandler(event:WordDictionaryEvent):void
        {
            _wordsLoaded = true;
        }
    }
}
