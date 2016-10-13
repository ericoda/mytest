//
//  ViewController.m
//  test_ThreadDepdency
//
//  Created by EricLau on 16/10/13.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	//同步、异步
	//串行、并发
	//利用 barrier
	
	//	dispatch_queue_t test_queue_con = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	
	
	
	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	//并发队列
	dispatch_queue_t test_queue_con = dispatch_queue_create("test_queue_con", DISPATCH_QUEUE_CONCURRENT);
	//串行队列
	//	dispatch_queue_t test_queue_con = dispatch_queue_create("test_queue_con", DISPATCH_QUEUE_SERIAL);
	//全局队列
	//	dispatch_queue_t test_queue_con = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	
	
	//barrier控制依赖
	//	dispatch_async(test_queue_con, ^{
	//		NSLog(@"__1");
	//	});
	//	dispatch_async(test_queue_con, ^{
	//		NSLog(@"__2");
	//	});
	//	dispatch_barrier_async(test_queue_con, ^{
	//		NSLog(@"__barrier");
	//	});
	//	dispatch_async(test_queue_con, ^{
	//		NSLog(@"__3");
	//	});
	//	dispatch_async(test_queue_con, ^{
	//		NSLog(@"__4");
	//	});
	
	
	//semaphore控制依赖,控制最大并发数
	
	dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
	
	
	//	dispatch_semaphore_signal(semaphore);
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSLog(@"__semaphore___1");
	});
	
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSLog(@"__semaphore___2");
	});
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSLog(@"__semaphore___3");
	});
	dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
	dispatch_semaphore_signal(semaphore);
	//	dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSLog(@"__semaphore___4");
	});
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSLog(@"__semaphore___5");
	});
	//	dispatch_semaphore_signal(semaphore);
}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
