//
//  DZQNetTool+Attachment_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Attachment_V3)


/// 上传附件
-(void)DZQ_V3_AttachmentUploadWithQuery:(NSString *)query file:(NSString *)filePath success:(PRCompleteBlock)success progress:(PRProgressBlock)progress failure:(PRFailureBlock)failure;

/// 删除 附件
-(void)DZQ_V3_AttachmentDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
