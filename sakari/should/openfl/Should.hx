package sakari.should.openfl;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.geom.Point;
import sakari.should.Should;
import sys.io.File;

class Should {
    static var imageCounter = 0;

    public static function croppedWith(lhs: ShouldExpr, rect: Rectangle): ShouldExpr {
        var b = new BitmapData(Std.int(rect.width),
                               Std.int(rect.height));
        b.copyPixels(toBitmap(lhs.lhs)
                     , rect
                     , new Point(0, 0));
        return sakari.should.Should.should(b);
    }

    public static function matchBitmap(lhs: ShouldExpr, expected: BitmapData): ShouldExpr {
        compare(toBitmap(lhs.lhs), expected);
        return lhs;
    }

    private static function toBitmap(s: Dynamic): BitmapData {
        if(Type.getClassName(Type.getClass(s)) == 'BitmapData') {
            return s;
        }
        var b = new BitmapData(Std.int(s.width)
                               , Std.int(s.height));
        b.draw(s);
        return b;
    }
    private static function compare(actual: BitmapData, expected: BitmapData) {
        if(actual.width != expected.width || 
           actual.height != expected.height ) {
            fail('image sizes differ', actual, expected);
        }

        for(x in 0...actual.height) {
            for(y in 0...actual.width) {
                if(actual.getPixel(x, y) != expected.getPixel(x, y)) {
                    fail('image contents differ', actual, expected);
                }
            }
        }
    }

    private static function fail(err: String, actual: BitmapData, expected: BitmapData) {
        var e = writeOut('expected', expected);
        var a = writeOut('actual', actual);
        throw '$err: $e $a';    
    }

    private static function writeOut(tag:String, img: BitmapData): String {
        var fileName = '${imageCounter}_$tag.png';
        if(img.height == 0) {
            trace('image ${fileName} is empty');
            return fileName;
        }
        trace('writing $fileName');
        var b = img.encode('png');
        var f = File.write(fileName, true);
        f.writeString(b.asString());
        f.close();
        return fileName;
    }
}


