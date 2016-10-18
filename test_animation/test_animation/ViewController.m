//
//  ViewController.m
//  test_animation
//
//  Created by Eric on 18/10/2016.
//  Copyright © 2016 ericoda. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet CustomView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 动画选项设定
    animation.duration = 1.5f; // 动画持续时间
    animation.repeatCount = CGFLOAT_MAX; // 重复次数
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:0.f]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.f]; // 结束时的倍率
    
    // 添加动画
    [self.customView.layer addAnimation:animation forKey:@"scale-layer"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
