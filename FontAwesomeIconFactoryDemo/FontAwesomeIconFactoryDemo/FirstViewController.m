#import "FirstViewController.h"

#import "NIKFontAwesomeIconFactory.h"
#import "NIKFontAwesomeIconFactory+iOS.h"

@interface FirstViewController()

@property (nonatomic, strong) IBOutlet UINavigationItem *navbar;
@property (nonatomic, strong) IBOutlet UIButton *button;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavigationItem];
    [self setupButton];
}

- (void)setupNavigationItem {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory barButtonItemIconFactory];

    UIBarButtonItem *leftItem = [UIBarButtonItem new];
    leftItem.image = [factory createImageForIcon:NIKFontAwesomeIconReply];
    leftItem.action = @selector(click);
    leftItem.target = self;
    leftItem.enabled = YES;
    leftItem.style = UIBarButtonItemStyleDone;

    _navbar.leftBarButtonItem = leftItem;

    UIBarButtonItem *rightItem = [UIBarButtonItem new];
    rightItem.image = [factory createImageForIcon:NIKFontAwesomeIconDownload];
    rightItem.action = @selector(click);
    rightItem.target = self;
    rightItem.enabled = YES;

    _navbar.rightBarButtonItem = rightItem;
}

- (void)setupButton {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory buttonIconFactory];
    [_button setImage:[factory createImageForIcon:NIKFontAwesomeIconBellAlt]
             forState:UIControlStateNormal];
    [_button setTitle:@"Your text" forState:UIControlStateNormal];
}

- (void)click {
}

@end
