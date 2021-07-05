//
//  PRNaviSegmentView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/6/3.
//
/*
 横向可滚动的栏目条：自适应宽度，超过屏宽自动滚动
 */
#import <UIKit/UIKit.h>
#import "PRTagSegmentView.h"

@class PRNaviSegmentView;

@protocol PRNaviSegmentViewDelegate <NSObject>

@optional
- (void)naviSegment:(PRNaviSegmentView *)segmentView touchNaviIndex:(NSInteger)index;
- (void)naviSegment:(PRNaviSegmentView *)segmentView touchSameNaviIndex:(NSInteger)index;
- (void)naviSegment:(PRNaviSegmentView *)segmentView updateNaviTitleIndex:(NSInteger)index;

@end

@interface PRNaviSegmentView : UIScrollView

@property (nonatomic, copy) void(^WidthEqualBlock)(BOOL isEqual);  //!< 属性注释
@property (nonatomic, assign) BOOL isBind;  //!< 滚动条是否固定不移动
@property (nonatomic, strong) PRTagSegmentView *segmentView;  //!< 属性注释
@property (nonatomic, weak) id<PRNaviSegmentViewDelegate> segDelegate;  //!< 属性注释
@property (nonatomic, strong) UIView *bottomScrollLine;  //!< <#属性注释#>

-(void)updateNaviBarWithTitle:(NSArray <NSString *>*)titleArray cache:(BOOL)cache;




@end

