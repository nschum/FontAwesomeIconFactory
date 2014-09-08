#import "NIKFontAwesomeIconFactory.h"

static const float EPSILON = 0.0001;

@interface FontAwesomeIconFactoryTests : XCTestCase
@property (nonatomic, strong) NIKFontAwesomeIconFactory *factory;
@property (nonatomic, strong) NSSet *gaps;
@end

@implementation FontAwesomeIconFactoryTests

- (void)setUp {
    [super setUp];
    _factory = [NIKFontAwesomeIconFactory new];
    _gaps = [[NSSet alloc] initWithObjects:@0xf116, @0xf117, nil];
}

- (void)eachIcon:(void (^)(NIKFontAwesomeIcon))iterator {
    for (NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
         icon <= NIKFontAwesomeIconAngellist;
         icon++) {
        if (![_gaps containsObject:@(icon)]) {
            iterator(icon);
        }
    }
}

- (void)eachImage:(void (^)(NIKImage *))iterator {
    [self eachIcon:^(NIKFontAwesomeIcon icon) {
        iterator([self.factory createImageForIcon:icon]);
    }];
}

#pragma mark - tests

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

    [self eachImage:^(NIKImage *image) {
        assertThatDouble(image.size.height, equalToDouble(image.size.width));
    }];
}

- (void)testEdgeInsetsShouldIncreaseImageSize {
    NIKFontAwesomeIconFactory *insetFactory = [_factory copy];
    insetFactory.edgeInsets = (NIKEdgeInsets){1.0, 3.0, 5.0, 7.0};

    [self eachIcon:^(NIKFontAwesomeIcon icon) {
        NIKImage *image = [self.factory createImageForIcon:icon];
        NIKImage *insetImage = [insetFactory createImageForIcon:icon];
        if (image.size.height < 0.0005) {
            assertThatDouble(insetImage.size.height, equalToDouble(image.size.height + 6.0));
        }
        assertThatDouble(insetImage.size.height, equalToDouble(image.size.height + 6.0));
        assertThatDouble(insetImage.size.width, equalToDouble(image.size.width + 10.0));
    }];
}

- (void)testStrokeShouldNotIncreaseImageHeight {
    NIKFontAwesomeIconFactory *strokeFactory = [_factory copy];
    strokeFactory.strokeWidth = 5.0;

    [self eachIcon:^(NIKFontAwesomeIcon icon) {
        NIKImage *image = [self.factory createImageForIcon:icon];
        NIKImage *strokeImage = [strokeFactory createImageForIcon:icon];
        assertThatDouble(strokeImage.size.height, equalToDouble(image.size.height));
    }];
}

- (void)testImagesShouldNotExceedSize {
    float size = 24.0;
    _factory.size = size;
    _factory.padded = NO;

    [self eachImage:^(NIKImage *image) {
        assertThat(@(image.size.height), lessThanOrEqualTo(@(size + EPSILON)));
    }];
}

- (void)testPaddedImagesShouldMatchSize {
    float size = 24.0;
    _factory.size = size;
    _factory.padded = YES;

    [self eachImage:^(NIKImage *image) {
        assertThatDouble(image.size.height, closeTo(size, EPSILON));
    }];
}

- (void)testPaddedSquareImagesShouldMatchSize {
    float size = 24.0;
    _factory.size = size;
    _factory.square = YES;

    [self eachImage:^(NIKImage *image) {
        assertThatDouble(image.size.width, closeTo(size, EPSILON));
        assertThatDouble(image.size.height, closeTo(size, EPSILON));
    }];
}

#if TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
- (void)testRenderingModeShouldBeAutomaticByDefault {
    assertThat(@(_factory.renderingMode), equalTo(@(UIImageRenderingModeAutomatic)));
}

- (void)testRenderingModeShouldBeOriginalAfterSettingColor {
    NSArray *colors = @[[UIColor redColor]];

    _factory.colors = colors;

    assertThat(_factory.colors, equalTo(colors));
    assertThat(@(_factory.renderingMode), equalTo(@(UIImageRenderingModeAlwaysOriginal)));
}

- (void)testRenderingModeShouldNotChangeAfterSettingItToNotAutomatic {
    NSArray *colors = @[[UIColor redColor]];
    _factory.renderingMode = UIImageRenderingModeAlwaysTemplate;

    _factory.colors = colors;

    assertThat(_factory.colors, equalTo(colors));
    assertThat(@(_factory.renderingMode), equalTo(@(UIImageRenderingModeAlwaysTemplate)));
}

- (void)testShouldReturnImageWithRenderingMode {
    _factory.renderingMode = UIImageRenderingModeAlwaysOriginal;
    NIKImage *image = [_factory createImageForIcon:NIKFontAwesomeIconGlass];
    assertThat(@(image.renderingMode), equalTo(@(UIImageRenderingModeAlwaysOriginal)));
}
#endif

@end
