//
//  ReplyCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/6/12.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "ReplyCell.h"
#import "oldMsgReplyModel.h"

@implementation ReplyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.timeLab = [[UILabel alloc] init];
    self.timeLab.backgroundColor = KWhite_Color;
    self.timeLab.font = KFont(12);
    self.timeLab.textColor = KGray_Color;
    [self.contentView addSubview:self.timeLab];
    
    self.floorLab = [[UILabel alloc] init];
    self.floorLab.font = KFont(12);
    self.floorLab.textAlignment = NSTextAlignmentRight;
    self.floorLab.textColor = KGray_Color;
    [self.contentView addSubview:self.floorLab];
    
    self.messageLab = [[UILabel alloc] init];
    self.messageLab.font = KFont(16);
    self.messageLab.numberOfLines = 0;
    [self.contentView addSubview:self.messageLab];
    
    self.subjectLab = [[UILabel alloc] init];
    self.subjectLab.textColor = KGray_Color;
    self.subjectLab.font = KFont(16);
    [self.contentView addSubview:self.subjectLab];
    
}

- (void)setInfo:(oldMsgReplyModel *)info {
    
    self.timeLab.text = info.dateline;
    
    NSArray *floorArr = @[@"楼主",@"沙发",@"板凳",@"地板"];
    NSString *floor = [NSString stringWithFormat:@"%ld楼",[info.position integerValue]];
    if (floorArr.count >= [info.position integerValue]) {
        floor = floorArr[[info.position integerValue] - 1];
    }
    self.floorLab.text = floor;
    self.messageLab.text = [info.message transformationStr];
    self.subjectLab.text = info.subject;
    
    self.timeLab.frame = CGRectMake(15, 10, 200, 15);
    self.floorLab.frame = CGRectMake(KScreenWidth - 15 - 50, 10, 50, 15);
    
    CGSize maxSize = CGSizeMake(KScreenWidth - 30, 100);
    CGSize textSize = [self.messageLab.text sizeWithFont:KFont(16) maxSize:maxSize];
    
    self.messageLab.frame = CGRectMake(15, CGRectGetMaxY(self.timeLab.frame) + 10, KScreenWidth - 30, textSize.height);
    
    self.subjectLab.frame = CGRectMake(15, CGRectGetMaxY(self.messageLab.frame) + 10, KScreenWidth - 30, 25);
}

- (CGFloat)cellHeight {
    return CGRectGetMaxY(self.subjectLab.frame) + 10;
}

@end
