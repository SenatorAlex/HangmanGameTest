/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 14:49
 */
package events {

    import screens.BaseScreen;

    public class NavigationEventParams
    {
        private var _origin:String;
        private var _destination:String;

        public function NavigationEventParams(origin:String, destination:String) {
            _origin = origin;
            _destination = destination;
        }

        public function get origin():String {
            return _origin;
        }

        public function get destination():String {
            return _destination;
        }
    }
}
