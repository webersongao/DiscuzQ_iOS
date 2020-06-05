//
//  DZMyFollowListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMyFollowListController.h"

@interface DZMyFollowListController ()

@property (nonatomic, copy) NSString *user_id;  //!< 属性注释

@end

@implementation DZMyFollowListController

- (instancetype)initWithUserid:(NSString *)user_id
{
    self = [super init];
    if (self) {
        self.user_id = user_id;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listView];
}

-(UITableView *)listView{
    if (!_listView) {
        _listView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _listView;
}

@end
