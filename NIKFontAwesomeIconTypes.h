#if TARGET_OS_IPHONE
@import UIKit;
typedef UIEdgeInsets NIKEdgeInsets;
typedef UIColor NIKColor;
#else
@import AppKit;
typedef NSEdgeInsets NIKEdgeInsets;
typedef NSColor NIKColor;
#endif
