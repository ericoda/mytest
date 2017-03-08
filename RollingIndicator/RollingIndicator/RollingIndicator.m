//
//  RollingIndicator.m
//  RollingIndicator
//
//  Created by Eric on 2017/2/8.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "RollingIndicator.h"
#import "PiePartLayer.h"
@interface RollingIndicator()

@property (nonatomic, strong) UIColor *randomColor;

@end

@implementation RollingIndicator


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self buildIndicatorWithNumbers:nil];
}


- (void)buildIndicatorWithNumbers:(NSArray <NSNumber*>*)numbers {
    
    NSArray *tmpNumbers = nil;
    if (numbers == nil)  tmpNumbers = self.numbers; else tmpNumbers = numbers;
    //计算数组中所有数值之和
    CGFloat sumValue = [[self.numbers valueForKeyPath:@"@sum.self"] floatValue];
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    for (NSUInteger idx = 0; idx<tmpNumbers.count; idx++) {
        CGFloat eachAngle = [tmpNumbers[idx] floatValue] * 2 * M_PI / sumValue;;
        endAngle = startAngle + eachAngle;
        PiePartLayer *subLayer = [self indicatorLayerWithColor:self.randomColor radius:self.radius borderWidth:self.width startAngle:startAngle  endAngle:endAngle];
        
        [self.layer addSublayer:subLayer];
        startAngle = endAngle;
    }
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isInside = [self pointInside:point withEvent:event];
    
    if (isInside) {
        for (PiePartLayer * subLayer in self.layer.sublayers) {
           NSLog(@"%@",[NSValue valueWithCGRect:subLayer.superlayer.bounds]);
            NSLog(@"sub%@",[NSValue valueWithCGRect:subLayer.bounds]);
//            CGPoint p1 = [subLayer convertPoint:point fromLayer:self.layer];
//            CGPoint p2 = [self.layer convertPoint:point toLayer:subLayer];
//            CGRect r1  = [subLayer convertRect:self.bounds fromLayer:self.layer];
//            CGRect r2  = [self.layer convertRect:self.bounds toLayer:subLayer];
//            BOOL c0 = [subLayer containsPoint:point];
//            BOOL c1 = [subLayer containsPoint:p1];
//            
//            BOOL c2 = [self.layer containsPoint:p2];
////            if (!hasContained) {
//                NSLog(@"no contain::x.%f,y.%f",newp.x,newp.y);
//            }else {
//                NSLog(@"contain::x.%f,y.%f",newp.x,newp.y);
//            }
        }
    }
    return  nil;
}

- (NSArray <NSNumber *>*)numbers {
    if (!_numbers) {
        _numbers = @[@1,@20,@3,@4,@5,@10,@15];
    }
    return _numbers;
}

- (CGFloat)radius {
    if (!_radius) {
        _radius = CGRectGetWidth(self.bounds)/2 - self.width;
    }
    return _radius;
}

- (CGFloat)width {
    if (!_width) {
        _width = 30;
    }
    return _width;
}

- (PiePartLayer *)indicatorLayerWithColor:(UIColor *)fillColor
                                   radius:(CGFloat)radius
                              borderWidth:(CGFloat)borderWidth
                               startAngle:(CGFloat)startAngle
                                 endAngle:(CGFloat)endAngle {
    PiePartLayer *circle = [PiePartLayer layer];
    circle.startAngle = startAngle;
    circle.endAngle = endAngle;
    circle.centerAngle = (endAngle - startAngle)/2.f;
    CGPoint center       = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    //    //饼状图
    //        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    //        [path addLineToPoint:center];
    //        [self.randomColor set];
    //        [path fill];
    
    //圆环指示
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:startAngle
                                                      endAngle:endAngle
                                                     clockwise:YES];
    
    circle.path = path.CGPath;
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = self.randomColor.CGColor;
    circle.lineWidth = borderWidth;
    
    return circle;
}

- (UIColor*)randomColor {
    _randomColor = nil;
    _randomColor = [UIColor colorWithRed:[self randomValue] green:[self randomValue] blue:[self randomValue] alpha:1];
    return _randomColor;
    
}

- (CGFloat)randomValue {
    CGFloat random = arc4random()%255/255.0;
    return random;
}
@end
