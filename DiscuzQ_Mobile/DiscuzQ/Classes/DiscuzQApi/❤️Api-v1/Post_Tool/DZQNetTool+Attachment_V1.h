//
//  DZQNetTool+Attachment_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

@interface DZQNetTool (Attachment_V1)


/// 上传附件
-(void)DZQ_V1_AttachmentUploadWithQuery:(NSString *)query file:(NSString *)filePath success:(PRCompleteBlock)success progress:(PRProgressBlock)progress failure:(PRFailureBlock)failure;

/// 删除 附件
-(void)DZQ_V1_AttachmentDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end


