//
//  DZQChatBaseCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
#import "DZQChatMsgLayout.h"

@class DZQChatBaseCell;

@protocol DZQChatCellDelegate <NSObject>

@optional;
//点击头像
-(void)DZQChatCellHeaderClick:(NSInteger)index indexPath:(NSIndexPath *)indexPath;

//点击文本cell
-(void)DZQChatCellTextClick:(NSIndexPath*)indexPath index:(NSInteger)index layout:(DZQChatMsgLayout *)layout;

//点击cell图片和短视频
-(void)DZQChatCellImageVideoClick:(NSIndexPath *)indexPath layout:(DZQChatMsgLayout *)layout;

//点击定位cell
-(void)DZQChatCellLocationClick:(NSIndexPath*)indexPath layout:(DZQChatMsgLayout *)layout;

@end

@interface DZQChatBaseCell : DZBaseTableViewCell


-(void)config_ChatCellUserInterface;

@property(nonatomic,assign,readonly)id<DZQChatCellDelegate>cellDelegate;

@property(nonatomic, strong,readonly) NSIndexPath *indexPath;
@property(nonatomic, strong,readonly) DZQChatMsgLayout *layout;

//撤销 删除 复制
@property(nonatomic, strong) UIMenuController *menu;

//头像  时间  背景按钮
@property(nonatomic, strong) UIButton *mHeaderImgBtn;
@property(nonatomic, strong) UILabel  *mMessageTimeLab;
@property(nonatomic, strong) UIButton  *mBackImgButton;
//文本消息
@property(nonatomic, strong) UITextView *labelTextView;
//图片消息
@property(nonatomic,strong) UIImageView *mImgView;
//视频消息
@property(nonatomic,strong) UIButton *mVideoBtn;
@property(nonatomic,strong) UIImageView *mVideoImg;


//消息按钮
-(void)buttonPressed:(UIButton *)sender;

-(void)updateChatCell:(DZQChatMsgLayout *)layout indexPath:(NSIndexPath *)indexPath delegate:(id)delegate;


@end

