//
//  MZCardDetailHeaderView.m
//  test_customViewFromCell
//
//  Created by Eric on 16/9/12.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "MZCardDetailHeaderView.h"
#define PICKEDCOLOR [UIColor orangeColor];
typedef NS_ENUM(NSUInteger, MZCardDetailSelectedOption) {
    MZCardDetailSelectedGoods = 0,
    MZCardDetailSelectedRights,
};
@interface MZCardDetailHeaderView ()
@property (nonatomic, assign)MZCardDetailSelectedOption currentOption;

@end
@implementation MZCardDetailHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    //最初
    self.currentOption = self.options.selectedSegmentIndex;
}

- (IBAction)buyNowEvent:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate buyNowButtonClicked:sender];
    }
}
- (IBAction)optionEvent:(UISegmentedControl *)sender forEvent:(UIEvent *)event {
    self.currentOption = self.options.selectedSegmentIndex;
    if (self.delegate) {
        switch (self.currentOption) {
            case 0:
                [self.delegate goodsOptionSelected:sender];
                break;
            case 1:
                [self.delegate rightsOptionSelected:sender];
                break;
            default:
                break;
        }
    }
}

@end
