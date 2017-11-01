//
//  ComponentInfo.m
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "ComponentInfo.h"

@implementation ComponentInfo
- (CGFloat)spacing
{
    if (_componentType == GoodsComponentTypeCoverFlow) {
        return 24;  // 控制cover flow item之间的间距
    } else if (_componentType == GoodsComponentTypeRecommend || _componentType == GoodsComponentTypeImage_4 || _componentType == GoodsComponentTypeCouponContent || _componentType == GoodsComponentTypeImage_Integer|| _componentType == GoodsComponentTypeImage_Decimal) {
        return 0;
    } else if (_componentType == GoodsComponentTypeGoods_4_Decimal){
        return 20;
    } else if (_componentType == GoodsComponentTypeGoods_4_Integer){
        if (_column == 2) {
            return 0;
        }else{
            return 20;
        }
    }else {
        return 10;
    }
}

- (UIEdgeInsets)sectionInset
{
    if (_componentType == GoodsComponentTypeBanner || _componentType == GoodsComponentTypeImage_1 || _componentType == GoodsComponentTypeImage_Integer || _componentType == GoodsComponentTypeImage_Decimal) {
        return UIEdgeInsetsZero;
    } else if (_componentType == GoodsComponentTypeRecommend || _componentType == GoodsComponentTypeImage_4) {
        return UIEdgeInsetsZero;
    } else if (_componentType == GoodsComponentTypeCoupon_2) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    } else if (_componentType == GoodsComponentTypeCouponContent){
        return UIEdgeInsetsMake(20, 20, 20, 20);
    } else if (_componentType == GoodsComponentTypeGoods_4_Decimal){
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }else if (_componentType == GoodsComponentTypeGoods_4_Integer){
        if (_column == 3){
            return UIEdgeInsetsMake(0, 10, 0, 10);
        }else{
            return UIEdgeInsetsZero;
        }
    }else {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }
}

- (UICollectionViewScrollDirection)scrollDirection
{
    if (_componentType == GoodsComponentTypeImage_2 || _componentType == GoodsComponentTypeImage_4 || _componentType == GoodsComponentTypeRecommend || _componentType == GoodsComponentTypeTabContent || _componentType == GoodsComponentTypeCoupon_2 || _componentType == GoodsComponentTypeCouponContent || _componentType == GoodsComponentTypeImage_Integer) {
        return UICollectionViewScrollDirectionVertical;
    } else {
        return UICollectionViewScrollDirectionHorizontal;
    }
}

