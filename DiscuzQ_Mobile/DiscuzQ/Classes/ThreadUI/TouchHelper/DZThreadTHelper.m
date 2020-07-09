//
//  DZThreadTHelper.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadTHelper.h"
#import "DZShareCenter.h"

@implementation DZThreadTHelper

// 点赞主题
+ (void)thread_LikeCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 点赞~~~");
    
}

// 评论主题
+ (void)thread_CommentCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 评论~~~");
    
}

// 分享主题
+ (void)thread_SharedCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 分享~~~");
    
    [DZShareCenter shareActionWithModel:nil];
}

// 主题 收藏
+ (void)thread_FavoriteCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 收藏~~~");
    
}


// 作者个人中心
+ (void)thread_UserCenterCellAction:(DZQDataUser *)postModel{
    
    KSLog(@"WBS 个人中心~~~");
    
}


// 主题管理（更多）
+ (void)thread_MoreCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 更多~~~");
    
}



// 点击 图片九宫格
+ (void)touchThreadPicSquareData:(NSArray<YBIBImageData *> *)attachArray DidSelectItem:(NSInteger)index{
    
    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataSourceArray = attachArray;
    browser.currentPage = index;
    [browser show];
    
}




@end
