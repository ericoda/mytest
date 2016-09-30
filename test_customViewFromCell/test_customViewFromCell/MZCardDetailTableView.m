//
//  MZCardDetailTableView.m
//  test_customViewFromCell
//
//  Created by Eric on 16/9/18.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "MZCardDetailTableView.h"
#import "MZCardDetailHeaderView.h"

@interface MZCardDetailTableView ()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic, strong) MZCardDetailHeaderView *headerView;
@property (nonatomic, strong) UITableViewCell *cellForCalculateHeight;
@end

static NSString * const DETAILCELLID = @"MZCardDetailViewController";
static CGFloat const HEIGHT_FOR_HEADERVIEW = 300.f;

@implementation MZCardDetailTableView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
+ (instancetype)factoryMethod {
    return nil;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}


#pragma mark - tableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    return 50.f;
    return [self.cellForCalculateHeight.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DETAILCELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DETAILCELLID];
    }
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MZCardDetailHeaderView *view;
    CGRect viewRect = CGRectMake(0, 0, tableView.frame.size.width, HEIGHT_FOR_HEADERVIEW);
    switch (section) {
        case 0:
            view = self.headerView;
            view.frame = viewRect;
            break;
        default:
            view = nil;
            break;
    }
    return view;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return HEIGHT_FOR_HEADERVIEW;
}

- (MZCardDetailHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle]loadNibNamed:@"MZCardDetailHeaderView" owner:self options:nil] lastObject];
//        _headerView.delegate = self;
    }
    return _headerView;
}

@end
