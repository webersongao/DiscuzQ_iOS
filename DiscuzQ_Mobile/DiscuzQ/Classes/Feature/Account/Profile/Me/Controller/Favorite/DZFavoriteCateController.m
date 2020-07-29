//
//  DZFavoriteCateController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZFavoriteCateController.h"
#import "UIAlertController+Extension.h"
#import "CollectionForumCell.h"

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
    return self.user_id.length ? self : nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"板块列表";
    [self.view addSubview:self.listView];
    self.view.backgroundColor = KDebug_Color;
}




-(UITableView *)listView{
    if (!_listView) {
        _threadArray = [NSMutableArray array];
        _listView = [[UITableView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
    }
    return _listView;
}


@end
