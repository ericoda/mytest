//
//  LoopView.h
//  test_CircleLoop
//
//  Created by EricLau on 16/9/20.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoopView : UIView
@property (nonatomic, assign) CGFloat loopProgress;

@property (nonatomic, assign) CGFloat loopRadius;
@property (nonatomic, assign) CGFloat loopLineWidth;
@property (nonatomic, strong) UIColor *loopColor;
@end
