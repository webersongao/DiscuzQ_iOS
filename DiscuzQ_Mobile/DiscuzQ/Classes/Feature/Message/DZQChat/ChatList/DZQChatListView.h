//
//  DZQChatListView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"
#import "DZQChatMsgLayout.h"

NS_ASSUME_NONNULL_BEGIN

@class DZQChatListView;
@protocol DZQChatListViewDelegate <NSObject>

// Cell Action (不包含等类型)
-(void)DZQChatListClickAction:(NSIndexPath *)indexPath layout:(DZQChatMsgLayout *)layout;

/// Cell Media （图片，视频，音频）等
-(void)DZQChatListMediaAction:(NSInteger)currentIndex mediaItems:(NSArray *)mediaItems;

// Cell 头像
-(void)DZQChatListHeaderAction:(NSIndexPath *)indexPath layout:(DZQChatMsgLayout *)layout;

// Cell 结束编辑状态
-(void)DZQChatListEndEdiAction:(DZQChatListView *)listView;

@end

@interface DZQChatListView : DZBaseTableView


-(void)updateChatDetailList:(NSArray *)datas scrollIndex:(NSIndexPath  *)indexPath;

@property(nonatomic,assign)id<DZQChatListViewDelegate>listDelegate;

@end

NS_ASSUME_NONNULL_END
