package sakari.should.openfl;

import flash.events.MouseEvent;
import flash.display.DisplayObjectContainer;

class Drag {
    var _on: DisplayObjectContainer;
    public function new(on, sx, sy) {
        _on = on;
        Simulate.mouseDown(on, sx, sy);
    }

    public function to(sx, sy) {
        Simulate.mouseMove(_on, sx, sy);
        Simulate.mouseUp(_on, sx, sy);
    }
}

class Simulate {
    static public function mouseMove(on, sx, sy) {
        var e = new MouseEvent(MouseEvent.MOUSE_MOVE);
        e.stageX = sx;
        e.stageY = sy;
        on.dispatchEvent(e);
    }

    static public function mouseDown(on, sx, sy) {
        var e = new MouseEvent(MouseEvent.MOUSE_DOWN);
        e.stageX = sx;
        e.stageY = sy;
        on.dispatchEvent(e);
    }

    static public function mouseUp(on, sx, sy) {
        var e = new MouseEvent(MouseEvent.MOUSE_UP);
        e.stageX = sx;
        e.stageY = sy;
        on.dispatchEvent(e);
    }

    static public function drag(on: DisplayObjectContainer
                                , stageX: Float, stageY: Float): Drag {
        return new Drag(on, stageX, stageY);
    }

    static public function click(on: DisplayObjectContainer
                                 , stageX: Float, stageY: Float) {
        Simulate.mouseDown(on, stageX, stageY);
        Simulate.mouseUp(on, stageX, stageY);
    }
}