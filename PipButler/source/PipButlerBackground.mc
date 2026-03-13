import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    function initialize() {
        var dictionary = {
            :identifier => "Background"
        };

        Drawable.initialize(dictionary);
    }

    function draw(dc as Dc) as Void {
        var baseColor = getBaseColor();

        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, baseColor);
        dc.clear();

        var scanLineColor = getScanLineColor();
        var scanBandColor = getScanBandColor();
        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(scanLineColor, Graphics.COLOR_TRANSPARENT);

        for (var y = 0; y < height; y += 6) {
            dc.fillRectangle(0, y, width, 2);
        }

        dc.setColor(scanBandColor, Graphics.COLOR_TRANSPARENT);

        for (var bandY = 3; bandY < height; bandY += 6) {
            dc.fillRectangle(0, bandY, width, 2);
        }
    }

    function getBaseColor() as Number {
        return 0x000100;
    }

    function getScanLineColor() as Number {
        return 0x006419;
    }

    function getScanBandColor() as Number {
        return 0x000100;
    }

}
