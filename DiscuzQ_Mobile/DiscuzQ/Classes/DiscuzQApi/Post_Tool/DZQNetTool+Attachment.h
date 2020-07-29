//
//  DZQNetTool+Attachment.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

@interface DZQNetTool (Attachment)


/// 上传附件
-(void)dz_attachmentUploadWithQuery:(NSString *)query file:(NSString *)filePath success:(PRCompleteBlock)success progress:(PRProgressBlock)progress failure:(PRFailureBlock)failure;

/// 删除 附件
-(void)dz_attachmentDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end


