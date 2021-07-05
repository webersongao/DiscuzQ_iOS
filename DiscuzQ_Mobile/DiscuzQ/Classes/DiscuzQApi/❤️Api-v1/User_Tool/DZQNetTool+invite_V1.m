//
//  DZQNetTool+invite_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+invite_V1.h"


@implementation DZQNetTool (invite_V1)

/// 普通用户创建邀请码
-(void)DZQ_V1_UserinviteCodeWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Invite_user,@"",@"");
    
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        NSDictionary *dict = (NSDictionary *)response;
        NSDictionary *data = [dict dictionaryForKey:@"data"];
        NSString *codeStr = [data stringForKey:@"code"];
        if (success) {
            success(codeStr,codeStr.length ? YES : NO);
        }
        
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
    
}



@end
