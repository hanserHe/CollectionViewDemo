//
//  GoodsComponentBody.m
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "GoodsComponentBody.h"
#import "CoverComponentLayout.h"
#import "CoverComponentCollectionCell.h"
#import "GoodsInfo.h"

@interface GoodsComponentBody()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger realCount;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation GoodsComponentBody

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (UICollectionView *)collectionView {
    if (_collectionView) {
        return _collectionView;
    }
    CoverComponentLayout *layout = [[CoverComponentLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[CoverComponentCollectionCell class] forCellWithReuseIdentifier:@"CoverComponentCollectionCell"];
    return _collectionView;
}

- (void)setGoodsInfo:(GoodsInfo *)goodsInfo {
    if (_goodsInfo != goodsInfo) {
        _goodsInfo = goodsInfo;
        
        [self.collectionView reloadData];
        [self scrollToPage:1 animated:NO];

    }
}

- (void)setupCollectionLayout
{
    if (self.collectionView.collectionViewLayout) {
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
        layout.minimumLineSpacing = 24;
        layout.minimumInteritemSpacing = 24;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(163, 112);
    }
}

- (void)scrollToPage:(NSInteger)page animated:(BOOL)animated
{
    CoverComponentLayout *layout = (CoverComponentLayout *)_collectionView.collectionViewLayout;
    CGFloat offsetX = (layout.itemSize.width + layout.minimumLineSpacing) * page - (_collectionView.frame.size.width / 2 - layout.itemSize.width / 2);
    [_collectionView setContentOffset:CGPointMake(offsetX + layout.sectionInset.left, 0) animated:animated];
}



#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CoverComponentCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CoverComponentCollectionCell" forIndexPath:indexPath];
//    cell.label.text = [NSString stringWithFormat:@"item: %ld", (long)indexPath.item];
    NSInteger realIndex = indexPath.item % _realCount;
    PictureInfo *info = [_goodsInfo.images objectAtIndex:realIndex];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:info.pictureUrl] placeholderImage:nil];
    return cell;
}


@end