//- (CGSize)itemSize
//{
//    CGSize size = CGSizeZero;
//
//    if (_componentType == GoodsComponentTypeBanner || _componentType == GoodsComponentTypeImage_1) {
//        size.width = ScreenWidth;
//        size.height = ScreenWidth * self.ratio;
//    } else if (_componentType == GoodsComponentTypeImage_2) {
//        size.width = [self itemWidthForColumn:2];
//        size.height = size.width * self.ratio + [ComponentImageCollectionCell heightExceptImage:self.isShowImageName]; // + 商品名称高度
//
//    } else if (_componentType == GoodsComponentTypeImage_4) {
//        size.width = [self itemWidthForColumn:4];
//        size.height = size.width * self.ratio + [ComponentImageCollectionCell heightExceptImage:self.isShowImageName]; // + 商品名称高度
//
//    } else if (_componentType == GoodsComponentTypeImage_2_5) {
//        size.width = [self itemWidthForColumn:2.65];
//        size.height = size.width * self.ratio + [ComponentImageCollectionCell heightExceptImage:self.isShowImageName]; // + 商品名称高度
//
//    } else if (_componentType == GoodsComponentTypeGoods_3_5 || _componentType == GoodsComponentTypeSubgoods) {
//        size.width = [self itemWidthForColumn:3.5];
//        size.height = size.width * self.ratio + [ComponentGoodsCollectionCell heightExceptImage];
//    } else if (_componentType == GoodsComponentTypeRecommend) {
//        size.width = [self itemWidthForColumn:3];
//        size.height = 0;    // 比例是从推荐接口过来的，这个放在主contoller中计算
//    } else if (_componentType == GoodsComponentTypeCoverFlow) {
//        size.width = (ScreenWidth - 2 * self.spacing) / 2.0f;
//        size.height = size.width * self.ratio;
//    } else if (_componentType == GoodsComponentTypeTabContent) {
//        if (_column) {
//            size.width = ScreenWidth / _column;
//            if (_column == 2) {
//                if (_isShowPriceTag) {
//                    size.height = (size.width - 20) * self.ratio + 90.5 + 29;
//                }else{
//                    size.height = (size.width - 20) * self.ratio + 90.5;
//                }
//            }else{
//                //size.height = (size.width - 20) * self.ratio + 52;
//                size.height = (size.width - 20) * self.ratio + 64 + 24;
//            }
//            //            size.width = ScreenWidth / _column;
//            //            size.height = (size.width - 20) * self.ratio + 89;  // 20 是间隙, cell左右各10
//        }else{
//            size.width = ScreenWidth / 3.0;
//            size.height = (size.width - 20) * self.ratio + 89;  // 20 是间隙, cell左右各10
//        }
//    } else if (_componentType == GoodsComponentTypeCategory_1) {
//        size.width = (ScreenWidth) / 2.0;
//        size.height = size.width * (267.5/185.0f);  // (比例是高宽比)
//    } else if (_componentType == GoodsComponentTypeCoupon_2) {
//        size.width = (ScreenWidth - 3 * self.spacing) / 2.0;
//        //        size.height = size.width * (225/175.0f);    // (比例是高宽比)
//        size.height = size.width * self.ratio + 40;
//    } else if (_componentType == GoodsComponentTypeCouponContent) {
//        size.width = (ScreenWidth - 65 - 40) / 3.0;
//        if (!self.ratio) {self.ratio = 1;}
//        if (_showPriceRule) {
//            //size.height = size.width * self.ratio + 65;
//            size.height = size.width * self.ratio + 65 + 18;
//        }else{
//            //size.height = size.width * self.ratio + 65 - 22;
//            size.height = size.width * self.ratio + 65 - 22 + 18;
//        }
//    }  else if (_componentType == GoodsComponentTypeGoods_4_Decimal) {
//        if (!self.ratio) {
//            self.ratio = 1;
//        }
//        size.width = (ScreenWidth - 10 - 20 - 20 - 10) / _column; //15 items的间距 10 sectionInset.left
//        if (_isShowPriceTag) {
//            size.height = size.width * self.ratio + 52 + 29;
//        }else{
//            size.height = size.width * self.ratio + 52;
//        }
//    }  else if (_componentType == GoodsComponentTypeGoods_4_Integer) {
//        if (!self.ratio) {
//            self.ratio = 1;
//        }
//        if (_column == 2) {
//            size.width = ScreenWidth / 2;
//            if (_isShowPriceTag) {
//                size.height = (size.width - 20) * self.ratio + 90.5 + 29;
//            }else{
//                size.height = (size.width - 20) * self.ratio + 90.5;
//            }
//        }else if (_column == 3){
//            size.width = (ScreenWidth - 10 - 20 - 20 - 10) / 3; //15 items的间距 10 sectionInset.left
//            if (_isShowPriceTag) {
//                //size.height = size.width * self.ratio + 52 + 29;
//                size.height = size.width * self.ratio + 64 + 29;
//            }else{
//                //size.height = size.width * self.ratio + 52;
//                size.height = size.width * self.ratio + 64;
//            }
//        }
//    }else if (_componentType == GoodsComponentTypeImage_Integer || _componentType == GoodsComponentTypeImage_Decimal){
//
//        size.width = ((ScreenWidth - self.sectionInset.left - self.sectionInset.right) - (((int)_column - 1) * self.spacing)) / _column;
//
//        size.height = size.width * self.ratio + [ComponentImageCollectionCell heightExceptImage:self.isShowImageName]; // + 商品名称高度
//    }else if (_componentType == GoodsComponentTypeGroupGoodsContent || _componentType == GoodsComponentTypeSuperGoodsContent || _componentType == GoodsComponentTypeSeckillGoodsContent){
//        size.width = ScreenWidth;
//        size.height = 135;
//    }else if (_componentType == GoodsComponentTypeGoods_5 || _componentType == GoodsComponentTypeGoods_6 || _componentType == GoodsComponentTypeGoods_7){
//        //给个默认的宽，否则会报 negative or zero item sizes are not supported in the flow layout 错误
//        size.width = ScreenWidth;
//        size.height = 0;
//    }
//    return  [self mapsItemSize:size];
//}

- (CGSize)mapsItemSize:(CGSize)size
{
    CGSize itemSize;
    if (_componentType == GoodsComponentTypeCategory_1 || (_componentType == GoodsComponentTypeGoods_4_Integer && _column == 2) || _componentType == GoodsComponentTypeTabContent || _componentType == GoodsComponentTypeImage_Integer || _componentType == GoodsComponentTypeImage_Decimal) {
        itemSize = CGSizeMake(size.width, size.height);
    } else {
        itemSize = CGSizeMake((int)size.width, size.height);
    }
    return itemSize;
}

- (NSInteger)itemWidthForColumn:(CGFloat)column
{
    // (去除左右边距的整体宽度) - (间隙总宽度) / column
    CGFloat width = ((ScreenWidth - self.sectionInset.left - self.sectionInset.right) - (((int)column - 1) * self.spacing)) / column;
    return (int)width;  // 避免因小数点，导致排版错误
}

- (CGFloat)height
{
    CGFloat h = 0;
    if (_componentType == GoodsComponentTypeTab || _componentType == GoodsComponentTypeAnchor) {
        h = 40;
    } else if (_componentType == GoodsComponentTypeTimer) {
        h = 110;
    } else {
        h = [self titleHeight] + [self bodyHeight];
    }
    return (int)h;
}

