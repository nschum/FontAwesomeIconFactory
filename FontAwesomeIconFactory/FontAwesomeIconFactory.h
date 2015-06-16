@import Foundation;

//! Project version number for FontAwesomeIconFactory.
FOUNDATION_EXPORT double FontAwesomeIconFactoryVersionNumber;

//! Project version string for FontAwesomeIconFactory.
FOUNDATION_EXPORT const unsigned char FontAwesomeIconFactoryVersionString[];

#import "NIKFontAwesomeButton.h"
#import "NIKFontAwesomeIcon.h"
#import "NIKFontAwesomeIconFactory.h"
#import "NIKFontAwesomeIconTraits.h"
#import "NIKFontAwesomeIconTypes.h"
#import "NIKFontAwesomeImageView.h"
#import "NIKFontAwesomePathFactory.h"
#import "NIKFontAwesomePathRenderer.h"

#import "NIKFontAwesomeButton.h"
#import "NIKFontAwesomeImageView.h"

#if TARGET_OS_IPHONE
#import "NIKFontAwesomeIconFactory+iOS.h"
#import "NIKFontAwesomeTabBarItem.h"
#else
#import "NIKFontAwesomeIconFactory+OSX.h"
#endif
