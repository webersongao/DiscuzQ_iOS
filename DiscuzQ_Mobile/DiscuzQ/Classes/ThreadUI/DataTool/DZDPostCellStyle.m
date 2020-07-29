//
//  DZDPostCellStyle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDPostCellStyle.h"

@implementation DZDPostCellStyle

+(DZDPostCellStyle *)inner_dataStyle:(DZQDataPost *)dataModel{
    
    [self formartPostContentString:dataModel];
    
    return [self canculatePostContentStyle:dataModel];
    
}

+ (void)formartPostContentString:(DZQDataPost *)dataModel{
    
    dataModel.attributes.createdAt = [dataModel.attributes.createdAt dateFormatWithAccurate:unAccurate];
    dataModel.attributes.updatedAt = [dataModel.attributes.updatedAt dateFormatWithAccurate:unAccurate];
    
}


// 计算 空间高度 宽度等
+ (instancetype)canculatePostContentStyle:(DZQDataPost *)dataModel{
    
    DZDPostCellStyle *postCellStyle = [self DPostCellStyle:dz_CellWidth maxWidth:dz_CellMaxContentWidth dataModel:dataModel];
    
    
    return postCellStyle;
}

// 计算评论内容 frame
+(instancetype)DPostCellStyle:(CGFloat)cellWidth maxWidth:(CGFloat)contenMaxWidth dataModel:(DZQDataPost *)dataModel{
    
    DZDPostCellStyle *postStyle = [[DZDPostCellStyle alloc] init];
    
    postStyle.frame_post_user = [DZDUserStyle DUserStyle:cellWidth basic:YES];
    
    NSString *firstString = dataModel.relationships.user.attributes.username;
    NSString *replyUserName = dataModel.relationships.replyUser.attributes.username;
    
    if (replyUserName.length) {
        firstString = checkTwoStr(firstString, @" 回复了 ");
    }
    
    postStyle.frame_post_user.nameAttributedString = [NSString attributeTextWithFrontString:firstString textColor:KTitle_Color Font:KFont(14) endString:replyUserName endtextColor:KGreen_Color endFont:KFont(14) LineSpaceing:0];
    
    postStyle.frame_post_content = [DZDContentStyle DPostContentStyleWithMaxW:contenMaxWidth cellWidth:cellWidth dataModel:dataModel];
    postStyle.frame_post_toolBar = [DZDToolBarStyle DToolBarStyle:cellWidth];
    
    postStyle.kf_post_user = CGRectMake(0, 0, cellWidth, postStyle.frame_post_user.kf_UserHeight);
    postStyle.kf_post_content = CGRectMake(0, CGRectGetMaxY(postStyle.kf_post_user), cellWidth, postStyle.frame_post_content.kf_ContentHeight);
    postStyle.kf_post_toolBar = CGRectMake(0, CGRectGetMaxY(postStyle.kf_post_content), cellWidth, postStyle.frame_post_toolBar.kf_ToolBarHeight);
    
    postStyle.kf_post_CellHeight = CGRectGetHeight(postStyle.kf_post_user) + CGRectGetHeight(postStyle.kf_post_content) + CGRectGetHeight(postStyle.kf_post_toolBar);
    
    return postStyle;
}




@end
