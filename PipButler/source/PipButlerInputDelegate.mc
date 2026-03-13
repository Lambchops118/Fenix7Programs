import Toybox.Lang;
import Toybox.WatchUi;

class PipButlerInputDelegate extends WatchUi.InputDelegate {

    hidden var _view as PipButlerView;

    function initialize(view as PipButlerView) {
        InputDelegate.initialize();
        _view = view;
    }

    function onSwipe(swipeEvent as WatchUi.SwipeEvent) as Boolean {
        var direction = swipeEvent.getDirection();

        if (direction == WatchUi.SWIPE_LEFT || direction == WatchUi.SWIPE_RIGHT) {
            _view.toggleTimePosition();
            return true;
        }

        return false;
    }

}
