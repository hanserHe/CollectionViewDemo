//
//  ComponentInfo.h
//  CollectionViewDemo
//
//  Created by Hanser on 01/11/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "PictureInfo.h"
typedef NS_ENUM(NSInteger, GoodsComponentType) {
    GoodsComponentTypeBanner = 100,           // banner head_1
    GoodsComponentTypeImage_1 = 101,          // 图片一排一个
    GoodsComponentTypeImage_2 = 102,          // 图片一排两个
    GoodsComponentTypeImage_4 = 103,          // 图片一排四个
    GoodsComponentTypeImage_2_5 = 104,        // 一排2.5个(图片)
    GoodsComponentTypeCoverFlow = 105,        // cover flow图片轮播
    GoodsComponentTypeGoods_3_5 = 200,        // 一排3.7个(商品)
    GoodsComponentTypeTab = 201,              // 锚点商品组件
    GoodsComponentTypeSubgoods = 202,         // 次新级商品
    GoodsComponentTypeRecommend = 203,        // 商品推荐组件
    GoodsComponentTypeCategory_1 = 301,       // 类目组件前端不显示类目名称（类目组件1）
    GoodsComponentTypeCategory_2 = 302,       // 类目组件前端显示类目名称（类目组件2）
    GoodsComponentTypeTimer = 401,            // 倒计时组件
    GoodsComponentTypeCoupon = 501,           // 平台券组件(按钮在图片上) tic_1
    GoodsComponentTypeCoupon_1 = 502,         // 店铺券组件(一排一个) tic_2
    GoodsComponentTypeCoupon_2 = 503,         // 店铺券组件(一排2个) tic_3
    GoodsComponentTypeGoods_4_Decimal = 2061, // 商品组件goods_4 一行2.5(3.5)个(横向排列)
    GoodsComponentTypeGoods_4_Integer = 2060, // 商品组件goods_4 一行整数个(平铺排列)
    GoodsComponentTypeImage_Integer = 1080,   // 图片组件，整数个(无缝连接)
    GoodsComponentTypeImage_Decimal = 1081,   // 图片组件，小数个(无缝连接)
    GoodsComponentTypeAnchor = 210,           // 锚点商品组件（一行2/3个）
    GoodsComponentTypeGoods_5 = 207,          // 商品组件goods_5 其它团
    GoodsComponentTypeGoods_6 = 208,          // 商品组件goods_6 新人超级团
    GoodsComponentTypeGoods_7 = 209,          // 商品组件goods_7 秒杀团
    
    GoodsComponentTypeGroupGoodsContent = 1997, // 商品组件goods_5, 自定义类型, 后端没有该类型
    GoodsComponentTypeSuperGoodsContent = 1998, // 商品组件goods_6, 自定义类型, 后端没有该类型
    GoodsComponentTypeSeckillGoodsContent = 1999, // 商品组件goods_7, 自定义类型, 后端没有该类型
    
    GoodsComponentTypeTabContent = 2000,      // 锚点子组件, 自定义类型, 后端没有改类型
    GoodsComponentTypeCouponContent = 2001,   // 卡券子组件, 自定义类型, 后端没有改类型
};

@interface ComponentInfo : PictureInfo

@property (nonatomic, copy) NSString *componentTitle;       // 组件标题
@property (nonatomic, assign) GoodsComponentType componentType;      // 组件类型
@property (nonatomic, copy) NSString *componentId;                   // 组件ID
@property (nonatomic, copy) PictureInfo *titleInfo;         // 组件标题对象
@property (nonatomic, copy) ComponentInfo *linkMore;        // 查看更多
@property (nonatomic, strong) NSArray *goodsList;           // 商品列表 <ComponentGoods>
@property (nonatomic, strong) NSArray *images;              // banner图，或者其它组件图片列表 <PictureInfo>
@property (nonatomic, assign) BOOL isShowImageName;         // 是否显示图片名称
@property (nonatomic, strong) NSArray *anchor;              // 锚点商品列表 <ComponentInfo>
@property (nonatomic, assign) BOOL isTop;                   // 是否顶通(全屏)
@property (nonatomic, assign) CGFloat column;               // 一行几个
// goods_4商品组件
@property (nonatomic, assign) BOOL isShowPriceTag;          // 是否展示新人(券后)价标签
// 团组件
@property (nonatomic, strong) NSArray * planInfoList;        // 团组件商品    //待修改
@property (nonatomic, assign) NSTimeInterval promotionStartTime;       // 排期开始时间
@property (nonatomic, assign) NSTimeInterval promotionEndTime;         // 排期结束时间
@property (nonatomic, copy) NSString * planId;              // 排期ID

// 券组件字段
@property (nonatomic, copy) NSString *couponId;             // 券ID
@property (nonatomic, assign) BOOL showPriceRule;           // 是否展示券后价 0：全部商品 1：券后价商品
@property (nonatomic, strong) NSArray *buttonPicList;       // 券组件按钮状态
@property (nonatomic, assign) BOOL isShowGoods;             // 是否展示券商品
@property (nonatomic, assign) NSInteger couponStatus;       // 卡券状态: 1 即将开始, 2 立即领取, 3 已领取, 4 已抢光
@property (nonatomic, strong) NSArray<ComponentInfo *> *couponGoodsList;     // 券商品列表
@property (nonatomic, copy) NSString *couponActivityId;     // 店铺券的活动id
@property (nonatomic, copy) NSString *couponChannelId;      // 平台券的渠道id

// 倒计时组件字段(秒级)
@property (nonatomic, assign) NSTimeInterval startTime;     // 开始时间戳
@property (nonatomic, assign) NSTimeInterval endTime;       // 结束时间戳

// 类目组件字段
@property (nonatomic, strong) NSArray *categoryList;

// pictureUrl -> super class
// ratio -> super class // 图片比例

//////////////////////////////////////////////////
// 自定义券组件状态属性
//////////////////////////////////////////////////
//@property (nonatomic, strong) CouponComponentStatus * couponComponentStatus;
@property (nonatomic, assign) BOOL hasTitle;     //秒杀团组件，有title跟没title，UI不一样，所以新增自定义字段来判断是否有title
//////////////////////////////////////////////////
// 自定义属性、方法
//////////////////////////////////////////////////

@property (nonatomic, readonly) CGFloat spacing;            // item 间距
@property (nonatomic, readonly) UIEdgeInsets sectionInset;  // 组件外边距
@property (nonatomic, readonly) UICollectionViewScrollDirection scrollDirection;    // 组件滑动方向
@property (nonatomic, readonly) CGSize itemSize;            // item 大小

- (CGFloat)height;          // 组件高度
- (CGFloat)titleHeight;     // 组件头高度
- (CGFloat)bodyHeight;      // 组件体高度
@end
