//
//  MZCardDetailGoodsTableView.m
//  test_customViewFromCell
//
//  Created by Eric on 16/9/18.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "MZCardDetailGoodsTableView.h"

@implementation MZCardDetailGoodsTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)factoryMethod {
    MZCardDetailGoodsTableView *tableView = [[MZCardDetailGoodsTableView alloc]init];
    return tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (NSInteger)numberOfSections {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
@end
