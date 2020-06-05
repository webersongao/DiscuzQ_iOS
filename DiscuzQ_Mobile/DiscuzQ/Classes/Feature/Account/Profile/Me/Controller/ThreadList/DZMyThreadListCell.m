//
//  DZMyThreadListCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZMyThreadListCell.h"
#import "MyThreadVarModel.h"

@implementation DZMyThreadListCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, KScreenWidth-25, 50)];
    self.titleLabel.font = KFont(14);
    self.titleLabel.textColor = K_Color_MainTitle;
    self.titleLabel.numberOfLines = 0;
    [self addSubview:self.titleLabel];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), self.titleLabel.frame.size.height, 100, 15)];
    self.nameLabel.font = KFont(12);//12
    self.nameLabel.textColor = K_Color_Theme;
    [self addSubview:self.nameLabel];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + 5, self.titleLabel.frame.size.height, 120, 15)];
    self.timeLabel.font = KFont(12);//12
    self.timeLabel.textColor = mRGBColor(180, 180, 180);
    [self addSubview:self.timeLabel];
}

-(void)updateDZMyThreadListCell:(ThreeadItemModel *)model{
    
    if (![model isKindOfClass:[ThreeadItemModel class]]) {
        KSLog(@"WBS  数据类型异常,无法显示");
        return;
    }
    
    NSString *subject = model.subject;
    self.titleLabel.text = model.subject;
    
    if (model.displayorder.length) {
        NSString *displayorder = model.displayorder;
        if ([displayorder isEqualToString:@"-2"]) {
            subject = [subject stringByAppendingString:[NSString stringWithFormat:@"(审核中)"]];
            
        } else if ([displayorder isEqualToString:@"-1"]) {
            subject = [subject stringByAppendingString:[NSString stringWithFormat:@"(回收站)"]];
        }
        if ([displayorder isEqualToString:@"-2"] || [displayorder isEqualToString:@"-1"]) {
            NSMutableAttributedString *subjectStr = [[NSMutableAttributedString alloc] initWithString:subject];
            NSDictionary *attDic = @{NSForegroundColorAttributeName:KGray_Color,
                                     NSFontAttributeName:KFont(12)
            };
            [subjectStr addAttributes:attDic range:NSMakeRange(subject.length - 5, 5)];
            self.titleLabel.attributedText = subjectStr;
        }
    }
    
    self.nameLabel.text = model.author;
    self.timeLabel.text = [model.dateline transformationStr];
}

@end
