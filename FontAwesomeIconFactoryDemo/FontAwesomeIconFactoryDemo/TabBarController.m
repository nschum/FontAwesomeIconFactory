#import "TabBarController.h"

#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory.h>
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory+iOS.h>

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory tabBarItemIconFactory];

    UITabBarItem *item0 = self.tabBar.items[0];
    item0.image = [factory createImageForIcon:NIKFontAwesomeIconLaptop];
}

@end
