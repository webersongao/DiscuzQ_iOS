//
//  DZThreadCateListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/5/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZThreadCateListController.h"
#import "DZThreadCateDetailView.h"

@interface DZThreadCateListController ()

@property (nonatomic, assign) BOOL canScroll; //YES:可滑动
@property (nonatomic, strong) UIButton *PostButton;
@property (nonatomic, strong) DZThreadCateDetailView *contentView;

@end

@implementation DZThreadCateListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dl_addNotification];
    [self config_threadCateListCtrl];
    self.title = self.dataCate.attributes.name;
    [self.contentView first_updateSuperCateData];
}


-(void)config_threadCateListCtrl{
    
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.PostButton];
    
}

-(void)fastPostAction:(UIButton *)button{
    
    [[DZMobileCtrl sharedCtrl] PushToPostTabViewController];
}

- (void)loginedRefresh {
    //    if (self.ctvArr.count > 0) {
    //        DZThreadListController *fVc = self.ctvArr[self.selectIndex];
    //        [fVc updateSuperCateThreadListCtrlView];
    //    } else {
    //        [self.tableView.mj_header endRefreshing];
    //    }
}

-(void)dl_addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginedRefresh) name:DZ_LoginedRefreshInfo_Notify object:nil];
}


#pragma mark - setter、getter

-(UIButton *)PostButton{
    if (_PostButton == nil) {
        CGFloat btn_width = 50.0;
        _PostButton = [UIButton ButtonNormalWithFrame:CGRectMake(KScreenWidth - btn_width - 15, KScreenHeight - btn_width - 15 - KNavi_ContainStatusBar_Height - 10, btn_width, btn_width) title:@"" titleFont:nil titleColor:nil normalImgPath:@"writePost" touchImgPath:@"writePost" isBackImage:YES picAlpha:1];
        [_PostButton addTarget:self action:@selector(fastPostAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _PostButton;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(DZThreadCateDetailView *)contentView{
    if (!_contentView) {
        _contentView = [[DZThreadCateDetailView alloc] initWithFrame:KView_OutNavi_Bounds cate:self.dataCate];
        _contentView.contentSize = CGSizeMake(self.view.width, KView_OutNavi_Bounds.size.height + 80);
    }
    return _contentView;
}

@end




