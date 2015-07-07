#import "NIKFontAwesomeImageView.h"

#import "NIKFontAwesomeIconFactory+iOS.h"

@interface NIKFontAwesomeImageView()

@property (nonatomic, strong) NIKFontAwesomeIconFactory *factory;

@end

@implementation NIKFontAwesomeImageView

@synthesize size = _size;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _size = -1.0;
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _size = -1.0;
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (NIKFontAwesomeIconFactory *)factory {
    if (!_factory) {
        _factory = [NIKFontAwesomeIconFactory new];
        if (_size < 0.0) {
            [self updateAutomaticSize];
        }
    }
    return _factory;
}

- (void)setNeedsUpdateImage {
    self.image = nil;
    if (self.superview) {
        self.image = [self.factory createImageForIcon:_icon];
    }
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (!self.image) {
        self.image = [self.factory createImageForIcon:_icon];
    }
}

- (void)setBounds:(CGRect)bounds {
    if (_size < 0.0) {
        [self updateAutomaticSize];
    }
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

- (void)updateAutomaticSize {
    assert(_size < 0.0);
    CGSize size = self.bounds.size;
    _factory.size = size.width < size.height ? size.width : size.height;
    [self setNeedsUpdateImage];
}

#pragma mark - NIKFontAwesomeIconTraits

- (CGFloat)size {
    return _size;
}

- (void)setSize:(CGFloat)size {
    _size = size;
    if (size < 0.0) {
        [self updateAutomaticSize];
    } else {
        self.factory.size = size;
        [self setNeedsUpdateImage];
    }
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

- (GENERIC(NSArray, UIColor *) *)colors {
    return self.factory.colors;
}

- (void)setColors:(GENERIC(NSArray, UIColor *) *)colors {
    self.factory.colors = [colors copy];
    [self setNeedsUpdateImage];
}

- (UIColor *)color {
    return self.colors[0];
}

- (void)setColor:(UIColor *)color {
    UIColor *color2 = self.color2;
    if (color2) {
        self.colors = @[color, color2];
    } else {
        self.colors = @[color];
    }
}

- (UIColor *)color2 {
    return self.colors.count > 1 ? self.colors[1] : nil;
}

- (void)setColor2:(UIColor *)color2 {
    self.colors = @[self.color, color2];
}

- (UIColor *)strokeColor {
    return self.factory.strokeColor;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
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

#if TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

- (UIImageRenderingMode)renderingMode {
    return self.factory.renderingMode;
}

- (void)setRenderingMode:(UIImageRenderingMode)renderingMode {
    self.factory.renderingMode = renderingMode;
    [self setNeedsUpdateImage];
}

#endif

@end
