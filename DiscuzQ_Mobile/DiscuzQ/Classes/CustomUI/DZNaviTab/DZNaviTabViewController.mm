//
//  DZNaviTabViewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/4/27.
//

#import "DZNaviTabViewController.h"
#import "PRNetWorkErrorView.h"
#import "DZTabPanScrollview.h"

@interface DZNaviTabViewController ()<UIScrollViewDelegate,PRNetWorkErrorViewDelegate>

@property(nonatomic,strong)DZTabPanScrollview *tabScrollView;

@property (nonatomic, assign) NSInteger currentIndex;  //!< 属性注释
@property (nonatomic,strong) DZNaviTabView *naviTabView;  //!< 属性注释
@property(nonatomic,strong)PRNetWorkErrorView *errorView;  //!< 属性注释
@property(nonatomic,strong)NSArray<DZTabItem *> *tabsArray;  //!< 属性注释

@end

@implementation DZNaviTabViewController

- (instancetype)initWithTabArr:(NSArray<DZTabItem *> *)tabArray
{
    self = [super init];
    if (self) {
        self.tabsArray = tabArray;
    }
    if (tabArray.count > 3 || tabArray.count < 1) {
        return nil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self confgi_CustomNavgationBar];
    
    [self dz_SetNavigationTitleView:self.naviTabView];
    
}

-(void)confgi_CustomNavgationBar{
    
    for (int index = 0; index < self.tabsArray.count; index++) {
        
        DZTabItem *tabItem = self.tabsArray[index];
        [self.tabScrollView addSubview:tabItem.viewCtrl.view];
        tabItem.viewCtrl.view.frame = CGRectMake(index*self.tabScrollView.width, 0, self.tabScrollView.width, self.tabScrollView.height);
    }
    [self.view addSubview:self.tabScrollView];
}


#pragma scrollView ------ scrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    float pageIndex = scrollView.contentOffset.x/self.view.frame.size.width;
    if (pageIndex > 0 && pageIndex < 1) {
        return;
    }
    int index = fabs(scrollView.contentOffset.x) / self.view.frame.size.width;
    
    self.currentIndex = [self.naviTabView updateNaviTabViewState:index];
}

-(void)titleButtonAction:(UIButton *)button{
    NSInteger index = self.currentIndex = button.tag - k_NaviTab_BtnTag;
    [_tabScrollView setContentOffset:CGPointMake(index*self.tabScrollView.width, 0) animated:YES];
}


-(void)updateTabFont:(UIFont *)font titleColor:(UIColor *)titleColor highColor:(UIColor *)highColor{
    
    if (font) {
        [self.naviTabView setTitleFont:font];
    }
    
    if (titleColor) {
        [self.naviTabView setTitleColor:titleColor];
    }
    
    if (highColor) {
        [self.naviTabView setTitleHighColor:highColor];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ========== PRNetWorkErrorView
- (PRNetWorkErrorView *)errorView {
    if (!_errorView) {
        _errorView = [[PRNetWorkErrorView alloc] initWithFrame:KView_OutNavi_Bounds viewType:PRErrorViewNoData];
        _errorView.delegate = self;
    }
    return _errorView;
}

//7.1 加载失败页 动画
- (void)bringErrorViewToSelfView {
    [self.errorView addErrorViewWithViewType:PRErrorViewNoNet];
    [self.view addSubview:self.errorView];
    [self.view bringSubviewToFront:self.errorView];
}

- (void)tryAgainButtonDidClicked{
    
}

-(DZNaviTabView *)naviTabView{
    if (!_naviTabView) {
        _naviTabView = [[DZNaviTabView alloc] initWithTabArr:self.tabsArray Target:self action:@selector(titleButtonAction:)];
    }
    return _naviTabView;
}

-(DZTabPanScrollview *)tabScrollView{
    if (!_tabScrollView) {
        _tabScrollView = [[DZTabPanScrollview alloc]initWithFrame:KView_OutNavi_Bounds];
        _tabScrollView.bounces = NO;
        _tabScrollView.delegate = self;
        _tabScrollView.pagingEnabled = YES;
        _tabScrollView.showsHorizontalScrollIndicator = NO;
        _tabScrollView.contentSize = CGSizeMake(self.tabsArray.count*KScreenWidth, self.tabScrollView.height);
    }
    return _tabScrollView;
}


@end
