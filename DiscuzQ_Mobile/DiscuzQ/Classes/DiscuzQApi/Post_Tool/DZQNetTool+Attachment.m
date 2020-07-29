//
//  DZQNetTool+Attachment.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Attachment.h"


@implementation DZQNetTool (Attachment)


/// 上传附件
-(void)dz_attachmentUploadWithQuery:(NSString *)query file:(NSString *)filePath success:(PRCompleteBlock)success progress:(PRProgressBlock)progress failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Attach_upload,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_UploadRequestWithUrl:UrlString parameters:nil urlTag:2443 appendBodyBlock:^(id<AFMultipartFormData> formData) {
        
    } progress:^(NSProgress *upProgress) {
        if (progress) {
            progress(upProgress.fractionCompleted);
        }
    } success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Attach_upload, @"upload") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failure) {
                   failure(error);
               }
    } cancel:nil];
     
}


/// 删除 附件
-(void)dz_attachmentDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Attach_delete,subCtrl,nil);
    
    DZQWEAKSELF
    [self.NetClient baidu_DeleteRequestWithUrl:UrlString urlTag:0 parameters:nil success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Attach_delete, @"delete") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
    
}

@end
