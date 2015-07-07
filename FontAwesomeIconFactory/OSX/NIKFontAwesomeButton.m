#import "NIKFontAwesomeButton.h"

#import "NIKFontAwesomeIconFactory+OSX.h"

@interface NIKFontAwesomeButton()

@property (nonatomic, strong) NIKFontAwesomeIconFactory *factory;
@property (nonatomic, strong) NIKImage *iconImage;

@end

@implementation NIKFontAwesomeButton

- (NIKFontAwesomeIconFactory *)factory {
    if (!_factory) {
        _factory = [NIKFontAwesomeIconFactory new];
        _factory.size = 16.0;
    }
    return _factory;
}

- (NSImage *)iconImage {
    if (!_iconImage) {
        _iconImage = [self.factory createImageForIcon:_icon];
    }
    return _iconImage;
}

- (void)setNeedsUpdateImage {
    _iconImage = nil;
    if (self.superview) {
        self.image = self.iconImage;
    }
}

- (void)viewWillMoveToSuperview:(NSView *)newSuperview {
    [super viewWillMoveToSuperview:newSuperview];
    self.image = [self.factory createImageForIcon:NIKFontAwesomeIconRss];
}

- (void)setIcon:(NIKFontAwesomeIcon)icon {
    _icon = icon;
    [self setNeedsUpdateImage];
}

- (NSString *)iconHex {
    return [NSString stringWithFormat:@"%02X", self.icon];
}

- (void)setIconHex:(NSString *)iconHex {
    self.icon = strtol(iconHex.UTF8String, NULL, 16);
}

#pragma mark - NIKFontAwesomeIconTraits

- (CGFloat)size {
    return self.factory.size;
}

- (void)setSize:(CGFloat)size {
    self.factory.size = size;
    [self setNeedsUpdateImage];
}

- (BOOL)isPadded {
    return self.factory.padded;
}

- (void)setPadded:(BOOL)padded {
    self.factory.padded = padded;
    [self setNeedsUpdateImage];
}

- (BOOL)isSquare {
    return self.factory.square;
}

- (void)setSquare:(BOOL)square {
    self.factory.square = square;
    [self setNeedsUpdateImage];
}

- (NIKEdgeInsets)edgeInsets {
    return self.factory.edgeInsets;
}

- (void)setEdgeInsets:(NIKEdgeInsets)edgeInsets {
    self.factory.edgeInsets = edgeInsets;
    [self setNeedsUpdateImage];
}

- (CGFloat)edgeInsetTop {
    return self.edgeInsets.top;
}

- (void)setEdgeInsetTop:(CGFloat)edgeInsetTop {
    NIKEdgeInsets edgeInsets = self.edgeInsets;
    edgeInsets.top = edgeInsetTop;
    self.edgeInsets = edgeInsets;
}

- (CGFloat)edgeInsetBottom {
    return self.edgeInsets.bottom;
}

- (void)setEdgeInsetBottom:(CGFloat)edgeInsetBottom {
    NIKEdgeInsets edgeInsets = self.edgeInsets;
    edgeInsets.bottom = edgeInsetBottom;
    self.edgeInsets = edgeInsets;
}

- (CGFloat)edgeInsetLeft {
    return self.edgeInsets.left;
}

- (void)setEdgeInsetLeft:(CGFloat)edgeInsetLeft {
    NIKEdgeInsets edgeInsets = self.edgeInsets;
    edgeInsets.left = edgeInsetLeft;
    self.edgeInsets = edgeInsets;
}

- (CGFloat)edgeInsetRight {
    return self.edgeInsets.right;
}

- (void)setEdgeInsetRight:(CGFloat)edgeInsetRight {
    NIKEdgeInsets edgeInsets = self.edgeInsets;
    edgeInsets.right = edgeInsetRight;
    self.edgeInsets = edgeInsets;
}

- (GENERIC(NSArray, NSColor *) *)colors {
    return self.factory.colors;
}

- (void)setColors:(GENERIC(NSArray, NSColor *) *)colors {
    self.factory.colors = [colors copy];
    [self setNeedsUpdateImage];
}

- (NSColor *)color {
    return self.colors[0];
}

- (void)setColor:(NSColor *)color {
    NSColor *color2 = self.color2;
    if (color2) {
        self.colors = @[color, color2];
    } else {
        self.colors = @[color];
    }
}

- (NSColor *)color2 {
    return self.colors.count > 1 ? self.colors[1] : nil;
}

- (void)setColor2:(NSColor *)color2 {
    self.colors = @[self.color, color2];
}

- (NSColor *)strokeColor {
    return self.factory.strokeColor;
}

- (void)setStrokeColor:(NSColor *)strokeColor {
    self.factory.strokeColor = [strokeColor copy];
    [self setNeedsUpdateImage];
}

- (CGFloat)strokeWidth {
    return self.factory.strokeWidth;
}

- (void)setStrokeWidth:(CGFloat)strokeWidth {
    self.factory.strokeWidth = strokeWidth;
    [self setNeedsUpdateImage];
}

@end
