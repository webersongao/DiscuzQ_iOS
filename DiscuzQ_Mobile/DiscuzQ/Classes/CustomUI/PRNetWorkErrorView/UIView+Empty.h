//
//  UIView+Empty.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DZEmptyView;

@interface UIView (Empty)

/**
 空页面占位图控件
 */
@property (nonatomic, strong) DZEmptyView *dz_emptyView;

///////////////////////
///////////////////////
//使用下面的四个方法请将EmptyView的autoShowEmptyView值置为NO，关闭自动显隐，以保证不受自动显隐的影响
///////////////////////
///////////////////////

/**
 一般用于开始请求网络时调用，dz_startLoading调用时会暂时隐藏emptyView
 当调用dz_endLoading方法时，dz_endLoading方法内部会根据当前的tableView/collectionView的
 DataSource来自动判断是否显示emptyView
 */
- (void)dz_startLoading;

/**
 在想要刷新emptyView状态时调用
 注意:dz_endLoading 的调用时机，有刷新UI的地方一定要等到刷新UI的方法之后调用，
 因为只有刷新了UI，view的DataSource才会更新，故调用此方法才能正确判断是否有内容。
 */
- (void)dz_endLoading;


//调用下面两个手动显隐的方法，不受DataSource的影响，单独设置显示与隐藏（前提是关闭autoShowEmptyView）

/**
 手动调用显示emptyView
 */
- (void)dz_showEmptyView;

/**
 手动调用隐藏emptyView
 */
- (void)dz_hideEmptyView;

@end

