//
//  DCDog.h
//  test.archive
//
//  Created by EricLau on 16/6/1.
//  Copyright © 2016年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
typedef NS_ENUM(NSUInteger, DCDogMode) {
    DCDogModeNormal = 1,
    DCDogModeWalk,
    DCDogModeGuard,
};

@interface DCDog : NSObject <NSCoding>
@property (nonatomic, assign)NSInteger pid;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)CLLocationCoordinate2D location;
@property (nonatomic, assign)NSInteger steps;
@property (nonatomic, assign)DCDogMode mode;

@end
