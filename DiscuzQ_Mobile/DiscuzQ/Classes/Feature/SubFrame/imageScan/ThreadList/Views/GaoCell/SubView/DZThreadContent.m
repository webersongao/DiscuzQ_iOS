//
//  DZThreadContent.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadContent.h"

@interface DZThreadContent ()

@property (nonatomic, strong) UILabel *subTitleLabel;  //!< 最新回复

@end

@implementation DZThreadContent

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.subTitleLabel];
    }
    return self;
}

- (void)updateThreadContent:(NSString *)lastReplyString{
    
    self.subTitleLabel.text = lastReplyString;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.subTitleLabel.frame = self.bounds;
}

-(UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KColor(K2A2C2F_Color, 1.0) font:KFont(14) textAlignment:NSTextAlignmentLeft];
        _subTitleLabel.numberOfLines = 0;
    }
    return _subTitleLabel;
}

@end
