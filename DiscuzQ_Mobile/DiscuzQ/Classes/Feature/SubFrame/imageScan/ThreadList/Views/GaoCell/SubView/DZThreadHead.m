//
//  DZThreadHead.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadHead.h"

@interface DZThreadHead ()

@property (nonatomic, strong) UILabel *nameLabel;  //!< 昵称
@property (nonatomic, strong) UILabel *gradeLabel;  //!< 等级
@property (nonatomic, strong) UILabel *timeLabel;  //!< 最近更新时间
@property (nonatomic, strong) UIImageView *tagView;  //!< 置顶 或 精华 标记

@end

@implementation DZThreadHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.IconButton];
        [self addSubview:self.nameLabel];
        [self addSubview:self.gradeLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.tagView];
    }
    return self;
}

- (void)updateThreadHeadWithModel:(DZThreadListModel *)Model{
    
    self.nameLabel.text = Model.author;
    self.tagView.image = Model.tagImage;
    self.timeLabel.text = Model.dateline;
    self.gradeLabel.text = Model.gradeName;
    [self.IconButton sd_setImageWithURL:[NSURL URLWithString:Model.avatar] forState:UIControlStateNormal];
    
    [self layoutCellHead:Model.listLayout.headLayout];
}

-(void)layoutCellHead:(DZTHHeadLayout *)layout{
    
    self.IconButton.frame = layout.iconFrame;
    self.nameLabel.frame = layout.nameFrame;
    self.gradeLabel.frame = layout.gradeFrame;
    self.tagView.frame = layout.tagFrame;
    self.timeLabel.frame = layout.timeFrame;
    
    self.IconButton.layer.cornerRadius = 7.5f;//self.IconButton.width/2.f;
    self.IconButton.clipsToBounds = YES;
}

- (UIButton *)IconButton{
    if (!_IconButton) {
        _IconButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:nil titleColor:nil normalImgPath:@"noavatar_small" touchImgPath:@"noavatar_small" isBackImage:YES];
    }
    return _IconButton;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectZero title:@"--" titleColor:KColor(K2A2C2F_Color, 1.0) font:KFont(14) textAlignment:NSTextAlignmentLeft];
    }
    return _nameLabel;
}

-(UILabel *)gradeLabel{
    if (!_gradeLabel) {
        _gradeLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KColor(K2A2C2F_Color, 1.0) font:KFont(12) textAlignment:NSTextAlignmentLeft];
    }
    return _gradeLabel;
}

-(UIImageView *)tagView{
    if (!_tagView) {
        _tagView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _tagView;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KColor(K2A2C2F_Color, 1.0) font:KFont(12.f) textAlignment:NSTextAlignmentRight];
    }
    return _timeLabel;
}








@end
