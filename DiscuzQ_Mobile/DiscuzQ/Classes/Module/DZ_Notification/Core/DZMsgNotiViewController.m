//
//  DZMsgNotiViewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMsgNotiViewController.h"
#import "PRNaviSegmentView.h"
#import "DZDialogListController.h"
#import "DZNotificationController.h"

@interface DZMsgNotiViewController ()<UIScrollViewDelegate,PRNaviSegmentViewDelegate>

@property (nonatomic,assign) int currentIndex;
@property (nonatomic, strong) UIScrollView *scrollView;  //!< 属性注释
@property (nonatomic, strong) PRNaviSegmentView *ScrollBar;  //!< 属性注释
@property (nonatomic,strong) NSArray<DZMSgNotiBaseController*> *listVCArray;

@end


@implementation DZMsgNotiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configForumController];
    [self loadViewIndexDataIfNeeded];
}

-(void)configForumController{
    [self.view addSubview:self.scrollView];
    [self.dz_NavigationBar addSubview:self.ScrollBar];
}

#pragma mark   /********** 响应事件 ****************/

-(void)reloadNotiAndMsgDataWhenChange{
    [[self.listVCArray objectAtIndex:self.currentIndex] loadLocalDialogOrMsgListData];
}

-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}

#pragma mark   /******* PRNaviSegmentViewDelegate *****************/

- (void)naviSegment:(PRNaviSegmentView *)segmentView touchSameNaviIndex:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.width, 0) animated:YES];
    DZMSgNotiBaseController *listVC = [self.listVCArray objectAtIndex:index];
    [listVC loadLocalDialogOrMsgListData];
}

- (void)naviSegment:(PRNaviSegmentView *)segmentView updateNaviTitleIndex:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.width, 0) animated:YES];
    DZMSgNotiBaseController *listVC = [self.listVCArray objectAtIndex:index];
    [listVC loadLocalDialogOrMsgListData];
}

#pragma mark   /********* 基本配置 ************/

//处理分类页面
-(void)loadViewIndexDataIfNeeded{
    
    DZDialogListController *MsgVC = [[DZDialogListController alloc] initWithSubFrame:CGRectMake(0, 0, KScreenWidth, self.scrollView.height)];
    [MsgVC loadLocalDialogOrMsgListData];
    
    DZNotificationController *NotiVC = [[DZNotificationController alloc] initWithSubFrame:CGRectMake(KScreenWidth, 0, KScreenWidth, self.scrollView.height)];
    
    self.listVCArray = @[MsgVC,NotiVC];
    [self.scrollView addSubview:MsgVC.view];
    [self.scrollView addSubview:NotiVC.view];
    [self.ScrollBar updateNaviBarWithTitle:@[@"消息",@"通知"] cache:NO];
    self.scrollView.contentSize = CGSizeMake(2 * KScreenWidth, _scrollView.height);
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
        CGFloat leftX = (kScreenWidth - 160)/2.0;
        _ScrollBar = [[PRNaviSegmentView alloc] initWithFrame:CGRectMake(leftX, KNavi_ContainStatusBar_Height-kToolBarHeight, 160, kToolBarHeight)];
        _ScrollBar.segmentView.bgColor = KLightLine_Color;
        _ScrollBar.segDelegate = self;
        _ScrollBar.isBind = YES;// 固定不移动
    }
    return _ScrollBar;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:KView_OutNaviTab_Bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.zf_scrollViewDirection = ZFPlayerScrollViewDirectionVertical;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

@end








