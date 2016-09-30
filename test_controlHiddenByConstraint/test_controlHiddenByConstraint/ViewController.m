//
//  ViewController.m
//  test_controlHiddenByConstraint
//
//  Created by Eric on 16/9/30.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *v2Buttom;
@property (strong, nonatomic) IBOutlet UIView *v2;

@end

@implementation ViewController {
    BOOL show;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showEvent:(id)sender {
    show = !show;
    if (show) {
        //隐藏
        [self.v2 setHidden:YES];
        [NSLayoutConstraint deactivateConstraints:@[self.v2Buttom]];
    }else{
        //显示
        [self.v2 setHidden:NO];
        [NSLayoutConstraint activateConstraints:@[self.v2Buttom]];
    }
}
@end
