//
//  AvatarImageView.m
//  test_sizeclass
//
//  Created by EricLau on 16/10/14.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "AvatarImageView.h"

@implementation AvatarImageView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)setAvatarRadius:(CGFloat)avatarRadius {
	if (avatarRadius) {
		self.layer.cornerRadius = avatarRadius;
	}
}

//- (void)setMasksToBounds:(BOOL)masksToBounds {
//	self.layer.masksToBounds = masksToBounds;
//}

@end
