//
//  DZDDetailStyle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZDListStyle.h"
#import "DZDContentStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZDHeadStyle : DZQStyle

@property (nonatomic, strong) DZDUserStyle *frame_user;  //!< 主题作者
@property (nonatomic, strong) DZDContentStyle *frame_content;  //!< 主题内容区
@property (nonatomic, strong) DZDToolBarStyle *frame_toolBar;  //!< 转评赞 工具条

@property(nonatomic,assign) CGRect kf_head;
@property(nonatomic,assign) CGRect kf_content;
@property(nonatomic,assign) CGRect kf_toolBar;

@property(nonatomic,assign) CGSize kf_HeadSize;

// 计算 空间高度 宽度等
- (instancetype)DHeadStyle:(DZQDataThread *)dataModel cellWidth:(CGFloat)cellWidth maxWidth:(CGFloat)maxWidth;

@end


@interface DZDPayStyle : DZQStyle

@property(nonatomic,assign) CGRect kf_PayButton;
@property(nonatomic,assign) CGRect kf_infoLabel;

@property (nonatomic, assign) CGSize UitemSize;  //!< 单元格大小(均等大小)
@property (nonatomic, assign) UIEdgeInsets USectionEdge;  //!< 组间距
@property (nonatomic, assign) CGFloat UMinimumLine;  //!< // 行间距 (上下间隔)
@property (nonatomic, assign) CGFloat UMinimumInteritem;  //!< // 列间距 (左右间隔)

@property(nonatomic,assign) CGRect kf_PayUserList; // 打赏或付费用户列表
@property(nonatomic,assign) CGRect kf_foldButton;

@property(nonatomic,assign) CGSize kf_PayViewSize;

+(instancetype)DZQDetailPayStyle:(CGFloat)cellWidth payOrReward:(NSInteger)payOrReCount;

@end



@interface DZDSectionStyle : DZQStyle

@property (nonatomic, strong) DZDPayStyle *frame_PayView;  //!< 打赏，支付详情区域
@property (nonatomic, strong) DZDToolBarStyle *frame_toolBar;  //!< 转评赞 工具条

@property(nonatomic,assign) CGRect kf_PayView;
@property(nonatomic,assign) CGRect kf_toolBar;

@property(nonatomic,assign) CGRect kf_Line;
@property(nonatomic,assign) CGRect kf_listOne;
@property(nonatomic,assign) CGRect kf_bottomLine;

@property(nonatomic,assign) CGSize kf_SectionSize;

+(instancetype)DSectionStyle:(CGFloat)cellWidth like:(NSInteger)likeCount payOrReward:(NSInteger)payOrReward;

@end


NS_ASSUME_NONNULL_END
