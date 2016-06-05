//
//  DCDog.m
//  test.archive
//
//  Created by EricLau on 16/6/1.
//  Copyright © 2016年 eric. All rights reserved.
//

#import "DCDog.h"

@implementation DCDog
-(void)encodeWithCoder:(NSCoder *)aCoder{
	NSLog(@"%s",__FUNCTION__);
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeObject:@(self.pid) forKey:@"pid"];
	[aCoder encodeObject:@(self.mode) forKey:@"mode"];
	[aCoder encodeObject:@(self.location.latitude) forKey:@"location.latitude"];
	[aCoder encodeObject:@(self.location.longitude) forKey:@"location.longitude"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
	NSLog(@"%s",__FUNCTION__);
	self = [super init];
	if (self) {
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.pid = [[aDecoder decodeObjectForKey:@"pid"] integerValue];
		self.mode = [[aDecoder decodeObjectForKey:@"mode"] unsignedIntegerValue];
		CGFloat lat = [[aDecoder decodeObjectForKey:@"location.latitude"] doubleValue];
		CGFloat lon = [[aDecoder decodeObjectForKey:@"location.longitude"] doubleValue];
		self.location = CLLocationCoordinate2DMake(lat, lon);
	}
	return self;
}
@end
