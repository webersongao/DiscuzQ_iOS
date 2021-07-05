//
//  DZNetCenter+Site.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"
#import "DZSiteM.h"
#import "DZEmojiM.h"
#import "DZThreadCateM.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (Site)


/// 全部 Emoji表情[列表]
-(void)dzx_allEmojiListWithCompletion:(void (^)(NSArray<DZQDataEmoji *> *varModel, BOOL success))completion;

/// 获取 分类列表
-(void)dzx_categoryListWithCompletion:(void (^)(NSArray<DZThreadCateM *> *cateArray, BOOL success))completion;

//// 获取站点基本信息
-(void)dzx_siteforumInfoWithCompletion:(void (^)(DZSiteM *siteModel, BOOL success))completion;



@end

NS_ASSUME_NONNULL_END
