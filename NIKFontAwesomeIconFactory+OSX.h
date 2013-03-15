#if !TARGET_OS_IPHONE

#import "NIKFontAwesomeIconFactory.h"

/** Preconfigured factories for typical OSX image sizes. */
@interface NIKFontAwesomeIconFactory(OSX)

+ (instancetype)bevelButtonIconFactory;
+ (instancetype)pushButtonIconFactory;
+ (instancetype)toolbarItemIconFactory;

@end

#endif
