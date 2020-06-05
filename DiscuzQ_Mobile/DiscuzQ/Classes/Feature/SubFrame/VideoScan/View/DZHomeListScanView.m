//
//  DZHomeListScanView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZHomeListScanView.h"
#import "HomeThreadContentView.h"

@interface DZHomeListScanView ()<HeaderCollectionDelegate,UIScrollViewDelegate,ThreadContentViewDelegate>

@property (nonatomic, strong) HomeThreadContentView *contentView;  //!< 属性注释

@end


@implementation DZHomeListScanView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounces = NO;
        self.delegate = self;
        [self configHomeScrollView];
    }
    return self;
}


-(void)configHomeScrollView{
    [self addSubview:self.cateHeader];
    [self addSubview:self.contentView];
    self.cateHeader.headerDelegate = self;
    self.contentView.listDelgate = self;
    self.contentView.ListScrollEnabled = NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark   /********************* HeaderCollectionDelegate *************************/

- (void)collectionView:(HomeCollectionView *)collectionView didSelectItemCell:(HomeCollectionCell *)itemCell {
    KSLog(@"WBS 点击了 板块：%@",itemCell.cellModel.name);
    [[DZMobileCtrl sharedCtrl] PushToForumListController:itemCell.cellModel.cate_id];
}

- (void)collectionView:(HomeCollectionView *)collectionView longPressItemCell:(HomeCollectionCell *)itemCell{
    KSLog(@"WBS 别按啦，暂时长按没有效果");
}

- (void)collectionView:(HomeCollectionView *)collectionView scrollDidScroll:(CGFloat)offsetY{
    
}

- (void)collectionViewWillBeginDragging{
    
}

- (void)collectionViewDidEndScroll{
    
}

#pragma mark   /********************* UIScrollViewDelegate *************************/
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    KSLog(@"上面 偏移量%.2f",scrollView.contentOffset.y);
    [self homeViewScrollViewYScroll:scrollView];
}

#pragma mark   /********************* ThreadContentViewDelegate *************************/

- (void)threadListContentView:(UIScrollView *)scrollView scrollDidScroll:(CGFloat)offsetY{
    KSLog(@"下面 偏移量%.2f",offsetY);
    [self homeViewScrollViewYScroll:scrollView];
}

-(void)homeViewScrollViewYScroll:(UIScrollView *)scrollView{
    if ([scrollView isEqual:self]) {
        
    }else if ([scrollView isKindOfClass:[UITableView class]]){
        
    }
}

-(HomeCollectionView *)cateHeader{
    if (_cateHeader == nil) {
        _cateHeader = [[HomeCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kHomeHeaderHeight) collectionViewLayout:[HomeCollectionView gridLayout]];
    }
    return _cateHeader;
}


-(HomeThreadContentView *)contentView{
    if (_contentView == nil) {
        _contentView = [[HomeThreadContentView alloc] initWithFrame:CGRectMake(0, self.cateHeader.bottom, KScreenWidth, KScreenHeight)];
    }
    return _contentView;
}

@end







