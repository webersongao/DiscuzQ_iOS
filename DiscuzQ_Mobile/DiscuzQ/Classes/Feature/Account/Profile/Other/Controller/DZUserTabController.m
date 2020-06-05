//
//  DZUserTabController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZUserTabController.h"
#import "DZMyThreadListController.h"
#import "DZMyFansListController.h"
#import "DZMyFollowListController.h"
#import "PRNaviSegmentView.h"
#import "DZContainerController.h"

@interface DZUserTabController ()<UIScrollViewDelegate,PRNaviSegmentViewDelegate>

@property (nonatomic,assign) int currentIndex;
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, strong) UIScrollView *scrollView;  //!< 属性注释
@property (nonatomic, strong) PRNaviSegmentView *ScrollBar;  //!< 属性注释
@property(nonatomic,strong) NSArray<DZBaseViewController*> *listViewArray;

@end

@implementation DZUserTabController


- (instancetype)initTabFrame:(CGRect)frame userId:(NSString *)userId
{
    self = [super init];
    if (self) {
        self.user_id = userId;
        self.view.frame = frame;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config_TabController];
}


-(void)config_TabController{
    
    [self.view addSubview:self.ScrollBar];
    [self.view addSubview:self.scrollView];
    [self config_UserTabControllerList];
    [self.dz_NavigationBar removeFromSuperview];
    
}


#pragma mark   /****** PRNaviSegmentViewDelegate *******/

- (void)naviSegment:(PRNaviSegmentView *)segmentView touchSameNaviIndex:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.width, 0) animated:YES];
    //    DZDiscoverCateController *listVC = [self.listViewArray objectAtIndex:index];
    //    [listVC updateDiscoverCateControllerView];
}

- (void)naviSegment:(PRNaviSegmentView *)segmentView updateNaviTitleIndex:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.width, 0) animated:YES];
    //    DZDiscoverCateController *listVC = [self.listViewArray objectAtIndex:index];
    //    [listVC updateDiscoverCateControllerView];
}

#pragma mark   /********* 基本配置 ************/

//处理分类页面
-(void)config_UserTabControllerList{
    
    DZMyThreadListController *listVC01 = [[DZMyThreadListController alloc] initWithUserid:self.user_id];
    DZMyFollowListController *listVC02 = [[DZMyFollowListController alloc] initWithUserid:self.user_id];
    DZMyFansListController *listVC03 = [[DZMyFansListController alloc] initWithUserid:self.user_id];
    
    
    [self.scrollView addSubview:listVC01.view];
    [self.scrollView addSubview:listVC02.view];
    [self.scrollView addSubview:listVC03.view];
    [listVC01.dz_NavigationBar removeFromSuperview];
    [listVC02.dz_NavigationBar removeFromSuperview];
    [listVC03.dz_NavigationBar removeFromSuperview];
    
    CGFloat listHeight =  KView_OutNavi_Bounds.size.height-kToolBarHeight;
    listVC02.listView.frame = CGRectMake(0, 0, KScreenWidth, listHeight);
    listVC03.listView.frame = CGRectMake(0, 0, KScreenWidth, listHeight);
    listVC01.listView.frame = CGRectMake(0, 0, KScreenWidth, listHeight);
    
    NSArray *titleAray = @[@"主题",@"关注",@"粉丝"];
    self.listViewArray = @[listVC01,listVC02,listVC03];
    [self.ScrollBar updateNaviBarWithTitle:titleAray cache:NO];
    self.scrollView.contentSize = CGSizeMake(titleAray.count * KScreenWidth, _scrollView.height);
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
    if (_ScrollBar == nil) {
        _ScrollBar = [[PRNaviSegmentView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kToolBarHeight)];
        _ScrollBar.segDelegate = self;
    }
    return _ScrollBar;
}

-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kToolBarHeight, KScreenWidth, KView_OutNavi_Bounds.size.height-kToolBarHeight)];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

@end
