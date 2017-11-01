//
//  RootViweController.m
//  CollectionViewDemo
//
//  Created by Hanser on 31/10/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "RootViweController.h"


@interface RootViweController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation RootViweController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CollectionView";
   
    [self getGoodsData];
}

- (void)getGoodsData {
    NSString *url = @"http://api.vd.cn/maps/index";
    NSDictionary *param = @{
                            @"_sign_": @"1651A1997D81AAB1E6CD49A26F3B97CC",
                            @"BaseAppVersion": @"4.10.0",
                            @"parameterInput": @{
                                    @"pageSize": @10,
                                    @"page": @1
                                    },
                            @"hardware": @"x86_64",
                            @"timeStamp": @"2017-11-01T14:08:44.971Z",
                            @"SystemVersion": @"11.1",
                            @"appIdentifier": @"com.hs.yjsellerhoc",
                            @"BaseAppType": @"ios",
                            @"spreadChannel": @"app store"
                            };
    [[HTTPNetworkEngine shareInstantce] postWithUrl:url postParam:param success:^(NSDictionary *data) {
        NSLog(@"%@",data);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


@end
