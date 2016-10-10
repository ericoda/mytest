//
//  CustomView.h
//  test_IBInspectable
//
//  Created by Eric on 16/10/10.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE//

@interface CustomView : UIView
@property (nonatomic, assign)IBInspectable CGFloat corerRadius;//
//@property (nonatomic, assign)IBInspectable BOOL masksToBounds;//
@end
