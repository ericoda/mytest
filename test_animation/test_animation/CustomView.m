//
//  CustomView.m
//  test_animation
//
//  Created by Eric on 18/10/2016.
//  Copyright © 2016 ericoda. All rights reserved.
//

#import "CustomView.h"
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat wid = rect.size.width < rect.size.height ? rect.size.width : rect.size.height;

   //
    self.outsideLayer = [CALayer layer];
    _outsideLayer.frame = CGRectMake((wid-self.outsideRadius*2)/2, (rect.size.height - self.outsideRadius * 2)/2, self.outsideRadius*2, self.outsideRadius*2);
    _outsideLayer.backgroundColor = [RGBACOLOR(254, 231, 134, 0.2) CGColor];
    _outsideLayer.cornerRadius = self.outsideRadius;
//

    self.innerLayer = [CALayer layer];
    _innerLayer.frame = CGRectMake((wid-(self.innerRadius*2))/2, (rect.size.height-(self.innerRadius*2))/2, self.innerRadius*2, self.innerRadius*2);
    
    _innerLayer.backgroundColor = [RGBACOLOR(254, 231, 134, 0.3) CGColor];
    _innerLayer.cornerRadius = self.innerRadius;

//
    self.centerLayer = [CALayer layer];
    _centerLayer.frame = CGRectMake((wid-(self.centerRadius*2))/2, (rect.size.height-(self.centerRadius*2))/2, self.centerRadius*2, self.centerRadius*2);
    
    _centerLayer.backgroundColor = [RGBACOLOR(254, 231, 134, 0.3) CGColor];
    _centerLayer.cornerRadius = self.centerRadius;


    [self.layer addSublayer:_outsideLayer];
    [self.layer addSublayer:_innerLayer];
    [self.layer addSublayer:_centerLayer];
}


@end
