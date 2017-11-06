//
//  GoodsCoverSwiperReusableView.m
//  CollectionViewDemo
//
//  Created by Hanser on 03/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "GoodsCoverSwiperReusableView.h"

@interface GoodsCoverSwiperReusableView()


@end

@implementation GoodsCoverSwiperReusableView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.goodsComponent];
    }
    return self;
}

- (GoodsComponent *)goodsComponent {
    if (_goodsComponent) {
        return _goodsComponent;
    }
    _goodsComponent = [[GoodsComponent alloc] initWithFrame:self.bounds];
    return _goodsComponent;
}




@end
