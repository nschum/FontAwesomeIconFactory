#if !TARGET_OS_IPHONE

#import "NIKFontAwesomeIconFactory.h"

@import AppKit;

/** Preconfigured factories for typical OSX image sizes. */
@interface NIKFontAwesomeIconFactory(OSX)

+ (instancetype)bevelButtonIconFactory;
+ (instancetype)pushButtonIconFactory;
+ (instancetype)toolbarItemIconFactory;

@end

#endif
