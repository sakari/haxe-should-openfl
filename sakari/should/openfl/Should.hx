package sakari.should.openfl;
import flash.display.BitmapData;
import sakari.should.Should;
import sys.io.File;

class Should {
    static var imageCounter = 0;

    public static function matchBitmap(lhs: ShouldExpr, expected: BitmapData): ShouldExpr {
        var b = new BitmapData(lhs.lhs.width, lhs.lhs.height);
        b.draw(lhs.lhs);
        compare(b, expected);
        return lhs;
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
        trace('writing $fileName');
        var b = img.encode('png');
        var f = File.write(fileName, true);
        f.writeString(b.asString());
        f.close();
        return fileName;
    }
}


