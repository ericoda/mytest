//
//  ViewController.m
//  RACDemo_Objc
//
//  Created by Eric on 2017/7/6.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"


/*
 Notes:

 this is just RAC simple usage demo for those newbies as me.
 for more usages may check the link below:
 https://github.com/ReactiveCocoa/ReactiveCocoa/blob/2.x-maintenance/README.md
 thanks for your attention.

 */


@interface ViewController () <VTMagicViewDataSource, VTMagicViewDelegate, VTMagicReuseProtocol>

@property (nonatomic, copy) NSArray *vcs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.magicView.navigationColor = [UIColor whiteColor];
    self.magicView.sliderColor = [UIColor redColor];
    self.magicView.sliderWidth = 15;
    self.magicView.sliderHeight= 1;
    self.magicView.layoutStyle = VTLayoutStyleDivide;
    self.magicView.switchStyle = VTSwitchStyleStiff;
    self.magicView.navigationHeight = 40.f;
    self.magicView.dataSource = self;
    self.magicView.delegate = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.magicView reloadData];
}

- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    return self.vcs;
}


- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {
    NSString * idf = NSStringFromClass([UIButton class]);
    UIButton *btn = [magicView dequeueReusableItemWithIdentifier:idf];
    if (!btn) {
        btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    }
    return btn;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageInde {
    UIViewController *vc = nil;
    if (pageInde < self.vcs.count) {
        NSString *idf = self.vcs[pageInde];
        vc = [magicView dequeueReusablePageWithIdentifier:idf];
        if (!vc) {
            vc = [NSClassFromString(idf) new];
        }
    }
    return vc;
}

- (NSArray *)vcs {
    if (!_vcs) {
        _vcs = @[NSStringFromClass([AViewController class]),
                 NSStringFromClass([BViewController class]),
                 NSStringFromClass([CViewController class]),];
    }
    return _vcs;
}

@end
