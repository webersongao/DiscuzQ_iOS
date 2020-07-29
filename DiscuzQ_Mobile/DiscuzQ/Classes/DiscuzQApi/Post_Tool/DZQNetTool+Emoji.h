//
//  DZQNetTool+Emoji.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQEmojiModel.h"


@interface DZQNetTool (Emoji)

/// 全部 Emoji表情[列表]
-(void)dz_allEmojiListWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end


