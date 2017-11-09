//
//  RootViweController.m
//  CollectionViewDemo
//
//  Created by Hanser on 31/10/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "RootViweController.h"
#import "MJExtension.h"
#import "GoodsInfo.h"
#import "GoodsCoverSwiperReusableView.h"


@interface RootViweController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) GoodsInfo *goodsInfo;
@end

@implementation RootViweController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CollectionView";
    [self.view addSubview:self.collectionView];
    
    [self getGoodsData];
}

- (void)getGoodsData {
    WEAKSELF
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
        NSDictionary *dic = [data objectForKey:@"data"] ;
        NSArray *components = [dic objectForKey:@"components"];
        NSLog(@"%@",components[3]);
        
        weakSelf.goodsInfo = [GoodsInfo mj_objectWithKeyValues:[components objectAtIndex:3]];
        NSLog(@"%@",weakSelf.goodsInfo);
        
        NSDictionary *dicArray = [[components objectAtIndex:3] objectForKey:@"images"];
        weakSelf.goodsInfo.images = [PictureInfo mj_objectArrayWithKeyValuesArray:dicArray];
        
        [weakSelf.collectionView reloadData];

    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


- (UICollectionView *)collectionView {
    if (_collectionView) {
        return _collectionView;
    }
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 20;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource =self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
//    [_collectionView registerClass:[GoodsCoverSwiperReusableView class] forCellWithReuseIdentifier:@"GoodsCoverSwiperReusableView"];
    [_collectionView registerClass:[GoodsCoverSwiperReusableView class]  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GoodsCoverSwiperReusableView"];
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        GoodsCoverSwiperReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GoodsCoverSwiperReusableView" forIndexPath:indexPath];
        view.backgroundColor = [UIColor whiteColor];
        view.goodsComponent.goodsInfo = self.goodsInfo;
        return view;
    }
    return nil;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        return CGSizeMake(ScreenWidth, 100);
    }
    return CGSizeMake(100, 100);
}

//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, -10, 0);//分别为上、左、下、右
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 183);
}




//两个cell之间的间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}


@end
