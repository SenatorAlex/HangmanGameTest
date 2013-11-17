/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 17.11.13
 * Time: 0:19
 */
package events {

    import starling.events.Event;

    public class WordDictionaryEvent extends Event
    {
        public static const LOADED:String = "loaded";

        public function WordDictionaryEvent(type:String, bubbles:Boolean = false, data:Object = null) {
            super(type, bubbles, data);
        }
    }
}
