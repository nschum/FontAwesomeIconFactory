#import "NIKFontAwesomePathFactory.h"

#import <CoreText/CoreText.h>

static NSString *const FONT_NAME = @"FontAwesome";
static NSString *const FONT_EXTENSION = @"otf";

@implementation NIKFontAwesomePathFactory

- (CGPathRef)createPathForIcon:(NIKFontAwesomeIcon)icon
                        height:(CGFloat)height
                      maxWidth:(CGFloat)width CF_RETURNS_RETAINED {

    CGPathRef path = [self createPathForIcon:icon height:height];
    CGRect bounds = CGPathGetBoundingBox(path);
    if (bounds.size.width > width) {
        CGPathRef scaledPath = [self createScaledPath:path scale:bounds.size.width / width];
        CGPathRelease(path);
        return scaledPath;
    } else {
        return path;
    }
}

- (CGPathRef)createPathForIcon:(NIKFontAwesomeIcon)icon height:(CGFloat)height CF_RETURNS_RETAINED {
    CTFontRef font = [self font];
    CGFloat ascent = CTFontGetAscent(font);
    CGAffineTransform scale = CGAffineTransformMakeScale(height / ascent, height / ascent);
    return CTFontCreatePathForGlyph(font, [self glyphForIcon:icon], &scale);
}

- (CTFontRef)font {
    static CTFontRef __font;
    static dispatch_once_t __onceToken;
    dispatch_once(&__onceToken, ^{
        NSURL *url = [[NSBundle mainBundle] URLForResource:FONT_NAME
                                             withExtension:FONT_EXTENSION];
        NSAssert(url, @"Font Awesome not found in bundle.", nil);
        CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
        CGFontRef cgFont = CGFontCreateWithDataProvider(provider);
        CTFontDescriptorRef fontDescriptor =
            CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)@{});

        __font = CTFontCreateWithGraphicsFont(cgFont, 0, NULL, fontDescriptor);

        CFRelease(fontDescriptor);
        CFRelease(cgFont);
        CFRelease(provider);
    });
    return __font;
}

- (CGPathRef)createScaledPath:(CGPathRef)path scale:(CGFloat)factor CF_RETURNS_RETAINED {
    CGAffineTransform scale = CGAffineTransformMakeScale(factor, factor);
    return CGPathCreateCopyByTransformingPath(path, &scale);
}

- (CGGlyph)glyphForIcon:(NIKFontAwesomeIcon)icon {
    UniChar const characters[] = {icon};
    CGGlyph glyph;
    CTFontGetGlyphsForCharacters([self font], characters, &glyph, 1);
    return glyph;
}

@end
