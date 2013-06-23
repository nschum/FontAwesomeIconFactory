#import "AppDelegate.h"
#import "NIKFontAwesomeIconFactory.h"
#import "NIKFontAwesomeIconFactory+OSX.h"

@interface AppDelegate()<NSToolbarDelegate>

@property (nonatomic, strong) IBOutlet NSToolbar *toolbar;

@property (nonatomic, strong) IBOutlet NSButton *bevelButtonLeft;
@property (nonatomic, strong) IBOutlet NSButton *pushButtonLeft;

@property (nonatomic, strong) IBOutlet NSButton *bevelButtonCenter;
@property (nonatomic, strong) IBOutlet NSButton *pushButtonCenter;

@property (nonatomic, strong) IBOutlet NSButton *bevelButtonRight;
@property (nonatomic, strong) IBOutlet NSButton *pushButtonRight;

@property (nonatomic, strong) IBOutlet NSButton *bevelButtonMultiline;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [self setupBevelButton];
    [self setupPushButton];
}

- (void)setupBevelButton {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory bevelButtonIconFactory];
    _bevelButtonLeft.image = [factory createImageForIcon:NIKFontAwesomeIconBookmark];
    _bevelButtonCenter.image = [factory createImageForIcon:NIKFontAwesomeIconPicture];
    _bevelButtonRight.image = [factory createImageForIcon:NIKFontAwesomeIconCheck];
    _bevelButtonMultiline.image = [factory createImageForIcon:NIKFontAwesomeIconComments];
}

- (void)setupPushButton {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory pushButtonIconFactory];
    _pushButtonLeft.image = [factory createImageForIcon:NIKFontAwesomeIconFacetimeVideo];

    factory.edgeInsets = NSEdgeInsetsMake(0.0, 0.0, 2.0, 0.0);
    _pushButtonCenter.image = [factory createImageForIcon:NIKFontAwesomeIconRss];

    _pushButtonRight.image = [factory createImageForIcon:NIKFontAwesomeIconRefresh];
    factory.edgeInsets = NSEdgeInsetsMake(0.0, 0.0, 2.0, 8.0);
}

#pragma mark - NSToolbarDelegate

- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar {
    return self.toolbarItemIdentifiers;
}

- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar {
    return self.toolbarItemIdentifiers;
}

- (NSArray *)toolbarSelectableItemIdentifiers:(NSToolbar *)toolbar {
    return self.toolbarItemIdentifiers;
}

- (NSArray *)toolbarItemIdentifiers {
    NSMutableArray *items = [NSMutableArray new];


    for (NIKFontAwesomeIcon icon = NIKFontAwesomeIconGlass;
         icon <= NIKFontAwesomeIconRenren;
         icon++) {

        NSString *identifier = [NSString stringWithFormat:@"%d", icon];
        [items addObject:identifier];
    }
    return items;
}


- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar
     itemForItemIdentifier:(NSString *)itemIdentifier
 willBeInsertedIntoToolbar:(BOOL)flag {

    NSToolbarItem *item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
    item.action = @selector(click:);
    item.target = self;

    NIKFontAwesomeIcon icon = [itemIdentifier intValue];
    item.label = [NSString stringWithFormat:@"0x%x", icon];;

    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory toolbarItemIconFactory];
    factory.colors = @[[NSColor darkGrayColor], [NSColor blackColor]];
    factory.strokeColor = [NSColor whiteColor];
    factory.strokeWidth = 1.0;

    item.image = [factory createImageForIcon:icon];

    return item;
}

- (void)click:(id)sender {
}

@end
