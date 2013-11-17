/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 15:38
 */
package objects {

    import starling.display.Sprite;
    import starling.events.Event;

    public class BaseObject extends Sprite
    {
        public function BaseObject()
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        }

        private function addedToStageHandler(event:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
            draw();
        }

        protected function draw():void
        {
        }
    }
}
