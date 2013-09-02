# Haxe-should assertions for OpenFL

See https://github.com/sakari/haxe-should for introduction to the general should
assertion stuff.

# Features

 * match sprite images to bitmaps
 * test framework agnostic (I use massive unit but you don't have to)

# Usage

    using sakari.should.openfl.Should;
    ..
    var s = new Sprite();
    s.graphics.beginFill(0xff0000);
    s.graphics.drawRect(0, 0, 10, 10);
	s.should().matchImage(Assets.getBitmapData('images/some.png'));

See the tests at `test/ShouldTest.hx` for more examples.

# Testing

    openfl test test.xml cpp

# Contributing

Please do. 

# License

MIT


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/sakari/haxe-should-openfl/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

