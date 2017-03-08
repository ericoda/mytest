//
//  ViewController.m
//  RollingIndicator
//
//  Created by Eric on 2017/2/8.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "ViewController.h"
#import "RollingIndicator.h"
#import <Masonry.h>
#import <lottie-ios/Lottie/Lottie.h>
@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController {
    RollingIndicator *_indicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *bar = self.navigationController.navigationBar;
    bar.tintColor = [UIColor redColor];
    bar.backgroundColor = [UIColor blueColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    bar.translucent = YES;
    bar.shadowImage = [UIImage new];
    [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    bar.backIndicatorTransitionMaskImage = [UIImage new];
//    [bar setTitleVerticalPositionAdjustment:20 forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    return;
    if (_indicator != nil) {
        [_indicator removeFromSuperview];
        _indicator = nil;
    }
    _indicator = [[RollingIndicator alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
    _indicator.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_indicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
