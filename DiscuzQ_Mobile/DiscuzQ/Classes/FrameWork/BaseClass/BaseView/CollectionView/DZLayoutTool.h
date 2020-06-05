//
//  DZLayoutTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>


#define  kLineSpacing       KWidthScale(20.f)   //    行间距 |
#define  kItemSpacing       KWidthScale(10.f)  //    item之间的最小列间距  实际上是自动计算
#define  kCellMargins       KWidthScale(15.f)  //    左右缩进
#define  kRowNumber         3    //列数
#define  kCellWidth         KWidthScale(105.f)  //    Cell宽度
#define  kCellHeight        KWidthScale(150.f)  //    Cell高度 // kCellWidth + kCellTextSpace + kCellTextHeight


#define  kDis_PicCellWH     ((KScreenWidth - kMargin30 - kMargin10)/3.0)   // 首页发现列表 图片cell宽高


@interface DZLayoutTool : NSObject

// 默认 列表 布局
+ (UICollectionViewFlowLayout *)defaultLayout;

// 分类列表 九宫格模式 布局
+(UICollectionViewFlowLayout *)cateGridLayout;

// 用户头像布局 布局
+ (UICollectionViewFlowLayout *)userListLayout;

// 首页 列表 图片 九宫格模式 布局
+ (UICollectionViewFlowLayout *)discoverPicLayout;



// 九宫格模式 布局
+ (UICollectionViewFlowLayout *)gridLayout;

// 列表 列表模式 布局
+ (UICollectionViewFlowLayout *)listLayout;

// 瀑布流 布局
+ (UICollectionViewFlowLayout *)waterLayout;



@end


