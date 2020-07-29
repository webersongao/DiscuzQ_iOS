//
//  DZLayoutTool.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZLayoutTool.h"

#define  kDis_PicCellWH     ((KScreenWidth - kMargin30 - kMargin10)/3.0)   // 首页发现列表 图片cell宽高


@implementation DZLayoutTool

// 默认 列表 布局
+ (UICollectionViewFlowLayout *)defaultLayout{
    
    UICollectionViewFlowLayout * listLayout = [[UICollectionViewFlowLayout alloc] init];
    listLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    listLayout.minimumLineSpacing = 0;  // 行间距 (上下间隔)
    listLayout.minimumInteritemSpacing = 0;  // 列间距 (左右间隔)
    listLayout.itemSize = CGSizeMake(KScreenWidth, kCellHeight_50);
    listLayout.sectionInset = UIEdgeInsetsMake(0,kCellMargins, kCellMargins, kCellMargins);
    
    return listLayout;
}

// 分类列表 九宫格模式 布局
+(UICollectionViewFlowLayout *)cateGridLayout{
    UICollectionViewFlowLayout * gridLayout = [[UICollectionViewFlowLayout alloc] init];
    gridLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    gridLayout.itemSize = CGSizeMake(kCellWidth, kCellHeight);
    gridLayout.minimumLineSpacing = kItemSpacing;
    gridLayout.sectionInset = UIEdgeInsetsMake(0,kCellMargins, 0, kCellMargins);
    return gridLayout;
}

// 用户头像 水平布局 布局
+ (UICollectionViewFlowLayout *)userListLayout{
    
    UICollectionViewFlowLayout * listLayout = [[UICollectionViewFlowLayout alloc] init];
    listLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    listLayout.minimumLineSpacing = kMargin5;  // 行间距 (上下间隔)
    listLayout.minimumInteritemSpacing = 50;  // 列间距 (左右间隔)
    listLayout.itemSize = CGSizeMake(kMargin30, kMargin30);
    listLayout.sectionInset = UIEdgeInsetsMake(kMargin5, 0, kMargin5, 0);
    
    return listLayout;
}

// 首页 列表 图片 九宫格模式 布局
+ (UICollectionViewFlowLayout *)discoverPicLayout{
    
    UICollectionViewFlowLayout * gridLayout = [[UICollectionViewFlowLayout alloc] init];
    gridLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    gridLayout.minimumLineSpacing = kMargin5-1;  // 行间距 (上下间隔)
    gridLayout.minimumInteritemSpacing = kMargin5-1;  // 列间距 (左右间隔)
    CGFloat cellWH = kDis_PicCellWH;
    gridLayout.itemSize = CGSizeMake(cellWH, cellWH);
    // 上下间距 为 10
    gridLayout.sectionInset = UIEdgeInsetsMake(kMargin10,0, kMargin10, 0);
    
    return gridLayout;
}


// 九宫格模式 布局
+ (UICollectionViewFlowLayout *)gridLayout{
    
    UICollectionViewFlowLayout * gridLayout = [[UICollectionViewFlowLayout alloc] init];
    gridLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    gridLayout.minimumLineSpacing = kLineSpacing;
    gridLayout.minimumInteritemSpacing = kItemSpacing;
    gridLayout.itemSize = CGSizeMake(kCellWidth, kCellHeight);
    gridLayout.sectionInset = UIEdgeInsetsMake(0,kCellMargins, kCellMargins, kCellMargins);
    
    return gridLayout;
}


// 列表 列表模式 布局
+ (UICollectionViewFlowLayout *)listLayout{
    
    UICollectionViewFlowLayout * listLayout = [[UICollectionViewFlowLayout alloc] init];
    listLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    listLayout.minimumLineSpacing = 0;  // 行间距 (上下间隔)
    listLayout.minimumInteritemSpacing = 0;  // 列间距 (左右间隔)
    listLayout.itemSize = CGSizeMake(KScreenWidth, kCellWidth);
    listLayout.sectionInset = UIEdgeInsetsMake(0,kCellMargins, kCellMargins, kCellMargins);
    
    return listLayout;
}

// 瀑布流 布局
+ (UICollectionViewFlowLayout *)waterLayout{
    
    UICollectionViewFlowLayout * waterLayout = [[UICollectionViewFlowLayout alloc] init];
    waterLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    waterLayout.minimumLineSpacing = 0;  // 行间距 (上下间隔)
    waterLayout.minimumInteritemSpacing = 0;  // 列间距 (左右间隔)
    waterLayout.itemSize = CGSizeMake(KScreenWidth, kCellWidth);
    waterLayout.sectionInset = UIEdgeInsetsMake(0,kCellMargins, kCellMargins, kCellMargins);
    
    return waterLayout;
}



@end







