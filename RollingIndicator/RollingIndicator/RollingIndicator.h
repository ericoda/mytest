//
//  RollingIndicator.h
//  RollingIndicator
//
//  Created by Eric on 2017/2/8.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RollingIndicator : UIView
@property (nonatomic, copy) NSArray <NSNumber *>*numbers;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat width;
@end
