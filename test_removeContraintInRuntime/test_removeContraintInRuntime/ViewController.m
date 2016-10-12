//
//  ViewController.m
//  test_removeContraintInRuntime
//
//  Created by EricLau on 16/10/9.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *testViewCenterY;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.view removeConstraint:self.testViewCenterY];
//	[self.view addConstraint:self.testViewCenterY];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
