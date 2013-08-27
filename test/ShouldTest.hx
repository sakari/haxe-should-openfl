using sakari.should.Should;
using sakari.should.openfl.Should;

import flash.geom.Rectangle;
import flash.display.Sprite;
import openfl.Assets;

class ShouldTest {
    @Test
    public function test_comparing_empty_image_to_another_image_fails() {
        var s = new Sprite();
        (function() {
            s.should().matchBitmap(Assets.getBitmapData('assets/images/test.png'));
        }).should().throwException();
    }

    @Test
    public function test_sprite_image_comparison() {
        return;
        var s = new Sprite();
        s.graphics.beginFill(0xff0000);
        s.graphics.drawRect(0, 0, 10, 10);
        s.should().matchBitmap(Assets.getBitmapData('assets/images/test.png'));
    }
    
    @Test
    public function test_sprite_image_comparison_fails_if_images_do_not_match() {
        return;
        var s = new Sprite();
        s.graphics.beginFill(0x00ff00);
        s.graphics.drawRect(0, 0, 10, 10);
        (function() {
            s.should().matchBitmap(Assets.getBitmapData('assets/images/test.png'));
        }).should().throwException();
    }

    @Test
    public function test_sprite_image_can_be_cropped_before_matching() {
        var s = new Sprite();
        s.graphics.beginFill(0x00ff00);
        s.graphics.drawRect(0, 0, 10, 10);
        s.graphics.beginFill(0xff0000);
        s.graphics.drawRect(10, 10, 10, 10);
        s.should()
            .croppedWith(new Rectangle(10, 10, 10, 10))
            .matchBitmap(Assets.getBitmapData('assets/images/test.png'));
    }

    @Test
    public function test_sprite_cropped_images_can_fail_to_match() {
        return;
        var s = new Sprite();
        s.graphics.beginFill(0xff0000);
        s.graphics.drawRect(0, 0, 10, 10);
        (function() {
            s.should()
                .croppedWith(new Rectangle(1, 1, 10, 10))
                .matchBitmap(Assets.getBitmapData('assets/images/test.png'));
        }).should().throwException();
    }
}
