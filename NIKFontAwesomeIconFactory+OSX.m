#if !TARGET_OS_IPHONE

#import "NIKFontAwesomeIconFactory.h"

@implementation NIKFontAwesomeIconFactory(OSX)

+ (instancetype)bevelButtonIconFactory {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory new];
    factory.size = 14.0;
    factory.edgeInsets = NSEdgeInsetsMake(0, 2.0, 0, 2.0);
    return factory;
}

+ (instancetype)pushButtonIconFactory {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory new];
    factory.size = 14.0;
    factory.edgeInsets = NSEdgeInsetsMake(2.0, 10.0, 0, 0.0);
    return factory;
}

+ (instancetype)toolbarItemIconFactory {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory new];
    factory.size = 32.0;
    factory.square = YES;
    return factory;
}

@end

#endif
