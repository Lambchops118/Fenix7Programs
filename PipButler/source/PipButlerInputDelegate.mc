import Toybox.Lang;
import Toybox.WatchUi;

class PipButlerInputDelegate extends WatchUi.BehaviorDelegate {

    hidden var _view as PipButlerView;

    function initialize(view as PipButlerView) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    // Left swipe on touch devices
    function onPreviousPage() as Boolean {
        _view.toggleTimePosition();
        return true;
    }

    // Right swipe on touch devices
    function onNextPage() as Boolean {
        _view.toggleTimePosition();
        return true;
    }

}