- (CGFloat)titleHeight
{
    CGFloat h = 0;
    
    if (_componentType == GoodsComponentTypeGroupGoodsContent || _componentType == GoodsComponentTypeSuperGoodsContent || _componentType == GoodsComponentTypeSeckillGoodsContent) {
        if (self.title && self.promotionStartTime) {
            return 45;
        }else{
            return 0;
        }
    }
    
    if (self.titleInfo.pictureUrl.length > 0) {
        h = ScreenWidth * self.titleInfo.ratio;
    } else if (self.titleInfo.title.length > 0) {
        if (_componentType == GoodsComponentTypeTabContent) {
            h = 44;
        } else {
            h = 50;
        }
    }
    return (int)h;
}

- (CGFloat)bodyHeight
{
    if (_componentType == GoodsComponentTypeBanner) {
        return [self itemSize].height;
    } if (_componentType == GoodsComponentTypeImage_1) {
        return [self itemSize].height;
    } else if (_componentType == GoodsComponentTypeImage_2) {   // (x+n-1)/n
        NSInteger column = 2;
        NSInteger row = (self.images.count + column - 1) / column;
        CGFloat bodyHeight = [self sectionInset].top + [self sectionInset].bottom + [self itemSize].height * row + [self spacing] * (row - 1);
        return bodyHeight;
    } else if (_componentType == GoodsComponentTypeImage_4) {   // (x+n-1)/n
        NSInteger column = 4;
        NSInteger row = (self.images.count + column - 1) / column;
        CGFloat bodyHeight = [self sectionInset].top + [self sectionInset].bottom + [self itemSize].height * row + [self spacing] * (row - 1);
        return bodyHeight;
    } else if (_componentType == GoodsComponentTypeRecommend) {  // (x+n-1)/n
        NSInteger column = 3;
        NSInteger row = (self.images.count + column - 1) / column;
        CGFloat bodyHeight = [self sectionInset].top + [self sectionInset].bottom + [self itemSize].height * row + [self spacing] * (row - 1);
        return bodyHeight;
    } else if (_componentType == GoodsComponentTypeCoverFlow) {     // 0.2 是放大的倍数, 在CoverComponentLayout中
        return [self itemSize].height * (1 + 0.2) + [self sectionInset].top + [self sectionInset].bottom;
    } else if (_componentType == GoodsComponentTypeTabContent) {    // (x+n-1)/n
        if (_column) {
            NSInteger row = (self.goodsList.count + _column - 1) / _column;
            return [self itemSize].height * row;
        }else{
            NSInteger column = 3;
            NSInteger row = (self.goodsList.count + column - 1) / column;
            return [self itemSize].height * row;
        }
    } else if (_componentType == GoodsComponentTypeTab) {
        return 0;
    } else if (_componentType == GoodsComponentTypeCoupon_2) {
        NSInteger column = 2;
        NSInteger row = (self.images.count + column - 1) / column;
        CGFloat bodyHeight = [self sectionInset].top + [self sectionInset].bottom + [self itemSize].height * row + [self spacing] * (row - 1);
        return bodyHeight;
    } else if (_componentType == GoodsComponentTypeCoupon) {
        return ScreenWidth * self.ratio;
    } else if (_componentType == GoodsComponentTypeCoupon_1) {
        return ScreenWidth * self.ratio;
    } else if (_componentType == GoodsComponentTypeCouponContent) {
        NSInteger column = 3;
        NSInteger row = (self.goodsList.count + column - 1) / column;
        CGFloat bodyHeight = [self sectionInset].top + [self sectionInset].bottom + [self itemSize].height * row + [self spacing] * (row - 1);
        return bodyHeight;
    } else if (_componentType == GoodsComponentTypeImage_Integer) {   // (x+n-1)/n
        NSInteger row = (self.images.count + _column - 1) / _column;
        CGFloat bodyHeight = [self sectionInset].top + [self sectionInset].bottom + [self itemSize].height * row + [self spacing] * (row - 1);
        return bodyHeight;
    } else {
        return [self itemSize].height + [self sectionInset].top + [self sectionInset].bottom;
    }
}

//+ (id)goodsList_class
//{
//    return [ComponentGoods class];
//}

+ (id)images_class
{
    return [ComponentInfo class];
}

+ (id)anchor_class
{
    return [ComponentInfo class];
}

+ (id)buttonPicList_class{
    return [ComponentInfo class];
}

+ (id)couponGoodsList_class{
    return [ComponentInfo class];
}

//+ (id)categoryList_class
//{
//    return [GoodsCategoryInfo class];
//}

//+ (id)couponComponentStatus_class
//{
//    return [CouponComponentStatus class];
//}

+ (id)planInfoList_class{
    return [ComponentInfo class];
}


@end
