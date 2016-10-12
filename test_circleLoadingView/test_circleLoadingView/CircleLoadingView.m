//
//  CircleLoadingView.m
//  test_circleLoadingView
//
//  Created by EricLau on 16/9/30.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "CircleLoadingView.h"

@implementation CircleLoadingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	// Drawing code
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextAddArc(ctx, rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height/2, self.loopRadius, 0, 2*M_PI, 1);
	CGContextSetStrokeColorWithColor(ctx, self.loopColor.CGColor);
	CGContextSetLineWidth(ctx, self.loopWidth);
	[ctx ]
}

- (CGFloat)loopRadius {
	if (!_loopRadius) {
		_loopRadius = self.frame.size.width >= self.frame.size.height ? self.frame.size.height : self.frame.size.width;
	}
	return _loopRadius;
}

- (CGFloat)loopWidth {
	if (!_loopWidth) {
		_loopWidth = 5;
	}
	return _loopWidth;
}

- (UIColor *)loopColor {
	if (!_loopColor) {
		_loopColor = [UIColor redColor];
	}
	return _loopColor;
}
@end
