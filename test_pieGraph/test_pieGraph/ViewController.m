//
//  ViewController.m
//  test_pieGraph
//
//  Created by Eric on 16/7/18.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "ViewController.h"
#import "PieGraphView.h"
@interface ViewController ()<PieGraphViewDelegate, PieGraphViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PieGraphView *view = [[PieGraphView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    view.delegate = self;
    view.dataSource = self;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)pieGraphViewValueForSliceAtIndex:(NSUInteger)index{
    return 50;
}
-(NSUInteger)pieGraphViewSlicesQuantity{
    return 10;
}
-(CGFloat)pieGraphViewRadius{
    return 50;
}
@end
