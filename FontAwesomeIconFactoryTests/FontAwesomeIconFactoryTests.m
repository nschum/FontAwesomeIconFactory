#import "NIKFontAwesomeIconFactory.h"

@interface FontAwesomeIconFactoryTests : SenTestCase
@end

@implementation FontAwesomeIconFactoryTests {
    NIKFontAwesomeIconFactory *_factory;
}

- (void)setUp {
    [super setUp];
    _factory = [NIKFontAwesomeIconFactory new];
}

- (void)testImagesShouldBeCreated {
    NIKImage *image = [_factory createImageForIcon:NIKFontAwesomeIconGlass];
    assertThat(@(image.size.width), greaterThan(@0.0));
    assertThat(@(image.size.height), greaterThan(@0.0));
}

- (void)testImagesShouldBeSquare {
    _factory.square = YES;

    for (NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
         icon <= NIKFontAwesomeIconRenren;
         icon++) {

        NIKImage *image = [_factory createImageForIcon:icon];
        assertThatDouble(image.size.height, equalToDouble(image.size.width));
    }
}

- (void)testEdgeInsetsShouldIncreaseImageSize {
    NIKFontAwesomeIconFactory *insetFactory = [_factory copy];
    insetFactory.edgeInsets = (NIKEdgeInsets){1.0, 3.0, 5.0, 7.0};

    for (NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
         icon <= NIKFontAwesomeIconRenren;
         icon++) {

        NIKImage *image = [_factory createImageForIcon:icon];
        NIKImage *insetImage = [insetFactory createImageForIcon:icon];
        assertThatDouble(insetImage.size.height, equalToDouble(image.size.height + 6.0));
        assertThatDouble(insetImage.size.width, equalToDouble(image.size.width + 10.0));
    }
}

@end
