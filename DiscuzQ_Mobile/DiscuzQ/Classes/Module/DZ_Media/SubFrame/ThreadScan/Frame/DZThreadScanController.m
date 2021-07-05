//
//  DZThreadScanController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/5/2.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZThreadScanController.h"
#import "PRNaviSegmentView.h"
#import "DZScanTypeViewController.h"
#import "DZThreadTypeModel.h"

@interface DZThreadScanController ()<UIScrollViewDelegate,PRNaviSegmentViewDelegate>

@property (nonatomic,assign) int currentIndex;
@property (nonatomic, strong) UIScrollView *scrollView;  //!< 属性注释
@property (nonatomic, strong) PRNaviSegmentView *ScrollBar;  //!< 属性注释
@property (nonatomic,strong) NSArray<DZScanTypeViewController*> *listViewArray;

@end


@implementation DZThreadScanController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configForumScanController];
    [self loadTypeIndexDataIfNeeded];
}

-(void)configForumScanController{
    
    [self.view addSubview:self.ScrollBar];
    [self.view addSubview:self.scrollView];
    self.listViewArray = [NSMutableArray array];
    [self configNaviBar:@"navi_bar_search" type:NaviItemImage Direction:NaviDirectionRight];
}

-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}

#pragma mark   /********************* 处理数据 *************************/

-(void)loadTypeIndexDataIfNeeded{
    
    [self updateThreadTypeListCtrl:[DZThreadTypeModel defaultTypeList]];

}


#pragma mark   /********************* 响应事件 *************************/

- (void)rightBarBtnClick:(UIButton *)button {
    [[DZMobileCtrl sharedCtrl] PushToSearchController];
}

-(void)transToFastPostAction:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToThreadPublishController];
}


#pragma mark   /********************* PRNaviSegmentViewDelegate *************************/

- (void)naviSegment:(PRNaviSegmentView *)segmentView touchSameNaviIndex:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.width, 0) animated:YES];
    DZScanTypeViewController *listVC = [self.listViewArray objectAtIndex:index];
    [listVC updateHomeCateControllerView];
}

- (void)naviSegment:(PRNaviSegmentView *)segmentView updateNaviTitleIndex:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.width, 0) animated:YES];
    DZScanTypeViewController *listVC = [self.listViewArray objectAtIndex:index];
    [listVC updateHomeCateControllerView];
}

#pragma mark   /********* 基本配置 ************/

//处理分类页面
-(void)updateThreadTypeListCtrl:(NSArray <DZThreadTypeModel *>*)cateList{
    
    NSMutableArray *subVCArray = [NSMutableArray array];
    NSMutableArray *titleArray = [NSMutableArray arrayWithCapacity:3];
    
    for (int index = 0; index < cateList.count; index ++) {
        [titleArray addObject:checkNull(cateList[index].nameStr)];
        DZScanTypeViewController *listVC = [[DZScanTypeViewController alloc] initWithFrame:CGRectMake((index * KScreenWidth), 0, KScreenWidth, self.scrollView.height) cate:cateList[index]];
        [subVCArray addObject:listVC];
        [self.scrollView addSubview:listVC.view];
    }
    
    self.listViewArray = [subVCArray copy];
    [self.listViewArray.firstObject updateHomeCateControllerView];
    [self.ScrollBar updateNaviBarWithTitle:[titleArray copy] cache:YES];
    self.scrollView.contentSize = CGSizeMake((cateList.count) * KScreenWidth, _scrollView.height);
}


#pragma mark   /********** UIScrollViewDelegate ***********/

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(!scrollView.isDragging){
        return;
    }
    int index = (scrollView.contentOffset.x  + KScreenWidth * 0.5)/ self.scrollView.width;
    if(self.currentIndex != index){
        self.currentIndex = index;
        self.ScrollBar.segmentView.selectIndex = index;
    }
}


-(PRNaviSegmentView *)ScrollBar{
    if (!_ScrollBar) {
        _ScrollBar = [[PRNaviSegmentView alloc] initWithFrame:CGRectMake(0, KNavi_ContainStatusBar_Height, KScreenWidth, kToolBarHeight)];
        _ScrollBar.segDelegate = self;
    }
    return _ScrollBar;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.ScrollBar.bottom, KScreenWidth, KView_OutNavi_Bounds.size.height-kToolBarHeight-KBottom_Height_X)];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

@end






