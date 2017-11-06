//
//  CoverComponentCollectionCell.m
//  CollectionViewDemo
//
//  Created by Hanser on 03/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "CoverComponentCollectionCell.h"

@implementation CoverComponentCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
    }
    return self;
}

@end
