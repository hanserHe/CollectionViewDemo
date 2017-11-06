//
//  GoodsComponent.h
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsComponentHeader.h"
#import "GoodsComponentBody.h"
#import "GoodsInfo.h"

@interface GoodsComponent : UIView

@property (nonatomic, strong) GoodsComponentHeader *componentHeader;
@property (nonatomic, strong) GoodsComponentBody *componentBody;
@property (nonatomic, strong) GoodsInfo *goodsInfo;

@end
