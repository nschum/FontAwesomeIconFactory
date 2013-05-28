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
    STAssertTrue(image.size.width > 0.0, nil);
    STAssertTrue(image.size.height > 0.0, nil);
}

@end
