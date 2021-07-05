//
//  DZThreadNormal.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadNormal.h"
#import "DZPicSquareView.h"
#import "DZThreadListStyle.h"
#import "DZThreadHelper.h"
#import "DZHtmlLabel.h"

@interface DZThreadNormal ()<DZPicSquareDelegate>

@property(nonatomic,strong) DZHtmlLabel *contentLabel;

@end

@implementation DZThreadNormal

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_normalView];
    }
    return self;
}

-(void)config_normalView{
    [self addSubview:self.contentLabel];
}


- (void)updateThreadNormal:(DZQPostRelationV1 *)relateModel style:(DZDContentStyle *)localStyle{
    
    [self layoutNormalSubview:localStyle];
    
    [self.contentLabel updateContent_Html:localStyle.kf_contentItem];
    
}

-(void)layoutNormalSubview:(DZDContentStyle *)layout{
                            
    self.contentLabel.frame = layout.kf_contentFrame;
    
}


-(DZHtmlLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
    }
    return _contentLabel;
}


@end
