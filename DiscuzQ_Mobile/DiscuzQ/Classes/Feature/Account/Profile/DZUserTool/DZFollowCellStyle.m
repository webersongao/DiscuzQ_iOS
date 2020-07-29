//
//  DZFollowCellStyle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZFollowCellStyle.h"

@implementation DZFollowCellStyle

+(DZFollowCellStyle *)inner_dataStyle:(DZQDataFollow *)dataModel{
    
    [self formartPostContentString:dataModel];
    
    return [self canculatePostContentStyle:dataModel];
    
}

+ (void)formartPostContentString:(DZQDataFollow *)dataModel{
    
    dataModel.attributes.created_at = [dataModel.attributes.created_at dateFormatWithAccurate:unAccurate];
    dataModel.attributes.updated_at = [dataModel.attributes.updated_at dateFormatWithAccurate:unAccurate];
    
}


// 计算 空间高度 宽度等
+ (instancetype)canculatePostContentStyle:(DZQDataFollow *)dataModel{
    
    DZFollowCellStyle *postCellStyle = [self DFollowCellStyle:dz_CellWidth maxWidth:dz_CellMaxContentWidth dataModel:dataModel];
    
    
    return postCellStyle;
}

// 计算 用户 内容 frame
+(instancetype)DFollowCellStyle:(CGFloat)cellWidth maxWidth:(CGFloat)contenMaxWidth dataModel:(DZQDataFollow *)dataModel{
    
    DZFollowCellStyle *postStyle = [[DZFollowCellStyle alloc] init];
    
    postStyle.frame_Follow_user = [DZDUserStyle DUserStyle:cellWidth basic:YES];
    
    // 粉丝
    NSString *firstString = dataModel.relationships.fromUser.attributes.username;
    // 关注
    NSString *replyUserName = dataModel.relationships.toUser.attributes.username;
    
    if (replyUserName.length) {
        firstString = checkTwoStr(@"粉丝：", firstString);
    }
    
    postStyle.frame_Follow_user.nameAttributedString = [NSString attributeTextWithFrontString:firstString textColor:KTitle_Color Font:KFont(14) endString:replyUserName endtextColor:KGreen_Color endFont:KFont(14) LineSpaceing:0];
    
    postStyle.kf_Follow_user = CGRectMake(0, 0, cellWidth, postStyle.frame_Follow_user.kf_UserHeight);
    
    postStyle.kf_Follow_CellHeight = CGRectGetHeight(postStyle.kf_Follow_user);
    
    return postStyle;
}




@end
