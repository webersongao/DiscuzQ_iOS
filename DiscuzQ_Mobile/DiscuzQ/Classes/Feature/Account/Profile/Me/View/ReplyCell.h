//
//  ReplyCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2017/6/12.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
@class oldMsgReplyModel;

@interface ReplyCell : DZBaseTableViewCell

@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *floorLab;
@property (nonatomic, strong) UILabel *messageLab;
@property (nonatomic, strong) UILabel *subjectLab;

- (CGFloat)cellHeight;
- (void)setInfo:(oldMsgReplyModel *)info;

@end
