//
//  CustomView.m
//  test_IBInspectable
//
//  Created by Eric on 16/10/10.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = self.corerRadius;
    self.layer.masksToBounds = self.corerRadius > 0;
}


@end
