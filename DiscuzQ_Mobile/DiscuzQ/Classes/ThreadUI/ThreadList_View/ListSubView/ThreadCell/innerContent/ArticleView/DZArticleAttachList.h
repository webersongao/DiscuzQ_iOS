//
//  DZArticleAttachList.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZArticleAttachList : DZBaseTableView

-(void)updateFileAttachMentList:(NSArray <DZQDataAttachment *>*)fileArray;


@end

NS_ASSUME_NONNULL_END
