//
//  MZCardDetailHeaderView.h
//  test_customViewFromCell
//
//  Created by Eric on 16/9/12.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MZCardDetailOptionButton;
@protocol MZCardDetailHeaderViewDelegate <NSObject>
@required
- (void)goodsOptionSelected:(UISegmentedControl *)button;
- (void)rightsOptionSelected:(UISegmentedControl *)button;
- (void)buyNowButtonClicked:(UIButton *)button;

@end

@interface MZCardDetailHeaderView : UIView
//@property (weak, nonatomic) IBOutlet MZCardDetailOptionButton *goodsButton;//商品
//@property (weak, nonatomic) IBOutlet MZCardDetailOptionButton *rightsButton;//权益
@property (weak, nonatomic) IBOutlet UIButton *buyNowButton;//立即购买
@property (weak, nonatomic) IBOutlet UISegmentedControl *options;

@property (nonatomic, weak) id <MZCardDetailHeaderViewDelegate> delegate;


@end
