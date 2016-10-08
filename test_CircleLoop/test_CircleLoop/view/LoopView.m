//
//  LoopView.m
//  test_CircleLoop
//
//  Created by EricLau on 16/9/20.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "LoopView.h"

@interface LoopView()

@property (nonatomic, strong) UILabel *progressLabel;

@property (nonatomic, strong) CAShapeLayer *loopLayer;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;
@end

@implementation LoopView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	// Drawing code
	_centerX = rect.origin.x + rect.size.width/2;
	_centerY = rect.origin.y + rect.size.height/2;
	//loop
	//底层
	//	CGContextRef ctx = UIGraphicsGetCurrentContext();
	//	CGContextSetLineWidth(ctx, 0);
	//	CGContextSetRGBStrokeColor(ctx, 1.f, 1.f, 1.f, 1);
	//	CGContextAddArc(ctx, _centerX, _centerY, self.loopRadius, 0, 2*M_PI, 1);
	//	CGContextDrawPath(ctx, kCGPathStroke);
	
	//progress label
	[self addSubview:self.progressLabel];
	
	//bezier path
	//黄色层
	UIBezierPath *bpath = [UIBezierPath bezierPath];
	[bpath addArcWithCenter:CGPointMake(_centerX, _centerY) radius:self.loopRadius-self.loopLineWidth startAngle:0 endAngle:2*M_PI clockwise:YES];
	
	self.loopLayer.path = bpath.CGPath;
	self.loopLayer.fillColor = [UIColor blueColor].CGColor;
	self.loopLayer.strokeColor = self.loopColor.CGColor;
	self.loopLayer.lineWidth = 30.f;
	[self.layer addSublayer:self.loopLayer];
//	[self animationForLoop];

	UIBezierPath *scrollPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_centerY, _centerY) radius:15 startAngle:0 endAngle:2*M_PI clockwise:YES];

	CAShapeLayer *circleLayer = [CAShapeLayer layer];
	circleLayer.path = scrollPath.CGPath;
	circleLayer.frame = CGRectMake(0, 0, 15, 15);
	circleLayer.fillColor = [UIColor yellowColor].CGColor;
	[self.loopLayer addSublayer:circleLayer];
}

- (void)scrolling {
	static float i = 0.f;
	i += 0.01;
	self.progressLabel.text = [NSString stringWithFormat:@"%ff",i];
}

- (void)animationForLoop{
	CABasicAnimation *bani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	bani.duration = 3.f;
	bani.fromValue = @(0);
	bani.toValue = @(self.loopLineWidth);
	bani.repeatCount = CGFLOAT_MAX;
	[self.loopLayer addAnimation:bani forKey:NSStringFromClass([self class])];
	
}

- (CGFloat)loopLineWidth {
	if (!_loopLineWidth) {
		_loopLineWidth = 10.f;
	}
	return _loopLineWidth;
}

- (UIColor *)loopColor {
	if (!_loopColor) {
		_loopColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
	}
	return _loopColor;
}

- (CAShapeLayer *)loopLayer {
	if (!_loopLayer) {
		_loopLayer = [CAShapeLayer layer];
	}
	return _loopLayer;
}

- (UILabel *)progressLabel {
	if (!_progressLabel) {
		_progressLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.loopRadius, 0)];
		_progressLabel.textAlignment = NSTextAlignmentCenter;
		_progressLabel.center = CGPointMake(_centerX, _centerY);
		_progressLabel.text = @"0.00f%";
		[_progressLabel sizeToFit];
	}
	return _progressLabel;
}


- (CGFloat)loopRadius {
	if (!_loopRadius) {
		_loopRadius = self.frame.size.width/2;
	}
	return _loopRadius;
}
@end
