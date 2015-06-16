#import "NIKFontAwesomeIcon.h"
#import "NIKFontAwesomeIconTraits.h"

@import Foundation;

#pragma clang assume_nonnull begin

#if TARGET_OS_IPHONE
@import UIKit;
typedef UIImage NIKImage;
#else
@import AppKit;
typedef NSImage NIKImage;
#endif

/**
 * Creates images from Font Awesome glyphs.
 *
 * On Mountain Lion, the generated image is resolution-independent. The size and strokeWidth are
 * only relative to each other.
 *
 * "Font Awesome" (http://fortawesome.github.com/Font-Awesome/) must be part of the app bundle.
 **/
@interface NIKFontAwesomeIconFactory : NSObject<NSCopying, NIKFontAwesomeIconTraits>

/** Create an NSImage/UIImage from an icon. */
- (NIKImage *)createImageForIcon:(NIKFontAwesomeIcon)icon;

#if TARGET_OS_IPHONE
+ (instancetype)buttonIconFactory;
+ (instancetype)textlessButtonIconFactory;
+ (instancetype)barButtonItemIconFactory;
+ (instancetype)tabBarItemIconFactory;
#else
+ (instancetype)bevelButtonIconFactory;
+ (instancetype)pushButtonIconFactory;
+ (instancetype)toolbarItemIconFactory;
#endif

@end

#pragma clang assume_nonnull end
