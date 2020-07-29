//
//  DZNetCenter+Site.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"
#import "DZQEmojiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (Site)


/// 全部 Emoji表情[列表]
-(void)dzx_allEmojiListWithCompletion:(void (^)(NSArray<DZQDataEmoji *> *varModel, BOOL success))completion;

/// 获取 分类列表
-(void)dzx_categoryListWithCompletion:(void (^)(NSArray<DZQDataCate *> *varModel, BOOL success))completion;

//// 获取站点基本信息
-(void)dzx_siteinfoWithUrlTag:(NSInteger)urlTag completion:(void (^)(DZQForumModel *siteModel, BOOL success))completion;



@end

NS_ASSUME_NONNULL_END
