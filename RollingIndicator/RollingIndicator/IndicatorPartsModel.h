//
//  IndicatorPartsModel.h
//  RollingIndicator
//
//  Created by Eric on 2017/2/8.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface IndicatorPartsModel : NSObject
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat centerAngel;
@property (nonatomic, assign) CGFloat ratio;
@end
