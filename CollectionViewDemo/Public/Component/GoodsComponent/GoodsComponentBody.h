//
//  GoodsComponentBody.h
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoodsInfo;
@class GoodsComponentBody;
@protocol GoodsComponentBodyDelegate<NSObject>
@optional
- (void)goodsComponentBody:(GoodsComponentBody *)goodsComponentBody
      didSelectItemAtIndex:(NSInteger)index;

@end

@interface GoodsComponentBody : UIView

@property (nonatomic, strong) GoodsInfo *goodsInfo;
@property (nonatomic, weak) id<GoodsComponentBodyDelegate> delegate;

- (void)scrollToPage:(NSInteger)page animated:(BOOL)animated;

@end
