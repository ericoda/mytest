//
//  PiePartLayer.h
//  RollingIndicator
//
//  Created by Eric on 2017/2/10.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface PiePartLayer : CAShapeLayer
@property (nonatomic, assign) CGFloat centerAngle;
@property (nonatomic, assign) CGFloat startAngle;
@property (nonatomic, assign) CGFloat endAngle;
@end
