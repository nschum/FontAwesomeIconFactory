#import "NIKFontAwesomeIcon.h"
#import "NIKFontAwesomeIconTraits.h"

@import Foundation;
@import AppKit;

#pragma clang assume_nonnull begin

IB_DESIGNABLE
@interface NIKFontAwesomeButton: NSButton<NIKFontAwesomeIconTraits>

/**
 * An icon to use as the button's image.
 */
@property (nonatomic, assign) IBInspectable NIKFontAwesomeIcon icon;

/**
* Hex string representation of icon property used, because Interface Builder doesn't support enums.
*/
@property (nonatomic, assign) IBInspectable NSString *iconHex;

#pragma mark - NIKFontAwesomeIconTraits

// These are redefined here, so IBInspectable works

@property (nonatomic, assign) IBInspectable CGFloat size;
@property (nonatomic, assign, getter=isPadded) IBInspectable BOOL padded;
@property (nonatomic, assign, getter=isSquare) IBInspectable BOOL square;
@property (nonatomic, assign) IBInspectable CGFloat edgeInsetTop;
@property (nonatomic, assign) IBInspectable CGFloat edgeInsetBottom;
@property (nonatomic, assign) IBInspectable CGFloat edgeInsetLeft;
@property (nonatomic, assign) IBInspectable CGFloat edgeInsetRight;
@property (nonatomic, copy) IBInspectable NSColor *color;
#if __has_feature(nullability)
@property (nonatomic, copy, nullable) IBInspectable NSColor *color2;
#else
@property (nonatomic, copy) IBInspectable NSColor *color2;
#endif
@property (nonatomic, copy) IBInspectable NSColor *strokeColor;
@property (nonatomic, assign) IBInspectable CGFloat strokeWidth;

@end

#pragma clang assume_nonnull end
