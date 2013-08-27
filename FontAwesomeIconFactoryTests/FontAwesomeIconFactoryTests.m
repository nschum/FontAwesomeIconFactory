#import "NIKFontAwesomeIconFactory.h"

static const float EPSILON = 0.0001;

@interface FontAwesomeIconFactoryTests : SenTestCase
@end

@implementation FontAwesomeIconFactoryTests {
    NIKFontAwesomeIconFactory *_factory;
}

- (void)setUp {
    [super setUp];
    _factory = [NIKFontAwesomeIconFactory new];
}

- (void)testPaddedShouldBeDefault {
    assertThatBool(_factory.padded, equalToBool(YES));
}

- (void)testImagesShouldBeCreated {
    NIKImage *image = [_factory createImageForIcon:NIKFontAwesomeIconGlass];
    assertThat(@(image.size.width), greaterThan(@0.0));
    assertThat(@(image.size.height), greaterThan(@0.0));
}

- (void)testNonExistentImageShouldStillBeCreated {
    NIKImage *image = [_factory createImageForIcon:(NIKFontAwesomeIcon)0];
    assertThat(@(image.size.width), greaterThan(@0.0));
    assertThat(@(image.size.height), greaterThan(@0.0));
}

- (void)testImagesShouldBeSquare {
    _factory.square = YES;
    _factory.padded = NO;

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

- (void)testStrokeShouldNotIncreaseImageHeight {
    NIKFontAwesomeIconFactory *strokeFactory = [_factory copy];
    strokeFactory.strokeWidth = 5.0;

    for (NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
         icon <= NIKFontAwesomeIconRenren;
         icon++) {

        NIKImage *image = [_factory createImageForIcon:icon];
        NIKImage *strokeImage = [strokeFactory createImageForIcon:icon];
        assertThatDouble(strokeImage.size.height, equalToDouble(image.size.height));
    }
}

- (void)testImagesShouldNotExceedSize {
    float size = 24.0;
    _factory.size = size;
    _factory.padded = NO;

    for (NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
         icon <= NIKFontAwesomeIconFolderOpenAlt;
         icon++) {

        NIKImage *image = [_factory createImageForIcon:icon];
        assertThat(@(image.size.height), lessThanOrEqualTo(@(size + EPSILON)));
    }
}

- (void)testPaddedImagesShouldMatchSize {
    float size = 24.0;
    _factory.size = size;
    _factory.padded = YES;

    for (NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
         icon <= NIKFontAwesomeIconFolderOpenAlt;
         icon++) {

        NIKImage *image = [_factory createImageForIcon:icon];
        assertThatDouble(image.size.height, closeTo(size, EPSILON));
    }
}

- (void)testPaddedSquareImagesShouldMatchSize {
    float size = 24.0;
    _factory.size = size;
    _factory.square = YES;

    for (NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
         icon <= NIKFontAwesomeIconRenren;
         icon++) {

        NIKImage *image = [_factory createImageForIcon:icon];
        assertThatDouble(image.size.width, closeTo(size, EPSILON));
        assertThatDouble(image.size.height, closeTo(size, EPSILON));
    }
}

#if TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
- (void)testRenderingModeShouldBeAutomaticByDefault {
    assertThat(@(_factory.renderingMode), equalTo(@(UIImageRenderingModeAutomatic)));
}

- (void)testShouldReturnImageWithRenderingMode {
    _factory.renderingMode = UIImageRenderingModeAlwaysOriginal;
    NIKImage *image = [_factory createImageForIcon:NIKFontAwesomeIconGlass];
    assertThat(@(image.renderingMode), equalTo(@(UIImageRenderingModeAlwaysOriginal)));
}
#endif

@end
