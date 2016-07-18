//
//  ViewController.m
//  test_addChildViewController
//
//  Created by Eric on 16/7/13.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "ViewController.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"

@interface ViewController ()
@property (nonatomic, strong)FirstVC *first;
@property (nonatomic, strong)SecondVC *second;
@property (nonatomic, strong)ThirdVC *third;
@property (nonatomic, strong)UIViewController *currentVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addChildViewController:self.first];
    [self addChildViewController:self.second];
    [self addChildViewController:self.third];
    
    [self.contentView addSubview:self.first.view];
    self.currentVC = self.first;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(FirstVC *)first{
    if (!_first) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _first = (FirstVC *)[sb instantiateViewControllerWithIdentifier:@"firstVC"];
    }
    return _first;
}
-(SecondVC *)second{
    if (!_second) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _second = (SecondVC *)[sb instantiateViewControllerWithIdentifier:@"secondVC"];
    }
    return _second;
}
-(ThirdVC *)third{
    if (!_third) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _third = (ThirdVC *)[sb instantiateViewControllerWithIdentifier:@"thirdVC"];
    }
    return _third;
}
- (IBAction)tap1:(id)sender {
    if (self.currentVC == self.second) {
        return;
    }
    [self transitionFromViewController:self.currentVC toViewController:self.second duration:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        
    } completion:^(BOOL finished) {
        self.currentVC = self.second;
        [self.second didMoveToParentViewController:self.currentVC];
    }];
}
- (IBAction)tap2:(id)sender {
    if (self.currentVC == self.third) {
        return;
    }
    [self transitionFromViewController:self.currentVC toViewController:self.third duration:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        
    } completion:^(BOOL finished) {
        self.currentVC = self.third;
        [self.third didMoveToParentViewController:self.currentVC];
    }];
}
- (IBAction)tap3:(id)sender {
    if (self.currentVC == self.first) {
        return;
    }
    [self transitionFromViewController:self.currentVC toViewController:self.first duration:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        
    } completion:^(BOOL finished) {
        self.currentVC = self.first;
        [self.first didMoveToParentViewController:self.currentVC];
    }];
}

@end
