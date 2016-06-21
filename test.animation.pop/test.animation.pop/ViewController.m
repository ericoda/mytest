//
//  ViewController.m
//  test.animation.pop
//
//  Created by EricLau on 16/6/19.
//  Copyright © 2016年 eric. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>
@interface ViewController ()
@property (nonatomic, strong)UIView *ppv;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.view addSubview:self.ppv];
	//	POPSpringAnimation *ani = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
	//	ani.toValue = [UIColor greenColor];
	POPSpringAnimation *ani = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
	ani.fromValue = @(100.0f);
	ani.toValue = @(200.0f);
//	ani.velocity = [UIColor yellowColor];
	ani.springSpeed = 1.f;
	ani.springBounciness = 1;
//	ani.dynamicsTension = 1.f;
	ani.dynamicsFriction = 1.f;
//	ani.autoreverses = YES;
	ani.repeatForever = YES;
	[self.ppv.layer pop_addAnimation:ani forKey:@"size"];
	
	
}
-(UIView *)ppv{
	if (!_ppv) {
		_ppv = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 20, 20)];
		_ppv.backgroundColor = [UIColor redColor];
	}
	return _ppv;
}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
