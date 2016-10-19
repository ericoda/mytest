//
//  ViewController.m
//  test_swizzleMethod
//
//  Created by Eric on 18/10/2016.
//  Copyright © 2016 ericoda. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "UINavigationController+MZNavigationController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"``touchesBegantouchesBegantouchesBegantouchesBegantouchesBegan");
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}


@end
