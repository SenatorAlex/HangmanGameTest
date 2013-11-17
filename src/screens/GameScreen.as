/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 13:49
 */
package screens {

    import cc.cote.feathers.softkeyboard.KeyEvent;
    import cc.cote.feathers.softkeyboard.SoftKeyboard;
    import cc.cote.feathers.softkeyboard.layouts.Layout;
    import cc.cote.feathers.softkeyboard.layouts.QwertySimple;

    import enums.Screen;

    import events.NavigationEvent;
    import events.NavigationEventParams;

    import flash.media.Sound;

    import model.Hangman;

    import objects.CharacterList;
    import objects.Gallows;
    import starling.events.Event;
    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;
    import starling.text.TextField;
    import starling.text.TextFieldAutoSize;

    public class GameScreen extends BaseScreen
    {
        private var _characterList:CharacterList;
        private var _gallows:Gallows;
        private var _keyboard:SoftKeyboard;
        private var _score:TextField;
        private var _gameModel:Hangman;
        private var _endGameTextField:TextField;
        private var _clickSound:Sound;
        private var _winSound:Sound;
        private var _loseSound:Sound;

        public function GameScreen(gameModel:Hangman)
        {
            super();
            _gameModel = gameModel;
        }

        override protected function addedToStageHandler(event:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

            drawGameScreen();

            initSounds();
        }

        private function drawGameScreen():void
        {
            _characterList = new CharacterList();
            _characterList.x = 10;
            _characterList.y = 46;
            addChild(_characterList);

            _gallows = new Gallows();
            _gallows.x = 39;
            _gallows.y = 108;
            addChild(_gallows);

            // Instantiate a keyboard with a single layout
            var l:Layout = new QwertySimple();

            // Create keyboard and add it to the stage
            _keyboard = new SoftKeyboard(l, 280, 140);
            _keyboard.addEventListener(KeyEvent.KEY_UP, onKeyUp);
            addChild(_keyboard);

            // Center keyboard
            _keyboard.validate();
            _keyboard.x = 30 ;
            _keyboard.y = stage.stageHeight - _keyboard.height - 40;

            var currentScoreString:String = "Won:" + _gameModel.wins + " Lost:" + _gameModel.loses;
            _score = new TextField(200, 20, currentScoreString, Assets.getArialFont().name, 18, 0xFFFFFF);
            _score.autoSize = TextFieldAutoSize.HORIZONTAL;
            addChild(_score);

            // Center score
            _score.x = stage.stageWidth / 2 - _score.width / 2 - 10;
            _score.y = stage.stageHeight - 30;
        }

        private function initSounds():void
        {
            _clickSound = Assets.getSound("clickSound");
            _winSound = Assets.getSound("winSound");
            _loseSound = Assets.getSound("loseSound");
        }

        public function onKeyUp(e:KeyEvent):void
        {
            e.stopImmediatePropagation();

            _clickSound.play();

            if (_gameModel.currentWord.charAt(_characterList.getSize()) == e.char)
            {
                _characterList.addCharacter(e.char);
                if (_gameModel.currentWord.length == _characterList.getSize())
                {
                    _gameModel.wins++;
                    endGame(true);
                }
            }
            else
            {
                _gallows.displayNextStep();
                if (_gallows.currentStep == 7) {
                    _gameModel.loses++;
                    endGame(false);
                }
            }
        }

        private function endGame(isWin:Boolean):void
        {
            _score.text = "Won:" + _gameModel.wins + " Lost:" + _gameModel.loses;
            _keyboard.removeEventListener(KeyEvent.KEY_UP, onKeyUp);
            _keyboard.visible = false;

            if (isWin)
            {
                _winSound.play();
                var endGameText:String = "Congratulations you guessed the word!";
                _endGameTextField = new TextField(300, 50, endGameText, Assets.getArialFont().name, 24, 0xFFFFFF);
                _endGameTextField.x = stage.stageWidth / 2 - _endGameTextField.width / 2 - 10;
                _endGameTextField.y = 200;
                addChild(_endGameTextField);
            }
            else
            {
                _loseSound.play();
            }

            stage.addEventListener(TouchEvent.TOUCH, touchHandler);
        }

        private function touchHandler(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);
            if (touch && touch.phase == TouchPhase.BEGAN) {
                stage.removeEventListener(TouchEvent.TOUCH, touchHandler);
                reset();
                dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,
                        new NavigationEventParams(Screen.GAME, Screen.RULES), true));

            }
        }

        public function reset():void
        {
            super.disposeTemporarily();

            removeChild(_characterList);
            _characterList.dispose();

            removeChild(_gallows);
            _gallows.dispose();

            if (_endGameTextField){
                removeChild(_endGameTextField);
                _endGameTextField.dispose();
            }

            removeChild(_keyboard);
            _keyboard.dispose();

            removeChild(_score);
            _score.dispose();

            drawGameScreen();
        }
    }
}
