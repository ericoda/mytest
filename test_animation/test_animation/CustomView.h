//
//  CustomView.h
//  test_animation
//
//  Created by Eric on 18/10/2016.
//  Copyright © 2016 ericoda. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CustomView : UIView

@property (nonatomic, assign)IBInspectable CGFloat outsideRadius;
@property (nonatomic, assign)IBInspectable CGFloat innerRadius;
@property (nonatomic, assign)IBInspectable CGFloat centerRadius;
@property (nonatomic, strong) CALayer *outsideLayer;
@property (nonatomic, strong) CALayer *innerLayer;
@property (nonatomic, strong) CALayer *centerLayer;
@end
