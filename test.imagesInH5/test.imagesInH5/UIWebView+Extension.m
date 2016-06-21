//
//  UIWebView+Extension.m
//  test.imagesInH5
//
//  Created by EricLau on 16/6/16.
//  Copyright © 2016年 eric. All rights reserved.
//

#import "UIWebView+Extension.h"

@implementation UIWebView (Extension)
-(NSArray *)getAllImagesUrl{
	//这里是js，主要目的实现对url的获取
	static  NSString * const jsGetImages =
	@"function getImages(){\
	var objs = document.getElementsByTagName(\"img\");\
	var imgScr = '';\
	for(var i=0;i<objs.length;i++){\
	imgScr = imgScr + objs[i].src + '+';\
	};\
	return imgScr;\
	};";
	
	[self stringByEvaluatingJavaScriptFromString:jsGetImages];//注入js方法
	NSString *urlResurlt = [self stringByEvaluatingJavaScriptFromString:@"getImages()"];
	
	if (!urlResurlt) {
		return nil;
	}
	
	NSMutableArray * mUrlArray;
	
	if ([urlResurlt containsString:@"+"]) {
		mUrlArray = [urlResurlt componentsSeparatedByString:@"+"].mutableCopy;
	}
	
	if (mUrlArray.count >= 2) {
		[mUrlArray removeLastObject];
	}
	
	return mUrlArray;
}
@end
