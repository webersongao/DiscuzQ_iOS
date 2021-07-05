//
//  DZNetFormatter+Adapter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetFormatter.h"

NS_ASSUME_NONNULL_BEGIN
@class DZRootModel,DZUserM,DZSiteM,DZEmojiM,DZDialogM,DZThreadM,DZMessageM,
DZThreadCateM,DZNotificationM,DZPostM,DZThreadDraftM;
@interface DZNetFormatter (Adapter)

-(DZSiteM *)forum_ConvertWithObj:(id)object;

-(NSArray<DZUserM *> *)user_ConvertWithObj:(id)object;

-(NSArray<DZThreadDraftM *> *)draft_ConvertWithObj:(NSArray<id> *)object;

-(NSArray<DZThreadM *> *)thread_ConvertWithObj:(id)object;

-(NSArray<DZThreadCateM *> *)category_ConvertWithObj:(NSArray<id> *)object;

-(NSArray<DZDialogM *> *)dialog_ConvertWithObj:(NSArray<id> *)object;

-(NSArray<DZMessageM *> *)message_ConvertWithObj:(NSArray<id> *)object;

-(NSArray<DZNotificationM *> *)notification_ConvertWithObj:(NSArray<id> *)object;

@end

NS_ASSUME_NONNULL_END
