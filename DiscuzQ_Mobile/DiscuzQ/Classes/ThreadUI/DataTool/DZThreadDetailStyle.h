//
//  DZThreadDetailStyle.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZDDetailStyle.h"
#import "DZDPostCellStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadDetailStyle : DZQStyle

@property (nonatomic, strong) DZDHeadStyle *frame_detail_Head;  //!< 详情的核心内容（作者信息 以及 主题（主题，文章，视频）详情）
@property (nonatomic, strong) DZDSectionStyle *frame_detail_Section;  //!< 点赞 打赏用户列表

@property(nonatomic,assign) CGRect kf_Header; // 内容高度
@property(nonatomic,assign) CGRect kf_Section; // 内容高度


-(void)reloadThreadDetailWithDataModel:(DZQDataThread *)dataModel;



@end

NS_ASSUME_NONNULL_END
