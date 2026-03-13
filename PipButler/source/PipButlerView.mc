import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class PipButlerView extends WatchUi.WatchFace {

    hidden const TIME_COLOR = 0x00C864;
    hidden const TOP_MARGIN = 28;
    hidden const BOTTOM_MARGIN = 28;

    hidden var _isTimeAtBottom as Boolean = false;
    hidden var _screenHeight as Number = 0;

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        _screenHeight = dc.getHeight();
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var clockTime = System.getClockTime();
        var timeString = Lang.format(
            "$1$:$2$:$3$",
            [
                clockTime.hour.format("%02d"),
                clockTime.min.format("%02d"),
                clockTime.sec.format("%02d")
            ]
        );

        // Update the view
        var view = View.findDrawableById("TimeLabel") as Text;
        view.setColor(TIME_COLOR);
        view.locY = getTimeY(dc);
        view.setText(timeString);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

    function toggleTimePosition() as Void {
        _isTimeAtBottom = !_isTimeAtBottom;
        WatchUi.requestUpdate();
    }

    function getTimeY(dc as Dc) as Number {
        if (_screenHeight == 0) {
            _screenHeight = dc.getHeight();
        }

        if (_isTimeAtBottom) {
            return _screenHeight - dc.getFontHeight(Graphics.FONT_LARGE) - BOTTOM_MARGIN;
        }

        return TOP_MARGIN;
    }

}
