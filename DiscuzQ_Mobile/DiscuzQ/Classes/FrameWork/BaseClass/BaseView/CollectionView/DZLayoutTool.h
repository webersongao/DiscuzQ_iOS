//
//  DZLayoutTool.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>


#define  kRowNumber         5.0    //列数
#define  kLineSpacing       KWidthScale(20.f)   //    行间距 |
#define  kItemSpacing       KWidthScale(10.f)  //    item之间的最小列间距
#define  kCellMargins       KWidthScale(15.f)  //    左右缩进
#define  kCellWidth         ((KScreenWidth - (kCellMargins * 2) - ((kRowNumber-1.0) * kItemSpacing))/kRowNumber)  //    Cell宽度
#define  kCellHeight        KWidthScale(60.f)  //    Cell高度

#define  kHeaderIconHeight  KWidthScale(40.f)



@interface DZLayoutTool : NSObject

// 默认 列表 布局
+ (UICollectionViewFlowLayout *)defaultLayout;

// 分类列表 九宫格模式 布局
+(UICollectionViewFlowLayout *)cateGridLayout;

// 用户头像布局 布局
+ (UICollectionViewFlowLayout *)userListLayout;

// 首页 列表 图片 九宫格模式 布局
+ (UICollectionViewFlowLayout *)homePicLayout;



// 九宫格模式 布局
+ (UICollectionViewFlowLayout *)gridLayout;

// 列表 列表模式 布局
+ (UICollectionViewFlowLayout *)listLayout;

// 瀑布流 布局
+ (UICollectionViewFlowLayout *)waterLayout;



@end


