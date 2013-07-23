#import "FirstViewController.h"

#import "NIKFontAwesomeIconFactory.h"
#import "NIKFontAwesomeIconFactory+iOS.h"

@interface FirstViewController()

@property (nonatomic, strong) IBOutlet UINavigationItem *navbar;
@property (nonatomic, copy) IBOutletCollection(UIButton) NSArray *buttons;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavigationItem];
    [self setupButtons];
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

- (void)setupButtons {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory buttonIconFactory];
    NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
    for (UIButton *button in _buttons) {
        if (icon == NIKFontAwesomeIconHeart) {
            NIKFontAwesomeIconFactory *textlessButtonFactory =
                [NIKFontAwesomeIconFactory textlessButtonIconFactory];
            textlessButtonFactory.colors = @[[UIColor redColor], [UIColor blackColor]];
            [button setImage:[textlessButtonFactory createImageForIcon:icon]
                    forState:UIControlStateNormal];
            [button setTitle:@"" forState:UIControlStateNormal];
        } else {
            factory.colors = @[[NIKColor darkGrayColor]];
            [button setImage:[factory createImageForIcon:icon] forState:UIControlStateNormal];
            [button setTitle:@"Hello" forState:UIControlStateNormal];
        }
        icon++;
    }
}

- (void)click {
}

@end
