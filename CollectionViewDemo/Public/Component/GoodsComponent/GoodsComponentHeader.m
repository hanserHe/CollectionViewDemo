//
//  GoodsComponentHeader.m
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "GoodsComponentHeader.h"

@implementation GoodsComponentHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.title];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

- (UILabel *)title
{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:self.bounds];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.textColor = [UIColor blackColor];
        _title.backgroundColor = [UIColor whiteColor];
        _title.font = [UIFont systemFontOfSize:16];
        _title.hidden = YES;
    }
    return _title;
}

- (void)setTitleInfo:(TitleInfo *)titleInfo {
    _titleInfo = titleInfo;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_titleInfo.pictureUrl]];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

@end
