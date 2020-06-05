//
//  DZThreadListController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/8.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "ForumListBaseCtrl.h"
#import "DZThreadVarModel.h"
#import "DZForTitleModel.h"

typedef void(^SendValueBlock)(DZThreadVarModel *varModel);

@interface DZThreadListController : ForumListBaseCtrl

@property (nonatomic, copy) SendValueBlock dataBlockWhenAll; // 当且仅在 listType 为all的时候返才会调用返回数据
@property (nonatomic, copy) backNoneBlock endRefreshBlock;

- (void)refreshThreadListData;

- (instancetype)initWithType:(DZ_ListType)listType fid:(NSString *)fid order:(NSInteger)order;


@end



