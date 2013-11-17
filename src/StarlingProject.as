/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 12:28
 */
package {

    import flash.display.Sprite;

    import starling.core.Starling;

    [SWF(frameRate="60", width="320", height="460")]
    public class StarlingProject extends Sprite{
        private var _starling:Starling;

        public function StarlingProject() {
            _starling = new Starling(HangmanGame, stage);
            _starling.antiAliasing = 0;
            _starling.start();
        }

    }
}
