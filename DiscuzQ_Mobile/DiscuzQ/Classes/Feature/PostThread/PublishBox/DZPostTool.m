//
//  DZPostTool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostTool.h"

@implementation DZPostTool

+(BOOL)isDraftCanPublish:(DZThreadDraftM *)localDraft{
    
    if (!localDraft.content.length) {
        [DZMobileCtrl showAlertWarn:@"主题内容为空"];
        return NO;
    }

    if (localDraft.type == 1 && !localDraft.title.length) {
        [DZMobileCtrl showAlertWarn:@"文章标题为空"];
        return NO;
    }
    
    return YES;
}


+(void)publishLocalThread:(DZThreadDraftM *)draft captcha:(NSDictionary *)captcha completion:(void (^)(DZQDataUser *varModel, BOOL success))completion failure:(void (^)(DZQErrorV1 * error))failure{

    [[DZNetCenter center] dzx_threadPublishWithPara:draft captcha:captcha completion:^(DZQDataUser * _Nonnull varModel, BOOL success) {
        if (completion) {
            completion(varModel,success);
        }
    } failure:^(DZQErrorV1 * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];

}


@end
