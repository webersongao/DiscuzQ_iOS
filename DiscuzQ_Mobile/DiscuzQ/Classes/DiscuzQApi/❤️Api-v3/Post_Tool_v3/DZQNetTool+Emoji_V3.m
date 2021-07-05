//
//  DZQNetTool+Emoji_V3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Emoji_V3.h"

@implementation DZQNetTool (Emoji_V3)

/// 全部 Emoji表情[列表]
-(void)DZQ_V3_EmojiListWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_EmojiList,@"",@"");
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_EmojiList, @"list") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
     
}

@end
