/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 13:09
 */
package screens {

    import enums.Screen;

    import events.NavigationEvent;
    import events.NavigationEventParams;

    import model.Hangman;

    import starling.display.Button;
    import starling.display.Image;
    import starling.events.Event;
    import starling.text.TextField;
    import starling.text.TextFieldAutoSize;

    public class GameRules extends BaseScreen
    {
        private var _hangman:Image;
        private var _title:TextField;
        private var _rules:Image;
        private var _playButton:Button;
        private var _gameModel:Hangman;

        public function GameRules(gameModel:Hangman)
        {
            super();
            _gameModel = gameModel;
        }

        override protected function addedToStageHandler(event:Event):void
        {
            drawScreen();
        }

        private function drawScreen():void
        {
            _title = new TextField(200, 50, "Hangman game", Assets.getArialFont().name, 24, 0xFFFFFF);
            _title.autoSize = TextFieldAutoSize.HORIZONTAL;
            _title.x = 13;
            _title.y = 15;
            addChild(_title);

            _rules = new Image(Assets.getAtlas().getTexture("rules"));
            _rules.x = 14;
            _rules.y = 90;
            addChild(_rules);

            _hangman = new Image(Assets.getAtlas().getTexture("hangman"));
            _hangman.x = 3;
            _hangman.y = 261;
            addChild(_hangman);

            _playButton = new Button(Assets.getAtlas().getTexture("play"));
            _playButton.x = 100;
            _playButton.y = 316;
            addChild(_playButton);

            addEventListener(Event.TRIGGERED, triggeredHandler);
        }

        private function triggeredHandler(event:Event):void
        {
            var buttonClicked:Button = event.target as Button;
            if (buttonClicked == _playButton) {
                _gameModel.startNewGame();
                dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,
                        new NavigationEventParams(Screen.RULES, Screen.GAME), true));
            }
        }
    }
}
