//
//  DZThreadDetailListView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"

@class DZThreadDetailListView;
@protocol detailListViewDelgate <NSObject>

@optional
- (void)detailListView:(DZThreadDetailListView *)detailListView scrollDidScroll:(CGFloat)offsetY;

- (void)detaiVideoView:(DZVideoPicView *)videoView videoDidPlayClick:(DZQDataVideo *)dataVideo;

@end

@interface DZThreadDetailListView : DZBaseTableView


@property (nonatomic,weak) id<detailListViewDelgate> detailDelegate;  //!< 右侧按钮事件

-(void)updateThreadHeadDetail:(DZQDataThread *)dataModel;

-(void)updateThreadPostDetail:(NSArray<DZQDataPost *> *)dataPostList;



@end


