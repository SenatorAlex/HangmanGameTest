/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 15:00
 */
package screens {

    import starling.display.Sprite;
    import starling.events.Event;

    public class BaseScreen extends Sprite
    {
        public function BaseScreen() {
            super();

            this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        }

        public function disposeTemporarily():void
        {
            visible = false;
        }

        public function initialize():void
        {
            this.visible = true;
        }

        protected function addedToStageHandler(event:Event):void
        {
            //drawScreen();
        }
    }
}
