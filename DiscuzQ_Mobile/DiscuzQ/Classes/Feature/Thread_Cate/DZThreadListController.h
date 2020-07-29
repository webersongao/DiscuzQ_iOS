//
//  DZThreadListController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/8.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZThreadVarModel.h"
#import "DZDiscoverListView.h"

typedef enum : NSUInteger {
    DZ_ListAll,  // 全部
    DZ_ListVideo, // 视频
    DZ_ListBest  // 精华
} DZ_ListType;


@interface DZThreadListController : DZBaseViewController

@property (nonatomic, strong) DZDiscoverListView *listView;  //!< 属性注释

- (instancetype)initWithCateid:(NSString *)fid order:(NSInteger)order;

-(void)updateSuperCateThreadListCtrlView;


@end



