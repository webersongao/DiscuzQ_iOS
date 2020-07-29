//
//  DZDiscoverController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZDiscoverController.h"
#import "PRNaviSegmentView.h"
#import "DZDiscoverCateController.h"

@interface DZDiscoverController ()<UIScrollViewDelegate,PRNaviSegmentViewDelegate>

@property (nonatomic,assign) int currentIndex;
@property (nonatomic, strong) UIButton *PostButton;  //!< 属性注释
@property (nonatomic, strong) UIScrollView *scrollView;  //!< 属性注释
@property (nonatomic, strong) PRNaviSegmentView *ScrollBar;  //!< 属性注释
@property(nonatomic,strong) NSArray<DZDiscoverCateController*> *listViewArray;

@end


@implementation DZDiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configForumController];
    [self loadViewIndexDataIfNeeded];
}

-(void)configForumController{
    [self.view addSubview:self.ScrollBar];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.PostButton];
    self.listViewArray = [NSMutableArray array];
//    [self dz_SetNavigationlogoView:DZ_Navi_Logo];
    [self configNaviBar:@"navi_bar_search" type:NaviItemImage Direction:NaviDirectionRight];
}

-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}

#pragma mark   /********************* 处理数据 *************************/

-(void)loadViewIndexDataIfNeeded{
    KWEAKSELF
    [[DZNetCenter center] dzx_categoryListWithCompletion:^(NSArray<DZQDataCate *> *varModel, BOOL success) {
        if (success) {
            [weakSelf updateCateListCtrl:varModel];
        }else{
            [DZMobileCtrl showAlertError:@"数据获取错误"];
        }
    }];

}


#pragma mark   /********************* 响应事件 *************************/

- (void)rightBarBtnClick:(UIButton *)button {
    [[DZMobileCtrl sharedCtrl] PushToSearchController];
}

-(void)transToFastPostAction:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToPostTabViewController];
}


#pragma mark   /********************* PRNaviSegmentViewDelegate *************************/

- (void)naviSegment:(PRNaviSegmentView *)segmentView touchSameNaviIndex:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.width, 0) animated:YES];
    DZDiscoverCateController *listVC = [self.listViewArray objectAtIndex:index];
    [listVC updateDiscoverCateControllerView];
}

- (void)naviSegment:(PRNaviSegmentView *)segmentView updateNaviTitleIndex:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.width, 0) animated:YES];
    DZDiscoverCateController *listVC = [self.listViewArray objectAtIndex:index];
    [listVC updateDiscoverCateControllerView];
}

#pragma mark   /********* 基本配置 ************/

//处理分类页面
-(void)updateCateListCtrl:(NSArray <DZQDataCate *>*)cateList{
    
    NSMutableArray *subVCArray = [NSMutableArray array];
    NSMutableArray *titleArray = [NSMutableArray arrayWithCapacity:3];
    
    DZDiscoverCateController *defaultVC = [[DZDiscoverCateController alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, self.scrollView.height) cate:nil];
    [titleArray addObject:@"首页"];
    [subVCArray addObject:defaultVC];
    [self.scrollView addSubview:defaultVC.view];
    [defaultVC updateDiscoverCateControllerView];
    
    for (int index = 0; index < cateList.count; index ++) {
        DZQDataCate *model = cateList[index];
        [titleArray addObject:checkNull(model.attributes.name)];
        DZDiscoverCateController *listVC = [[DZDiscoverCateController alloc] initWithFrame:CGRectMake((index+1) * KScreenWidth, 0, KScreenWidth, self.scrollView.height) cate:model];
        [subVCArray addObject:listVC];
        [self.scrollView addSubview:listVC.view];
    }
    
    self.listViewArray = [subVCArray copy];
    [self.ScrollBar updateNaviBarWithTitle:titleArray cache:YES];
    self.scrollView.contentSize = CGSizeMake((cateList.count+1) * KScreenWidth, _scrollView.height);
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

-(UIButton *)PostButton{
    if (!_PostButton) {
        CGFloat btn_width = 50.0;
        _PostButton = [UIButton ButtonNormalWithFrame:CGRectMake(KScreenWidth - btn_width - 15, KScreenHeight - btn_width - 15 - KNavi_ContainStatusBar_Height - 10, btn_width, btn_width) title:@"" titleFont:nil titleColor:nil normalImgPath:@"writePost" touchImgPath:@"writePost" isBackImage:YES picAlpha:1];
        [_PostButton addTarget:self action:@selector(transToFastPostAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _PostButton;
}

@end








