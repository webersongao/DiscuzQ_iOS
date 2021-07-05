//
//  DZQChatEmotionView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZQChatEmotionFooter.h"
#import "DZQChatEmotionCell.h"

/**
 表情列表视图
 */
@protocol DZQChatEmotionViewDelegate <NSObject>

-(void)DZQChatEmotionViewBtnAction:(NSInteger)index;
//点击其中的一个表情或者删除按钮
- (void)DZQChatKeyBordSymbolCellClick:(NSObject *)emojiString;

@end

@interface DZQChatEmotionView : UIView

@property(nonatomic,strong) DZQChatEmotionFooter *footer;
@property (nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,assign)id<DZQChatEmotionViewDelegate>delegate;


@end




