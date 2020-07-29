//
//  DZImageScanListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/2.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZImageScanListController.h"
#import "ForumNodeModel.h"
#import "DZImageSquareCell.h"
#import "DZCollectSectionView.h"
#import "DZRefreshHeader.h"
#import "DiscoverModel.h"

@interface DZImageScanListController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray<ForumNodeModel *> *dataSourceArr;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSString * urlString;  //!< 属性注释

@end

@implementation DZImageScanListController

static NSString *CellID = @"fourmCollection";
static NSString * headerSection = @"CellHeader";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadCacheRequest];
    [self configCollectionController];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:DZ_TabbarRefresh_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:DZ_DomainUrlChange_Notify object:nil];
}

- (void)configCollectionController {
    [self.view addSubview:self.collectionView];
    [self.dz_NavigationBar removeFromSuperview];
    KWEAKSELF;
    self.collectionView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf loadForumIndexDataWitLoadType:0];
    }];
}

- (void)loadCacheRequest {
    [self.HUD showLoadingMessag:@"正在刷新" toView:self.view];
    [self loadForumIndexDataWitLoadType:0]; // 读缓存，没有缓存的话自己会请求网络
}

- (void)loadForumIndexDataWitLoadType:(NSInteger)type {
    
    [self.HUD hide];
}

#pragma mark - UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KScreenWidth, 54);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (!self.dataSourceArr[section].isExpanded)  {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.dataSourceArr.count;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.dataSourceArr[section].isExpanded) {
        return self.dataSourceArr[section].childNode.count;
    }
    return 0;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    DZCollectSectionView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerSection forIndexPath:indexPath];
    
    cell.tag = indexPath.section;
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectHeaderWithSection:)];
    [cell addGestureRecognizer:tapG];
    cell.cellNode = self.dataSourceArr[indexPath.section];
    
    return cell;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DZImageSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fourmCollection" forIndexPath:indexPath];
    
    ForumNodeModel *node = self.dataSourceArr[indexPath.section].childNode[indexPath.row];
    
    if (node != nil) {
        [cell updateItemCell:node.infoModel];
    }
    
    return cell;
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    ForumNodeModel * node = self.dataSourceArr[indexPath.section].childNode[indexPath.row];
    
    [self pushThreadList:node];
}

- (void)pushThreadList:(ForumNodeModel *)node {
//    [[DZMobileCtrl sharedCtrl] PushToForumCateController:node.infoModel.fid];
}

- (void)didSelectHeaderWithSection:(UITapGestureRecognizer *)sender {
    
    ForumNodeModel *node = self.dataSourceArr[sender.view.tag];
    node.isExpanded = !node.isExpanded;
    [self.collectionView reloadData];
    
}
- (void)refresh {
    if ([self viewIsShow]) {
        // 刷新
        [self.collectionView.mj_header beginRefreshing];
    }
}

- (void)refreshData {
    // 刷新
    [self loadForumIndexDataWitLoadType:0];
}

- (BOOL)viewIsShow {
    //判断window是否在窗口上
    if (self.view.window == nil) {
        return NO;
    }
    //判断当前的view是否与窗口重合
    if (![self.view dz_intersectsWithAnotherView:nil]) {
        return NO;
    }
    
    return YES;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (NSMutableArray *)dataSourceArr {
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 4;
        flowLayout.itemSize = CGSizeMake((KScreenWidth - 20 - 20) / 3, KScreenWidth / 3 + 40);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, KNavi_ContainStatusBar_Height, KScreenWidth, KScreenHeight - KNavi_ContainStatusBar_Height) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = KDebug_Color;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [_collectionView registerClass:[DZImageSquareCell class] forCellWithReuseIdentifier:CellID];
        [_collectionView registerClass:[DZCollectSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerSection];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

@end






