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

@interface GoodsComponentBody()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger realCount;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSTimer *timer;

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
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[CoverComponentCollectionCell class] forCellWithReuseIdentifier:@"CoverComponentCollectionCell"];
    return _collectionView;
}

- (void)setGoodsInfo:(GoodsInfo *)goodsInfo {
    if (_goodsInfo != goodsInfo) {
        _goodsInfo = goodsInfo;
        
        _realCount = _goodsInfo.images.count;
        _count = _realCount * 3;
        [self setupCollectionLayout];

        [self.collectionView reloadData];
        [self scrollToPage:1 animated:NO];
        [self.timer fire];

    }
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self.collectionView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
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

- (NSTimer *)timer {
    if (_timer) {
        return _timer;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:5
                                              target:self selector:@selector(timeDidFired:)
                                            userInfo:nil
                                             repeats:YES];
    return _timer;
}

- (void)timeDidFired:(NSTimer *)timer {
    NSInteger pageNum = [self currentPage];
    [self scrollToPage:pageNum + 1 animated:YES];
}

- (NSInteger)currentPage
{
    CoverComponentLayout *layout = (CoverComponentLayout *)_collectionView.collectionViewLayout;
    NSInteger pageNum = (_collectionView.contentOffset.x - layout.sectionInset.left + _collectionView.frame.size.width / 2.0f) / (layout.itemSize.width + layout.minimumLineSpacing);
    return pageNum;
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

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(163, 112);
//}



#pragma mark - UIScrollViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // NSLog(@"第 %ld 页     offset.x: %f", [self currentPage], _collectionView.contentOffset.x);
    
    // 如果落在第一和第三区间，要移到第二区间
    
    if ([self currentPage] < _realCount) {  // 第一区间
        [self scrollToPage:[self currentPage] + _realCount animated:NO];
    } else if ([self currentPage] >= _realCount && [self currentPage] < _realCount * 2) {   // 第二区间
        
    } else if ([self currentPage] >= _realCount * 2) {   // 第三区间
        [self scrollToPage:[self currentPage] - _realCount animated:NO];
    }
}



- (void)dealloc {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
