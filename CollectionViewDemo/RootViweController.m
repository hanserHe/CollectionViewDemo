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
    NSString *url = @"http://api.vd.cn/mengdianApp/getAppHomePop";
    NSDictionary *param = @{
                            @"_sign_": @"8215E80F599B9A99B73FE6F147568C21",
                            @"BaseAppVersion": @"4.10.0",
                            @"hardware": @"x86_64",
                            @"SystemVersion": @"11.0.1",
                            @"appIdentifier": @"com.hs.yjsellerhoc",
                            @"spreadChannel": @"app store",
                            @"BaseAppType": @"ios"                            };
    [[HTTPNetworkEngine shareInstantce] postWithUrl:url postParam:param success:^(NSDictionary *data) {
        NSLog(@"%@",data);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
