//
//  DZThreadArticle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadArticle.h"
#import "DZThreadListStyle.h"
#import "DZHtmlLabel.h"

@interface DZThreadArticle ()

@property(nonatomic,strong) DZLabel *titleLabel;
@property(nonatomic,strong) DZHtmlLabel *contentLabel;

@end

@implementation DZThreadArticle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_articleView];
    }
    return self;
}

-(void)config_articleView{
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.contentLabel];
}


- (void)updateThreadArticle:(DZQDataThread *)Model style:(DZDHeadStyle *)localStyle{
    
    [self layoutArticleSubview:localStyle.frame_content];
    
    self.titleLabel.text = Model.attributes.title;
    
    [self.contentLabel updateHtml:localStyle.frame_content.kf_twoItem.attributedString rect:localStyle.frame_content.kf_twoItem.maxRect];
}


-(void)layoutArticleSubview:(DZDContentStyle *)layout{
    
    self.titleLabel.font = layout.kf_oneFont;
    self.titleLabel.frame = layout.kf_oneFrame;
    self.contentLabel.frame = layout.kf_twoFrame;
}


-(DZLabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KColor(K2A2C2F_Color, 1.0) font:KFont(14) textAlignment:NSTextAlignmentLeft];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

-(DZHtmlLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
    }
    return _contentLabel;
}





@end
