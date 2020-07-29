//
//  DZUserPayListView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserPayListView.h"
#import "DZAUserListCell.h"
#import "DZThreadHelper.h"

static NSString * const cellIdentifier = @"DZAUserListCell";

@interface DZUserPayListView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) DZDPayStyle *payLayout;

@property(nonatomic,strong,readonly) NSArray <DZQDataUser *> *dataList;

@end

@implementation DZUserPayListView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self config_TopicListBar];
    }
    return self;
}


-(void)config_TopicListBar{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = KDebug_Color;
    [self registerClass:[DZAUserListCell class] forCellWithReuseIdentifier:cellIdentifier];
}

// 重置 列表数组数据 的唯一方法
-(void)updatePayUserList:(NSArray <DZQDataUser *>*)userArray payLayout:(DZDPayStyle *)layout{
    if (userArray && [userArray isKindOfClass:[NSArray class]]) {
        _dataList = userArray;
        _payLayout = layout;
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
    [DZThreadHelper thread_UserCenterCellAction:dataUser.attributes.user_id];
}




#pragma mark   /********************* UICollectionViewDelegateFlowLayout 布局 *************************/

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.payLayout.UitemSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return self.payLayout.USectionEdge;

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return self.payLayout.UMinimumLine;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return self.payLayout.UMinimumInteritem;
}


@end
