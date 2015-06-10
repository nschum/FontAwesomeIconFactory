#if TARGET_OS_IPHONE
@import UIKit;
typedef UIEdgeInsets NIKEdgeInsets;
typedef UIColor NIKColor;
#else
@import AppKit;
typedef NSEdgeInsets NIKEdgeInsets;
typedef NSColor NIKColor;
#endif

#if __clang_major__ >= 7
#define GENERIC(COLLECTION, T) COLLECTION<T>
#else
#define GENERIC(COLLECTION, T) COLLECTION
#endif
