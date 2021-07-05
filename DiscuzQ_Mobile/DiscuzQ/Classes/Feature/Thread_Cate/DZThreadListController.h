//
//  DZThreadListController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/8.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZHomeListView.h"

typedef enum : NSUInteger {
    DZ_ListAll,  // 全部
    DZ_ListVideo, // 视频
    DZ_ListBest  // 精华
} DZ_ListType;


@interface DZThreadListController : DZBaseViewController

@property (nonatomic, strong) DZHomeListView *listView;  //!< 属性注释

- (instancetype)initWithCateid:(NSString *)fid order:(NSInteger)order;

-(void)updateSuperCateThreadListCtrlView;


@end



