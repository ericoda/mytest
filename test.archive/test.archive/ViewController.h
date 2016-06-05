//
//  ViewController.h
//  test.archive
//
//  Created by EricLau on 16/6/1.
//  Copyright © 2016年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCDog;

@interface ViewController : UIViewController

+ (instancetype)sharedInstance;
@property (nonatomic, strong)DCDog *dog;
@end

