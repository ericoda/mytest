//
//  ViewController.m
//  test.useExsistsViewInNib
//
//  Created by EricLau on 16/6/29.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.view addSubview:[[CustomView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)]];
	UIView *view =  [self.view.subviews firstObject];
	view.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
