//
//  CoverComponentLayout.m
//  GoodsCoverComponentDemo
//
//  Created by tommy on 2017/3/3.
//  Copyright © 2017年 xu_yunan@163.com. All rights reserved.
//

#import "CoverComponentLayout.h"

@implementation CoverComponentLayout

- (void)prepareLayout
{
    [super prepareLayout];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    CGFloat maxDistance = [UIScreen mainScreen].bounds.size.width / 2;  // item中心点距离屏幕中心点最大距离
    
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5;
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        CGFloat itemCenterX = attr.center.x;
        CGFloat distance = ABS(itemCenterX - centerX);
        distance = MIN(distance, maxDistance);
        CGFloat scale = distance / maxDistance;
        scale =  0.2 * (maxDistance - distance) / maxDistance;
        // attr.size = CGSizeMake(self.itemSize.width * (1 + scale), self.itemSize.height * (1 + scale));
        attr.transform = CGAffineTransformMakeScale(1 + scale, 1 + scale);
    }
    return attrs;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat visibleX = proposedContentOffset.x;
    CGFloat visibleY = proposedContentOffset.y;
    CGFloat visibleW = self.collectionView.bounds.size.width;
    CGFloat visibleH = self.collectionView.bounds.size.height;
    CGRect visibleRect = CGRectMake(visibleX, visibleY, visibleW, visibleH);
    
    NSArray<UICollectionViewLayoutAttributes *> *attrs = [super layoutAttributesForElementsInRect:visibleRect];
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.bounds.size.width * 0.5;
    __block NSUInteger itemIndex = 0;
    __block CGFloat distance = ABS([attrs objectAtIndex:0].center.x - centerX);
    
    [attrs enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attr, NSUInteger idx, BOOL * _Nonnull stop) {
        if (ABS(attr.center.x - centerX) < distance) {
            distance = ABS(attr.center.x - centerX);
            itemIndex = idx;
        }
    }];
    
    if (distance == -1) {
        return proposedContentOffset;
    } else {
        // > 0 obj在右边, < 0 obj在左边
        distance = [attrs objectAtIndex:itemIndex].center.x - centerX;
        return CGPointMake(proposedContentOffset.x + distance, proposedContentOffset.y);
    }
}

@end
