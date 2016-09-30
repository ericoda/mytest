//
//  MZCardDetailRightsTableView.m
//  test_customViewFromCell
//
//  Created by Eric on 16/9/18.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "MZCardDetailRightsTableView.h"

@implementation MZCardDetailRightsTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)factoryMethod {
    MZCardDetailRightsTableView *tableView = [[MZCardDetailRightsTableView alloc]init];
    return tableView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 2.f;
}

- (NSInteger)numberOfSections {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
@end
