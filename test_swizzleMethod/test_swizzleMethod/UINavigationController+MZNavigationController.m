//
//  UINavigationController+MZNavigationController.m
//  test_swizzleMethod
//
//  Created by Eric on 18/10/2016.
//  Copyright © 2016 ericoda. All rights reserved.
//

#import "UINavigationController+MZNavigationController.h"
#import <objc/runtime.h>


@implementation UINavigationController (MZNavigationController)
+ (void)load {
    
    //仅执行交换一次。
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(pushViewController:animated:);
        SEL swizzledSelector = @selector(mzPushViewController:animated:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
    
    
//    Method originMethod = class_getInstanceMethod(self, @selector(pushViewController:animated:));
//    Method newMethod = class_getInstanceMethod(self, @selector(pushMZViewController:animated:));
//    method_exchangeImplementations(originMethod, newMethod);

}
- (void)mzPushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //由于已经交换了，这时再调用自己的名字的方法其实是在调用系统的方法。
    //在这里做你想要自定义的动作。
    
    [self mzPushViewController:viewController animated:YES];
}


@end

