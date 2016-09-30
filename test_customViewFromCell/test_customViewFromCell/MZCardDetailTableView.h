//
//  MZCardDetailTableView.h
//  test_customViewFromCell
//
//  Created by Eric on 16/9/18.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZCardDetailTableView : UITableView
@property (nonatomic, strong)NSArray *data;
+ (instancetype)factoryMethod;
@end
