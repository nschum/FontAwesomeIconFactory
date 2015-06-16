#import "NIKFontAwesomeIconTypes.h"

#pragma clang assume_nonnull begin

@protocol NIKFontAwesomeIconTraits

/** The height in points of the created images. */
@property (nonatomic, assign) CGFloat size;

/** Additional padding added to the created images. */
@property (nonatomic, assign) NIKEdgeInsets edgeInsets;

@property (nonatomic, assign, getter=isPadded) BOOL padded;

/**
 * Create images to be square?
 *
 * If true, the icon is scaled to fit in a square of "size".
 * If false, "size" determines the icon's height.
 **/
@property (nonatomic, assign, getter=isSquare) BOOL square;

/**
 * Colors for the gradient filling the icon.
 *
 * Array of NSColor/UIColor.
 *
 * Default: dark gray
 */
@property (nonatomic, copy) GENERIC(NSArray, NIKColor *) *colors;

/**
 * Color for stroke around the icon.
 *
 * Default: black (but strokeWidth defaults to 0.0)
 */
@property (nonatomic, copy) NIKColor *strokeColor;

/**
 * Width for stroke around the icon.
 *
 * Default: 0.0
 */
@property (nonatomic, assign) CGFloat strokeWidth;

#if TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
/**
 * Rendering mode for the created images.
 *
 * By default, iOS will determine if color information is retained when using the image in a
 * control.  Set this to UIImageRenderingModeAlwaysOriginal to always get color.
 *
 * Default: UIImageRenderingModeAutomatic
 */
@property(nonatomic, assign) UIImageRenderingMode renderingMode NS_AVAILABLE_IOS(7_0);
#endif

@end

#pragma clang assume_nonnull end
