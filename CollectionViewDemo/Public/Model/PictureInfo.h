//
//  PictureInfo.h
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "Jastor.h"

@interface PictureInfo : Jastor

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *titleIconUrl;
@property (strong, nonatomic) NSString *pictureUrl;
@property (strong, nonatomic) NSString *subtitle;
@property (assign, nonatomic) long status;
@property (strong, nonatomic) NSString *descript;
@property (strong, nonatomic) NSArray *extInfo;
//@property (strong, nonatomic) GlobalPageSegueData *segue;
@property (nonatomic, strong) NSNumber *index;
@property (nonatomic, assign) CGFloat ratio;    // 图片高宽比


@end
