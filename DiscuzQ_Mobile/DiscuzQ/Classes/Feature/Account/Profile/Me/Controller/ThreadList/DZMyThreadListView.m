//
//  DZMyThreadListView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMyThreadListView.h"

@interface DZMyThreadListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataList;  //!< 属性注释

@end

@implementation DZMyThreadListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[DZMyThreadListCell class] forCellReuseIdentifier:@"DZMyThreadListCell"];
    }
    return self;
}

#pragma mark - tableView delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZMyThreadListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubjectCelsal"];
    if (cell == nil) {
        cell = [[DZMyThreadListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SubjectCelsal"];
    }
    ThreeadItemModel * itemModel = [self.dataList objectAtIndex:indexPath.row];
    
    [cell updateDZMyThreadListCell:itemModel];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString * tidStr = [[self.dataList objectAtIndex:indexPath.row] stringForKey:@"tid"];
    
    [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:tidStr];
    
}


@end
