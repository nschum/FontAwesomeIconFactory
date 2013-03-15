#import "TabBarController.h"

#import "NIKFontAwesomeIconFactory.h"
#import "NIKFontAwesomeIconFactory+iOS.h"

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory tabBarItemIconFactory];

    UITabBarItem *item0 = self.tabBar.items[0];
    item0.image = [factory createImageForIcon:NIKFontAwesomeIconLaptop];

    UITabBarItem *item1 = self.tabBar.items[1];
    item1.image = [factory createImageForIcon:NIKFontAwesomeIconMedkit];
}

@end
