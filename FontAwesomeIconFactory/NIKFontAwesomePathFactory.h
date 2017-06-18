#import "NIKFontAwesomeIcon.h"

@import CoreGraphics;

#pragma clang assume_nonnull begin

NS_SWIFT_NAME(FontAwesomePathFactory)
@interface NIKFontAwesomePathFactory : NSObject

- (CGPathRef)createPathForIcon:(NIKFontAwesomeIcon)icon
                        height:(CGFloat)height
                      maxWidth:(CGFloat)width CF_RETURNS_RETAINED NS_SWIFT_NAME(createPath(icon:height:maxWidth:));

@end

#pragma clang assume_nonnull end
