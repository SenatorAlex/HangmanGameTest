/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 14:43
 */
package events {

    import starling.events.Event;

    public class NavigationEvent extends Event
    {
        public static const CHANGE_SCREEN:String = "changeScreen";

        private var _params:NavigationEventParams;

        public function NavigationEvent(type:String, params:NavigationEventParams = null, bubbles:Boolean = false, data:Object = null)
        {
            super(type, bubbles, data);
            _params = params;
        }

        public function get params():NavigationEventParams {
            return _params;
        }
    }
}
