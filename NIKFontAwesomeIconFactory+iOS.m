#if TARGET_OS_IPHONE

#import "NIKFontAwesomeIconFactory.h"

@implementation NIKFontAwesomeIconFactory(iOS)

+ (instancetype)buttonIconFactory {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory new];
    factory.size = 14.0;
    factory.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 8.0);
    return factory;
}

+ (instancetype)barButtonItemIconFactory {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory new];
    factory.colors = @[[UIColor whiteColor]];
    factory.size = 20.0;
    return factory;
}

+ (instancetype)tabBarItemIconFactory {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory new];
    factory.size = 20.0;
    factory.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    return factory;
}

@end

#endif
