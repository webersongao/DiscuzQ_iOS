//
//  DZQNetTool+invite.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+invite.h"


@implementation DZQNetTool (invite)

/// 普通用户创建邀请码
-(void)dz_userinviteCodeWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Invite_user,@"",@"");
    
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        NSDictionary *dict = (NSDictionary *)response;
        NSDictionary *data = [dict dictionaryForKey:@"data"];
        NSString *codeStr = [data stringForKey:@"code"];
        if (success) {
            success(codeStr,codeStr.length ? YES : NO);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
    
}



@end
