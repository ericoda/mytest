//
//  ATextField.m
//  RACDemo_Objc
//
//  Created by Eric on 2017/7/10.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "ATextField.h"

@interface ATextField ()
@property (nonatomic, assign, readonly) CGFloat heightFortTips;;
@end

@implementation ATextField {
    UILabel *_tipsLabel;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildTipsView];
    }
    return self;
}


- (CGFloat)heightFortTips {
   CGRect rect = [_tipsLabel.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, 0) options:NSStringDrawingUsesFontLeading attributes:nil context:NULL];
    return rect.size.height;
}

- (void)setTips:(NSString *)tips {
    _tipsLabel.text = tips;
}


- (void)buildTipsView {
    _tipsLabel = [UILabel new];
    [self addSubview:_tipsLabel];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(5);
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
    }];
    _tipsLabel.font = [UIFont systemFontOfSize:8];
    _tipsLabel.textColor = [UIColor whiteColor];
    _tipsLabel.backgroundColor = [UIColor lightGrayColor];

}

@end
