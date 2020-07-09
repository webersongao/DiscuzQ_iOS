//
//  DZDListStyle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDListStyle.h"

@implementation DZDUserStyle

/// @param isBasic 为 YES 时 整体偏小
+(instancetype)DUserStyle:(CGFloat)cellWidth basic:(BOOL)isBasic{
    
    DZDUserStyle *userStyle = [[DZDUserStyle alloc] init];
    
    // 第一部分 用户基本信息
    if (isBasic) {
        
        userStyle.kf_avatar = CGRectMake(kMargin15, kMargin5, 34, 34);
        userStyle.kf_userName = CGRectMake(CGRectGetMaxX(userStyle.kf_avatar) + kMargin10, kMargin15, 230, 14);
        userStyle.kf_userTag = CGRectMake(CGRectGetMaxX(userStyle.kf_avatar)-15, CGRectGetMaxY(userStyle.kf_avatar)-15, 15, 15);
        userStyle.kf_time = CGRectMake(cellWidth-kMargin15 - 100, kMargin15, 100, 14);
        userStyle.kf_bottomLine = CGRectMake(0, CGRectGetMaxY(userStyle.kf_avatar)+kMargin5, cellWidth, 0.5);
        
        userStyle.kf_grade = CGRectZero;
        userStyle.kf_postMore = CGRectZero;
        userStyle.kf_threadTag = CGRectZero;
        
    }else{
        
        userStyle.kf_avatar = CGRectMake(kMargin15, kMargin10, 40, 40);
        userStyle.kf_userTag = CGRectMake(CGRectGetMaxX(userStyle.kf_avatar)-10, CGRectGetMaxY(userStyle.kf_avatar)-10, 10, 10);
        userStyle.kf_userName = CGRectMake(CGRectGetMaxX(userStyle.kf_avatar)+kMargin15, CGRectGetMinX(userStyle.kf_avatar), 250, 15);
        userStyle.kf_grade = CGRectMake(0, 0, 0, 0);
        userStyle.kf_time = CGRectMake(CGRectGetMaxX(userStyle.kf_avatar)+kMargin15, CGRectGetMaxY(userStyle.kf_avatar)-13, 250, 13);
        
        userStyle.kf_postMore = CGRectMake(cellWidth-kMargin15-20, CGRectGetMinX(userStyle.kf_avatar), 20, 18);
        userStyle.kf_threadTag = CGRectMake(cellWidth-kMargin15-kMargin10-(20 * 2), CGRectGetMinX(userStyle.kf_avatar), 20, 18);
        
        userStyle.kf_bottomLine = CGRectMake(0, CGRectGetMaxY(userStyle.kf_avatar)+kMargin10, cellWidth, 0.5);
        
    }
    
    userStyle.kf_UserHeight = CGRectGetMaxY(userStyle.kf_bottomLine);
    
    
    return userStyle;
}

@end


@implementation DZDGridItemStyle

+(instancetype)DGridItemStyleWithCount:(NSInteger)allCount superWidth:(CGFloat)superWidth{
    
    DZDGridItemStyle *itemStyle = [[DZDGridItemStyle alloc] init];
    
    itemStyle.itemSize = [DZDGridItemStyle DGridItemHeightWithCount:allCount superWidth:superWidth];
    
    return itemStyle;
}

+(CGSize)DGridItemHeightWithCount:(NSInteger)allCount superWidth:(CGFloat)superWidth{
    
    CGFloat superGridH = 0;
    CGFloat superGridW = 0;
    
    if (allCount == 1) {
        
        superGridW = superWidth;
        superGridH = superWidth * KImageWHOneRatio;
        
    }else if (allCount == 2 || allCount == 4){
        
        superGridW = (superWidth - kMargin5)/2.0;
        superGridH = superGridW * KImageWHTwoRatio;
        
    }else{
        
        superGridW = (superWidth - kMargin10)/3.0;
        superGridH = superGridW;
    }
    
    return CGSizeMake(superGridW, superGridH);
}


@end


@implementation DZDGridStyle

+(instancetype)DGridImageStyle:(NSArray<DZQDataAttachment *> *)dataImage cellWidth:(CGFloat)cellWidth{
    
    
    CGFloat superWidth = cellWidth - kMargin30;
    
    for (DZQDataAttachment *imageAttach in dataImage) {
        imageAttach.styleModel = [DZDGridItemStyle DGridItemStyleWithCount:dataImage.count superWidth:superWidth];
    }
    
    DZDGridStyle *grid = [[DZDGridStyle alloc] init];
    
    // 行间距 (上下间隔)
    grid.minimumLine = kMargin5-1;
    // 列间距 (左右间隔)
    grid.minimumInteritem = kMargin5-1;
    
    // (最多三张图，间距为5 合计为10)
    CGFloat itemWH = (superWidth - kMargin10)/3.0;
    grid.defaultItemSize = CGSizeMake(itemWH, itemWH);
    
    grid.gridEdge = UIEdgeInsetsZero;
    
    
    return dataImage.count ? grid : nil;
}

@end




@implementation DZDToolBarStyle

+(instancetype)DToolBarStyle:(CGFloat)cellWidth{
    
    DZDToolBarStyle *barStyle = [[DZDToolBarStyle alloc] init];
    
    barStyle.kf_left = CGRectMake(0, 0, (cellWidth)/3.0, kMiniBarHeight);
    barStyle.kf_center = CGRectMake((cellWidth)/3.0, 0, (cellWidth)/3.0, kMiniBarHeight);
    barStyle.kf_right = CGRectMake(((cellWidth)/3.0)*2.0, 0, (cellWidth)/3.0, kMiniBarHeight);
    barStyle.kf_barLine = CGRectMake(0, CGRectGetMaxY(barStyle.kf_right), cellWidth, 10);
    
    barStyle.kf_ToolBarHeight = CGRectGetHeight(barStyle.kf_right)+CGRectGetHeight(barStyle.kf_barLine);
    
    return barStyle;
}


@end
