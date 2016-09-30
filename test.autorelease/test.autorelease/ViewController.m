//
//  ViewController.m
//  test.autorelease
//
//  Created by EricLau on 16/6/30.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, copy)NSArray *data;
@end

@implementation ViewController{
	NSUInteger _count;
}
- (NSArray *)data{
	if (!_data) {
		_data = [NSArray new];
	}
	return _data;
}
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	for (NSUInteger i = 0; i<2; i++) {
		//		UIImage *img = [UIImage imageNamed:@"dog.jpg"];
		@autoreleasepool {
			
			UIImage *img = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dog" ofType:@"jpg"]];
			
			NSMutableArray *arrm = self.data.mutableCopy;
			
			[arrm addObject:img];
			
			self.data = arrm;
			
			arrm = nil;
		}
		if (i%20 == 0) {
			dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
				++_count;
				[self saveData];
			});
			
		}
		
		//		printf("%ld\n",self.data.count);
	}
	
	
}
-(void)saveData{
	
	for (NSUInteger i = 0; i<self.data.count; i++) {
		UIImage *img = self.data[i];
		NSData *data = UIImageJPEGRepresentation(img, 1);
		NSString *str = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
		//		NSLog(@"%@",str);
		[[NSUserDefaults standardUserDefaults] setObject:str forKey:[NSString stringWithFormat:@"%ld",_count *(i + 1)]];
	}
	[[NSUserDefaults standardUserDefaults]synchronize];
	self.data = nil;
}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
