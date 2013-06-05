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

@end
