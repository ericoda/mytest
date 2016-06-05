//
//  ViewController.m
//  test.archive
//
//  Created by EricLau on 16/6/1.
//  Copyright © 2016年 eric. All rights reserved.
//

#import "ViewController.h"
#import "DCDog.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableview;
@end

@implementation ViewController

+ (instancetype)sharedInstance
{
    static ViewController* instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [ViewController new];
    });

    return instance;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//	[self createDog];
//	[self saveObj];
	[self readObj];
}

-(void)createDog{
	self.dog = [DCDog new];
	_dog.name = @"hahadog";
	_dog.pid = 19;
	_dog.mode = DCDogModeGuard;
	_dog.location = CLLocationCoordinate2DMake(100.1, 100.2);
}
-(void)saveObj{
	NSString *path = [self getPath];
	[NSKeyedArchiver archiveRootObject:self.dog toFile:path];
	
}
-(void)readObj{
	NSString *path = [self getPath];
	DCDog *savedDog = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
	NSLog(@"%@,%ld",savedDog.name,savedDog.pid);
}
-(NSString *)getPath{
	NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
	NSString *path = [docPath stringByAppendingPathComponent:@"linlin.dog"];
	NSLog(@"%@",path);
	return path;
}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
