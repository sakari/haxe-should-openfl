using sakari.should.Should;
using sakari.should.openfl.Should;

import flash.display.Sprite;
import openfl.Assets;

class ShouldTest {
    @Test
    public function test_sprite_image_comparison() {
        var s = new Sprite();
        s.graphics.beginFill(0xff0000);
        s.graphics.drawRect(0, 0, 10, 10);
        s.should().matchBitmap(Assets.getBitmapData('assets/images/test.png'));
    }
    
    @Test
    public function test_sprite_image_comparison_fails_if_images_do_not_match() {
        var s = new Sprite();
        s.graphics.beginFill(0x00ff00);
        s.graphics.drawRect(0, 0, 10, 10);
        (function() {
            s.should().matchBitmap(Assets.getBitmapData('assets/images/test.png'));
        }).should().throwException();
    }
}
