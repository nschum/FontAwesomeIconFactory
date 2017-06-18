@import Foundation;
#import "NIKFontAwesomeIconTypes.h"

#pragma clang assume_nonnull begin

/** Renders a path using a CGContext. */
NS_SWIFT_NAME(FontAwesomePathRenderer)
@interface NIKFontAwesomePathRenderer : NSObject

@property (nonatomic, assign) CGPathRef path;
@property (nonatomic, assign) CGPoint offset;

@property (nonatomic, copy)
NSArray<NIKColor*> *colors;
@property (nonatomic, assign) CGColorRef strokeColor;
@property (nonatomic, assign) CGFloat strokeWidth;

- (void)renderInContext:(CGContextRef)context;

@end

#pragma clang assume_nonnull end
