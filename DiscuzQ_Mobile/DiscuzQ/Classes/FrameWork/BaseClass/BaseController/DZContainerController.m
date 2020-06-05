//
//  TTContainerController.m
//  DiscuzQ
//
//  Created by WebersonGao on 16/4/23.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZContainerController.h"
#import "DZBaseTableController.h"

@interface DZContainerController()

@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic,strong) UICollectionView *collectonView;
@end

@implementation DZContainerController

#pragma mark - init

- (void)setParentControl:(UIViewController *)parentController {
    if (_parentController == nil) {
        _parentController = parentController;
        [parentController addChildViewController:self];
        [parentController.view addSubview:self.view];
        self.view.frame = CGRectMake(0, KScreenHeight - parentController.view.height, parentController.view.width, parentController.view.height);
    }
}

- (void)configSubControllers:(NSArray<UITableViewController *>*)subVCArray parentVC:(UIViewController *)parentVC segmentRect:(CGRect)segmentRect {
    
    [self setTableControllers:subVCArray];
    [self setParentControl:parentVC];
    
    if (subVCArray.count > 0) {
        [self.titleArray removeAllObjects];
        if (self.childViewControllers.count > 0) {
            [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj.view removeFromSuperview];
                [obj removeFromParentViewController];
            }];
            self.segmentControl = nil;
        }
        
        [subVCArray enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addChildViewController:obj];
            [self.titleArray addObject:obj.title ? : @""];
            if ([obj isKindOfClass:[DZBaseTableController class]]) {
                DZBaseTableController *tableVC = (DZBaseTableController *)obj;
                tableVC.tableView.frame = KScreenBounds;
            }else{
                obj.view.frame = KScreenBounds;
            }
        }];
    }
    
    [self.view addSubview:self.segmentControl];
    self.segmentControl.frame = CGRectMake(0, CGRectGetMinY(segmentRect), segmentRect.size.width, segmentRect.size.height);
    [self.segmentControl setSectionTitles:self.titleArray.copy];
    
    CGFloat height = KScreenHeight;
    CGFloat navMaxY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat tabbarHeight = CGRectGetHeight(self.tabBarController.tabBar.frame);
    if (self.navigationController) {
        height -= navMaxY;
    }
    if (parentVC.navigationController.viewControllers.count == 1) {
        height -= tabbarHeight;
    }
    
    self.collectonView.frame = CGRectMake(0, CGRectGetMaxY(segmentRect), KScreenWidth, height - CGRectGetMaxY(segmentRect));
    self.flowLayout.itemSize = self.collectonView.bounds.size;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectonView];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - collectionView datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.tableControllers.count;
}

-(void)setnaviBackColor:(UIColor *)naviBackColor{
    _naviBackColor = naviBackColor;
    [self.segmentControl setBackgroundColor:naviBackColor];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView *view = [self.tableControllers[indexPath.item] view];
    [cell.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if ([DataCheck isValidArray:self.tableControllers] && self.tableControllers.count > 1) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 0, 0, 0));
        } else {
            make.edges.equalTo(cell.contentView);
        }
    }];
    return cell;
}

#pragma mark - collectionView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    [self.segmentControl  setSelectedSegmentIndex:index];
    if (self.sendNotify && self.selectIndex != index) {
        // 延迟0.03秒执行 为了界面滑动流畅啊！！！！
        [self performSelector:@selector(firstRequest) withObject:nil afterDelay:0.03];
    }
    self.selectIndex = index;
}

// 通知方法
- (void)firstRequest {
    [[NSNotificationCenter defaultCenter] postNotificationName:DZ_ContainerRequest_Notify object:nil userInfo:@{@"selectIndex":[NSNumber numberWithInteger:self.selectIndex]}];
}

#pragma mark - setting
- (void)setSelectedAtIndex:(NSInteger)selectedIndex {
    CGFloat offsetX = self.collectonView.width * selectedIndex;
    self.collectonView.contentOffset = CGPointMake(offsetX, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewToCurrentTarget:scrollView.contentOffset.x];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate) {return;}
    [self scrollViewToCurrentTarget:scrollView.contentOffset.x];
}

-(void)scrollViewToCurrentTarget:(CGFloat)offsetX{
    int index = ceilf(offsetX/KScreenWidth);
    if (offsetX > 0 && index >= 0 && index < self.tableControllers.count) {
        self.currentCtrl = self.tableControllers[index];
    }else{
        self.currentCtrl = self.tableControllers.firstObject;
    }
}

#pragma mark - getting
- (NSMutableArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

-(DZSegmentedControl *)segmentControl{
    if (!_segmentControl) {
        _segmentControl = [[DZSegmentedControl alloc] initWithSectionTitles:self.titleArray.copy];
        _segmentControl.borderType = DZSegmentedControlBorderTypeBottom | DZSegmentedControlBorderTypeTop;
        _segmentControl.borderColor = KLine_Color;
        _segmentControl.borderWidth = 0.5;
        [_segmentControl setSelectionIndicatorColor:K_Color_Theme];
        [_segmentControl setSelectionIndicatorHeight:2.0];
        [_segmentControl setBackgroundColor:[UIColor whiteColor]];
        _segmentControl.segmentWidthStyle = DZSegmentedControlSegmentWidthStyleFixed;
        _segmentControl.selectionStyle = DZSegmentedControlSelectionStyleTextWidthMorelittle;
        _segmentControl.selectionIndicatorLocation = DZSegmentedControlSelectionIndicatorLocationDown;
        
        CGFloat minsize = 16.0;
        CGFloat maxsize = 17.0;
        CGFloat  space = (self.tableControllers.count <= 4) ? 0 : 16;
        _segmentControl.segmentEdgeInset = UIEdgeInsetsMake(0, space, 0, space);
        [_segmentControl setTitleFormatter:^NSAttributedString *(DZSegmentedControl *segmentedControl, NSString *title, NSUInteger index, BOOL selected) {
            NSAttributedString *attString = [[NSAttributedString alloc] init];
            attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : KGray_Color,NSFontAttributeName:KFont(minsize)}];
            if (selected) {
                attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : K_Color_Theme,NSFontAttributeName:KBoldFont(maxsize)}];
            }
            return attString;
        }];
        
        KWEAKSELF;
        [_segmentControl setIndexChangeBlock:^(NSInteger index) {
            [weakSelf setSelectedAtIndex:index];
        }];
        [_segmentControl setSelectedSegmentIndex:self.selectIndex];
    }
    return _segmentControl;
}


-(UICollectionView *)collectonView{
    if (!_collectonView) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.minimumInteritemSpacing = 0;
        
        //设置collectionView的属性
        _collectonView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_flowLayout];
        _collectonView.pagingEnabled = YES;
        _collectonView.showsHorizontalScrollIndicator = NO;
        _collectonView.allowsSelection = NO;
        //禁用滚动到最顶部的属性
        _collectonView.scrollsToTop = NO;
        _collectonView.bounces = NO;
        _collectonView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [_collectonView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
        _collectonView.delegate = self;
        _collectonView.dataSource = self;
    }
    return _collectonView;
}


@end










