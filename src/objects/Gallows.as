/**
 * Created by IntelliJ IDEA.
 * User: sony
 * Date: 16.11.13
 * Time: 13:50
 */
package objects {

    import flash.geom.Point;

    import starling.display.Image;

    public class Gallows extends BaseObject
    {
        private var _gallowsArt:Vector.<Image>;
        private var _currentStep:int = 0;

        private var _stepCoordinates:Vector.<Point> = new <Point>[];

        public function get currentStep():int {
            return _currentStep;
        }

        public function Gallows()
        {
            super();
            _gallowsArt = new <Image>[];
            _stepCoordinates.push(new Point(0, 177));
            _stepCoordinates.push(new Point(7, 209));
            _stepCoordinates.push(new Point(35, 11));
            _stepCoordinates.push(new Point(53, 9));
            _stepCoordinates.push(new Point(40, 0));
            _stepCoordinates.push(new Point(114, 4));
            _stepCoordinates.push(new Point(106, 4));
        }

        override protected function draw():void
        {
        }

        public function displayNextStep():void
        {
            _currentStep++;

            var step:Image = new Image(Assets.getAtlas().getTexture("V" + _currentStep));
            step.x = _stepCoordinates[_currentStep-1].x;
            step.y = _stepCoordinates[_currentStep-1].y;
            addChild(step);
        }

    }
}
