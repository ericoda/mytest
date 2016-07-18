//
//  PieGraphView.m
//  test_pieGraph
//
//  Created by Eric on 16/7/18.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "PieGraphView.h"

@implementation PieGraphView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat innerRadius = rect.size.width/2;
    CGFloat outRadius = innerRadius;
    if ([self.delegate respondsToSelector:@selector(pieGraphViewRadius)]) {
        innerRadius -= [self.delegate pieGraphViewRadius];
        NSAssert(innerRadius <= outRadius/2, @"wrong radius");
    }
    
    

    CGFloat radius = outRadius-innerRadius;
    CGFloat centerX = rect.size.width/2;
    CGFloat centerY = rect.size.height/2;
    
    CGFloat sum = 0.0f;
    NSUInteger slicesCount = [self.dataSource pieGraphViewSlicesQuantity];
 
    for (NSUInteger i = 0; i < slicesCount; i++) {
        sum += [self.dataSource pieGraphViewValueForSliceAtIndex:i];
    }
    
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = 0.0f;

    for (NSUInteger i = 0; i < slicesCount; i++) {
        CGFloat value = [self.dataSource pieGraphViewValueForSliceAtIndex:i];
        endAngle = startAngle + M_PI*2*value/sum;
        CGContextAddArc(context, centerX, centerY, radius, startAngle, endAngle, false); //添加弧
        //        UIColor *drawColor = [self.dataSource pieGraphViewColorForSliceAtIndex:i];
        UIColor *drawColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        CGContextSetStrokeColorWithColor(context, drawColor.CGColor); //设置线的颜色
        CGContextSetLineWidth(context, outRadius); //设置线的宽度
        CGContextStrokePath(context); //绘制
        startAngle += M_PI*2*value/sum;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0.f, 5.f);
        self.layer.shadowOpacity = 0.5;
        self.layer.shadowRadius = 2.f;
    }
    return self;
}


@end
