//
//  GoodsInfo.h
//  CollectionViewDemo
//
//  Created by Hanser on 02/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "Jastor.h"

@interface TitleInfo : Jastor
@property (nonatomic, strong) NSString *pictureUrl;
@property (nonatomic, assign) CGFloat radio;
@end

@interface PictureInfo : Jastor

@property (nonatomic, strong) NSString *pictureUrl;

@end

@interface GoodsInfo : Jastor

@property (nonatomic, strong) NSString *componentId;
@property (nonatomic, strong) NSString *componentTitle;
@property (nonatomic, strong) NSString *componentType;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) BOOL isShowImageName;
@property (nonatomic, assign) NSNumber *number;

@property (nonatomic, strong) TitleInfo *titleInfo;
@end
