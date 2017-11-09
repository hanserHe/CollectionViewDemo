//
//  GoodsComponent.m
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "GoodsComponent.h"

@interface GoodsComponent()

@end

@implementation GoodsComponent

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.componentHeader];
        [self addSubview:self.componentBody];
    }
    return self;
}

- (GoodsComponentHeader *)componentHeader {
    if (_componentHeader) {
        return _componentHeader;
    }
    _componentHeader = [[GoodsComponentHeader alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    return _componentHeader;
}

- (GoodsComponentBody *)componentBody {
    if (_componentBody) {
        return _componentBody;
    }
    _componentBody = [[GoodsComponentBody alloc] initWithFrame:CGRectMake(0, 50, ScreenWidth, self.frame.size.height-50)];
    return _componentBody;
}

- (void)setGoodsInfo:(GoodsInfo *)goodsInfo {
    if (_goodsInfo != goodsInfo) {
        _goodsInfo = goodsInfo;
        _componentBody.goodsInfo = goodsInfo;
        _componentHeader.titleInfo = goodsInfo.titleInfo;
    }
}


@end
