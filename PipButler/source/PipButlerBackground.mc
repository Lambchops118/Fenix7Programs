import Toybox.Application;
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
        var backgroundColor = Application.Properties.getValue("BackgroundColor") as Number;

        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, backgroundColor);
        dc.clear();

        var scanLineColor = getScanLineColor(backgroundColor);
        var scanBandColor = getScanBandColor(backgroundColor);
        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(scanLineColor, Graphics.COLOR_TRANSPARENT);

        for (var y = 0; y < height; y += 6) {
            dc.drawLine(0, y, width - 1, y);
            if (y + 1 < height) {
                dc.drawLine(0, y + 1, width - 1, y + 1);
            }
        }

        dc.setColor(scanBandColor, Graphics.COLOR_TRANSPARENT);

        for (var bandY = 3; bandY < height; bandY += 6) {
            dc.drawLine(0, bandY, width - 1, bandY);
        }
    }

    function getScanLineColor(backgroundColor as Number) as Number {
        var red = (backgroundColor >> 16) & 0xFF;
        var green = (backgroundColor >> 8) & 0xFF;
        var blue = backgroundColor & 0xFF;
        var brightness = (red + green + blue) / 3;

        if (brightness < 96) {
            red = clampChannel(red + 24);
            green = clampChannel(green + 24);
            blue = clampChannel(blue + 24);
        } else {
            red = (red * 3) / 5;
            green = (green * 3) / 5;
            blue = (blue * 3) / 5;
        }

        return (red << 16) | (green << 8) | blue;
    }

    function getScanBandColor(backgroundColor as Number) as Number {
        var red = ((backgroundColor >> 16) & 0xFF) / 4;
        var green = ((backgroundColor >> 8) & 0xFF) / 4;
        var blue = (backgroundColor & 0xFF) / 4;

        if (backgroundColor == 0x000000) {
            return 0x0A140A;
        }

        return (red << 16) | (green << 8) | blue;
    }

    function clampChannel(value as Number) as Number {
        if (value > 255) {
            return 255;
        }

        return value;
    }

}
