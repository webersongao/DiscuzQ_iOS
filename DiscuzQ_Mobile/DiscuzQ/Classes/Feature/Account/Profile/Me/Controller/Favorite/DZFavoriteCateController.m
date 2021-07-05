//
//  DZFavoriteCateController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//  分类收藏

#import "DZFavoriteCateController.h"
#import "UIAlertController+Extension.h"

@interface DZFavoriteCateController ()

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray<DZQDataTopic *> *threadArray;  //!< 属性注释

@end

@implementation DZFavoriteCateController

- (instancetype)initWithUserid:(NSString *)user_id
{
    self = [super init];
    if (self) {
        self.page = 1;
        self.user_id = checkNull(user_id);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listView];
    self.view.backgroundColor = KDebug_Color;
}




-(UITableView *)listView{
    if (!_listView) {
        _threadArray = [NSMutableArray array];
        _listView = [[DZCateFavListView alloc] initWithFrame:KView_OutNavi_Bounds];
        _listView.backgroundColor = KWhite_Color;
    }
    return _listView;
}


@end
