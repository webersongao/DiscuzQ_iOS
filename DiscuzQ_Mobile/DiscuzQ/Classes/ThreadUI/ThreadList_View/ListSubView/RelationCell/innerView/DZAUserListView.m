//
//  DZAUserListView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAUserListView.h"
#import "DZAUserListCell.h"
#import "DZThreadTHelper.h"

static NSString * const cellIdentifier = @"DZAUserListCell";

@interface DZAUserListView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong,readonly) NSArray <DZQDataUser *> *dataList;

@end

@implementation DZAUserListView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self config_AUserListView];
    }
    return self;
}


-(void)config_AUserListView{
    self.showsVerticalScrollIndicator = NO;
//    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = KDebug_Color;
    [self registerClass:[DZAUserListCell class] forCellWithReuseIdentifier:cellIdentifier];
}

// 重置 列表数组数据 的唯一方法
-(void)updateUserListView:(NSArray <DZQDataUser *>*)userArray{
    if (userArray && [userArray isKindOfClass:[NSArray class]]) {
        _dataList = userArray;
    }
    self.hidden = self.dataList.count ? NO : YES;
    [self reloadHomeListThreadData];
}


// 列表刷新
-(void)reloadHomeListThreadData{
    [self reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DZAUserListCell *userCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [userCell updateAUserListCell:self.dataList[indexPath.row]];

    return userCell;
}

#pragma mark <UICollectionViewDelegate>
/// 点击某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DZQDataUser *dataUser = self.dataList[indexPath.row];
    [DZThreadTHelper thread_UserCenterCellAction:dataUser];
    
}



@end
