//
//  DZThreadCateDetailView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadCateDetailView.h"
#import "DZForumCateHeader.h"
#import "PRNaviSegmentView.h"
#import "DZThreadCateInnerView.h"

@interface DZThreadCateDetailView ()<UIScrollViewDelegate,PRNaviSegmentViewDelegate>

@property (nonatomic,assign) int currentIndex;
@property (nonatomic ,strong) DZQDataCate *dataCate;
@property (nonatomic, strong) DZForumCateHeader *headView;
@property (nonatomic, strong) PRNaviSegmentView *ScrollBar;  //!< 属性注释
@property (nonatomic, strong) DZThreadCateInnerView *innerScrollView;

@end

@implementation DZThreadCateDetailView

- (instancetype)initWithFrame:(CGRect)frame cate:(DZQDataCate *)dataCate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounces = NO;
        self.delegate = self;
        self.currentIndex = 0;
        self.dataCate = dataCate;
        [self config_ThreadCateDetailView];
        self.zf_scrollViewDirection = ZFPlayerScrollViewDirectionVertical;
    }
    return self;
}


-(void)config_ThreadCateDetailView{
    
    [self addSubview:self.headView];
    [self addSubview:self.ScrollBar];
    [self addSubview:self.innerScrollView];
    
    KWEAKSELF
    self.innerScrollView.backSBlock = ^(NSInteger index) {
        if(weakSelf.currentIndex != index){
            weakSelf.currentIndex = (int)index;
            weakSelf.ScrollBar.segmentView.selectIndex = index;
        }
    };
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= 80.f) {
        [self setContentOffset:CGPointMake(scrollView.contentOffset.x, 80)];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


-(void)first_updateSuperCateData{
    [self.innerScrollView first_updateInnerCateData:0];
}


- (void)naviSegment:(PRNaviSegmentView *)segmentView touchSameNaviIndex:(NSInteger)index{
    [self.innerScrollView setContentOffset:CGPointMake(index*self.width, 0) animated:YES];
    [self.innerScrollView first_updateInnerCateData:index];
}

- (void)naviSegment:(PRNaviSegmentView *)segmentView updateNaviTitleIndex:(NSInteger)index{
    [self.innerScrollView setContentOffset:CGPointMake(index*self.width, 0) animated:YES];
    [self.innerScrollView first_updateInnerCateData:index];
}

-(DZForumCateHeader *)headView{
    if (!_headView) {
        _headView = [[DZForumCateHeader alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth,80)];
    }
    return _headView;
}

-(PRNaviSegmentView *)ScrollBar{
    if (_ScrollBar == nil) {
        _ScrollBar = [[PRNaviSegmentView alloc] initWithFrame:CGRectMake(0, self.headView.bottom, KScreenWidth, kToolBarHeight)];
        _ScrollBar.segDelegate = self;
        _ScrollBar.isBind = YES;// 固定不移动
        NSArray *titleAray = @[@"全部",@"视频",@"精华"];
        [_ScrollBar updateNaviBarWithTitle:titleAray cache:NO];
    }
    return _ScrollBar;
}


-(DZThreadCateInnerView *)innerScrollView{
    if (!_innerScrollView) {
        _innerScrollView = [[DZThreadCateInnerView alloc] initWithInnerFrame:CGRectMake(0, self.ScrollBar.bottom, KScreenWidth,self.height-kToolBarHeight) cate:self.dataCate];
    }
    return _innerScrollView;
}




@end
