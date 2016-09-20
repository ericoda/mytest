//
//  CustomView.m
//  test.useExsistsViewInNib
//
//  Created by EricLau on 16/6/29.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "CustomView.h"
#import <objc/runtime.h>
@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//通过代码加载的时候走这个方法
- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor redColor];
	}
	return self;
}
//通过xib加载的时候走这个方法
- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		self.backgroundColor = [UIColor redColor];
		id value = [coder decodeObjectForKey:@"frame"];
		
		[self getAllMethodsInObj:coder];
		
		NSLog(@"%@",value);
	}
	return self;
}
-(void)getAllMethodsInObj:(id)obj{
	const char *name = object_getClassName(obj);
	Class class = NSClassFromString([NSString stringWithUTF8String:name]);
	class_getClassMethod(class, <#SEL name#>)
	
}

@end
