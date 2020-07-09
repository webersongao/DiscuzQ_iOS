//
//  DZForumCateHeader.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/17.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZForumCateHeader.h"

@interface DZForumCateHeader()

@property (nonatomic, strong) UIImageView *IconV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, strong) UIView *sepLine;
// 该分类最近更新时间
@property (nonatomic, strong) UILabel *threadCountLabel;

@end

@implementation DZForumCateHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_CateHeader];
        self.backgroundColor = KWhite_Color;
    }
    return self;
}

- (void)config_CateHeader {
    
    [self addSubview:self.IconV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.descLabel];
    
    [self addSubview:self.threadCountLabel];
    
    [self layoutCateHeader];
    
}

-(void)updateCateHeader:(DZQDataCate *)dataCate{
    
    self.titleLabel.text = dataCate.attributes.name;
    self.descLabel.text = dataCate.attributes.cate_desc;
    [self.IconV dz_setImageWithURL:dataCate.attributes.icon placeholder:KImageNamed(DZQ_icon)];
    self.threadCountLabel.text = checkTwoStr(@"主题数：", checkInteger(dataCate.attributes.thread_count));
}

-(void)layoutCateHeader{
    
    self.titleLabel.frame = CGRectMake(self.IconV.right + kMargin10, self.IconV.top+5.f, 200, 18);
    self.descLabel.frame = CGRectMake(self.titleLabel.left, self.titleLabel.bottom+kMargin15, 200, 13);
    self.threadCountLabel.frame = CGRectMake(self.width - 90 - kMargin15, (self.height/2.f)-6, 90, 12.f);
    
    self.sepLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 5, KScreenWidth, 5)];
    self.sepLine.backgroundColor = KGroupLine_Color;
    [self addSubview:self.sepLine];
    
}

-(UIImageView *)IconV{
    if (_IconV == nil) {
        _IconV = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin15, kMargin10, 55.f, 55.f)];
        _IconV.layer.cornerRadius = 8;
        _IconV.layer.masksToBounds = YES;
        _IconV.contentMode = UIViewContentModeScaleAspectFit;
        _IconV.image = [UIImage imageNamed:@"discuz_cor_logo"];
    }
    return _IconV;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithFrame:CGRectZero title:@"未分类" titleColor:KGreen_Color fontSize:17.f textAlignment:NSTextAlignmentLeft];
    }
    return _titleLabel;
}

-(UILabel *)threadCountLabel{
    if (!_threadCountLabel) {
        _threadCountLabel = [UILabel labelWithFrame:CGRectZero title:@"主题数：暂无" titleColor:KGray_Color fontSize:12.f textAlignment:NSTextAlignmentRight];
    }
    return _threadCountLabel;
}

- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [UILabel labelWithFrame:CGRectZero title:@"主题分类描述文字" titleColor:KTitle_Color fontSize:14.f textAlignment:NSTextAlignmentLeft];
    }
    return _descLabel;
}



@end
