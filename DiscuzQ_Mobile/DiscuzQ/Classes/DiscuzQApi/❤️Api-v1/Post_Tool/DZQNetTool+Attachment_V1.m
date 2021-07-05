//
//  DZQNetTool+Attachment_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Attachment_V1.h"


@implementation DZQNetTool (Attachment_V1)


/// 上传附件
-(void)DZQ_V1_AttachmentUploadWithQuery:(NSString *)query file:(NSString *)filePath success:(PRCompleteBlock)success progress:(PRProgressBlock)progress failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Attach_upload,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_UploadReqWithUrl:UrlString parameters:nil urlTag:2443 appendBodyBlock:^(id<AFMultipartFormData> formData) {
        NSLog(@"WBS 在这里拼接上传数据");
    } progress:^(NSProgress *upProgress) {
        if (progress) {
            progress(upProgress.fractionCompleted);
        }
    } success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Attach_upload, @"upload") completion:^(DZQBaseRes *resModel) {
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


/// 删除 附件
-(void)DZQ_V1_AttachmentDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Attach_delete,subCtrl,nil);
    
    DZQWEAKSELF
    [self.NetClient baidu_DeleteReqWithUrl:UrlString urlTag:0 parameters:nil success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Attach_delete, @"delete") completion:^(DZQBaseRes *resModel) {
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
