//
//  DZAttachGridView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAttachGridView.h"
#import "DZAttachGridCell.h"
#import "DZPickerHeader.h"
#import "DZGridtool.h"

@interface DZAttachGridView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataList;  //!< 属性注释

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
    
    self.bounces = NO;
    self.backgroundColor = KContent_Color;
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    //    self.contentInset = UIEdgeInsetsMake(kMargin5, kMargin5, kMargin5, kMargin5);
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = KDebug_Color;
    [self registerClass:[DZAttachGridCell class] forCellWithReuseIdentifier:@"DZAttachGridCell"];
}


// 列表刷新
-(void)updateDraftAttachList:(NSArray<DZMediaModel *> *)fileArray{
    
    _dataList = [DZGridtool filterAttachFileList:fileArray];
    
//    _dataList = @[[DZMediaModel placeHolderMedia],[DZMediaModel placeHolderMedia],[DZMediaModel placeHolderMedia],[DZMediaModel placeHolderMedia],[DZMediaModel placeHolderMedia],[DZMediaModel placeHolderMedia],[DZMediaModel placeHolderMedia],[DZMediaModel placeHolderMedia],[DZMediaModel placeHolderMedia]];
    [self reloadDraftAttachListData];
}

-(void)reloadDraftAttachListData{
    [self reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (self.dataList.count > 9) ? 9 : self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DZAttachGridCell *attachCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DZAttachGridCell" forIndexPath:indexPath];
    
    [attachCell updateDraftAttachListCell:self.dataList[indexPath.row]];
    
    return attachCell;
}

#pragma mark <UICollectionViewDelegate>
/// 点击某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DZMediaModel *media = self.dataList[indexPath.row];
    if (media.mediaType == DZMedia_none) {
        
    }else{
        
    }
    
    NSLog(@"WBS 预览草稿箱文件");
    
}





@end
