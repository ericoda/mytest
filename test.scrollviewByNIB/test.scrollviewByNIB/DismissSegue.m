//
//  DismissSegue.m
//  test.scrollviewByNIB
//
//  Created by EricLau on 16/6/29.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "DismissSegue.h"

@implementation DismissSegue
-(void)perform{
	UIViewController *vc = self.sourceViewController;
	[vc.presentingViewController dismissViewControllerAnimated:YES completion:^{
		nil;
	}];
}
@end
