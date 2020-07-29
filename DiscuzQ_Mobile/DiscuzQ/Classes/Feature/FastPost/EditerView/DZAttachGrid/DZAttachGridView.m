//
//  DZAttachGridView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAttachGridView.h"
#import "DZAttachGridCell.h"

@interface DZAttachGridView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation DZAttachGridView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self config_AttachGridView];
    }
    return self;
}


-(void)config_AttachGridView{
   
    self.alwaysBounceVertical = YES;
    self.backgroundColor = KLightGray_Color;
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.contentInset = UIEdgeInsetsMake(kMargin5, kMargin5, kMargin5, kMargin5);
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = KDebug_Color;
    [self registerClass:[DZAttachGridCell class] forCellWithReuseIdentifier:@"DZAttachGridCell"];
}


// 列表刷新
-(void)reloadHomeListThreadData{
    [self reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.dataList.count;
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DZAttachGridCell *userCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DZAttachGridCell" forIndexPath:indexPath];

//    [userCell updateAUserListCell:self.dataList[indexPath.row]];

    return userCell;
}

#pragma mark <UICollectionViewDelegate>
/// 点击某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    DZQDataUser *dataUser = self.dataList[indexPath.row];
//    [DZThreadHelper thread_UserCenterCellAction:dataUser.attributes.user_id];
}





@end
