//
//  DZQNetTool+Post.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQPostModel.h"
#import "DZQThreadModel.h"
#import "DZQAttachmentModel.h"

@interface DZQNetTool (Post)


/// 查询 回复 接口[列表]
-(void)dz_PostListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;




@end


