//
//  GoodsComponentHeader.h
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureInfo.h"

@interface GoodsComponentHeader : UIControl

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) PictureInfo *pictureInfo;

@end
