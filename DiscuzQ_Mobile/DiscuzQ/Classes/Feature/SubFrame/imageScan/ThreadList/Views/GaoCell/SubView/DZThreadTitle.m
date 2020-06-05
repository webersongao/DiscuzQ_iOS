//
//  DZThreadTitle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadTitle.h"
#import "UILabel+TopTitle.h"

@interface DZThreadTitle ()

@property (nonatomic, strong) UILabel *mainTitleLabel;  //!< 主标题

@end

@implementation DZThreadTitle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.mainTitleLabel];
    }
    return self;
}

- (void)updateThreadTitle:(NSString *)title isTop:(BOOL)isTop{
    NSString *titleString = checkNull(title);
    if (!isTop) {
        self.mainTitleLabel.text = titleString;
    }else{
        [self.mainTitleLabel setText:titleString andImageName:@"置顶" andSize:CGSizeMake(34 ,17) andPosition:P_before];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.mainTitleLabel.frame = self.bounds;
}

-(UILabel *)mainTitleLabel{
    if (!_mainTitleLabel) {
        _mainTitleLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KColor(K2A2C2F_Color, 1.0) font:KBoldFont(16) textAlignment:NSTextAlignmentLeft];
        _mainTitleLabel.numberOfLines = 1;
    }
    return _mainTitleLabel;
}


@end
