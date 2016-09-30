//
//  MZCardDetailViewController.m
//  test_customViewFromCell
//
//  Created by Eric on 16/9/12.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "MZCardDetailViewController.h"
#import "MZCardDetailHeaderView.h"
#import "MZCardDetailTableView.h"


@interface MZCardDetailViewController () <MZCardDetailHeaderViewDelegate>

@property (strong, nonatomic)IBOutlet MZCardDetailHeaderView *headerView;
@property (weak, nonatomic) IBOutlet MZCardDetailTableView *tableView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation MZCardDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addObserver:self forKeyPath:@"data" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - headerView delegate

- (void)goodsOptionSelected:(UISegmentedControl *)button {
    self.data = self.dataGoods;
    NSLog(@"%s",__FUNCTION__);
}

- (void)rightsOptionSelected:(UISegmentedControl *)button {
    self.data = self.dataRights;
    NSLog(@"%s",__FUNCTION__);
}

- (void)buyNowButtonClicked:(UIButton *)button {
    NSLog(@"%s",__FUNCTION__);
}


- (void)dealloc {
    [self removeObserver:self forKeyPath:@"data"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (change[NSKeyValueChangeNewKey]) {
        [self.tableView reloadData];
    }
    NSLog(@"%@",change);
}

//- (UITableViewCell *)cellForCalculateHeight {
//    if(!_cellForCalculateHeight) {
//        _cellForCalculateHeight = [UITableViewCell new];
//    }
//    return _cellForCalculateHeight;
//}

- (NSArray *)dataGoods {
    if (!_dataGoods) {
        _dataGoods = [NSArray new];
    }
    return _dataGoods;
}

- (NSArray *)dataRights {
    if (!_dataRights) {
        NSMutableArray *mar = [NSMutableArray new];
        for (int i = 0; i < 10; i ++) {
            [mar addObject:[self randomString]];
        }
        _dataRights = [NSArray new];
    }
    return _dataRights;
}

- (NSString *)randomString {
    int length = arc4random()%126 + 32;
    NSMutableString *mstr = @"".mutableCopy;
    for (int i = 0 ; i < length; i ++) {
        int posi = arc4random()%26;
        const char cstr = 'A'+posi;
        [mstr appendString:[NSString stringWithUTF8String:&cstr]];
    }
    return mstr.copy;
}
@end
