//
//  PieGraphView.h
//  test_pieGraph
//
//  Created by Eric on 16/7/18.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PieGraphViewDelegate <NSObject>
@required
-(CGFloat)pieGraphViewRadius;
@end

@protocol PieGraphViewDataSource <NSObject>

@required
-(NSUInteger)pieGraphViewSlicesQuantity;
-(CGFloat)pieGraphViewValueForSliceAtIndex:(NSUInteger)index;

@optional
-(UIColor *)pieGraphViewColorForSliceAtIndex:(NSUInteger)index;
-(NSString *)pieGraphViewTitleForSliceAtIndex:(NSUInteger)index;

@end

@interface PieGraphView : UIView
@property (nonatomic, assign)id <PieGraphViewDelegate> delegate;
@property (nonatomic, assign)id <PieGraphViewDataSource> dataSource;

-(void)reloadData;

@end
