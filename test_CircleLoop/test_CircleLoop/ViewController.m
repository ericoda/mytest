//
//  ViewController.m
//  test_CircleLoop
//
//  Created by EricLau on 16/9/20.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "ViewController.h"
#import "LoopView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	LoopView *lv = [[LoopView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
	lv.center = self.view.center;
	lv.backgroundColor = [UIColor clearColor];
	lv.loopColor = [UIColor redColor];
	//	lv.loopProgress = 0.5;
	lv.loopLineWidth = 5.f;
	lv.loopRadius = 100;
	[self.view addSubview:lv];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
