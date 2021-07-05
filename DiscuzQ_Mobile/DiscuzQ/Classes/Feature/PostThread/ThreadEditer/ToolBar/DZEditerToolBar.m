//
//  DZEditerToolBar.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZEditerToolBar.h"
#import "DZEditerToolBox.h"
#import "DZMoreToolBox.h"

@interface DZEditerToolBar ()

@property (nonatomic, strong) UIButton *exChangeBtn;
@property (nonatomic, strong) DZMoreToolBox *moreToolBox;  //!< 附件工具箱 （表情，At，话题等）
@property (nonatomic, strong) DZEditerToolBox *editerToolBox;  //!< 编辑器工具箱（加错，斜体,链接等）

@end

@implementation DZEditerToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = KLightGray_Color.CGColor;
        [self addSubview:self.exChangeBtn];
        [self addSubview:self.moreToolBox];
        [self addSubview:self.editerToolBox];
    }
    return self;
}



-(void)exchangeBarModeAction:(UIButton *)button{
    
    if (self.moreToolBox.isSpread) {
        [UIView animateWithDuration:0.25 animations:^{
            self.moreToolBox.spread = !self.moreToolBox.isSpread;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.editerToolBox.spread = !self.editerToolBox.isSpread;
            }];
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.editerToolBox.spread = !self.editerToolBox.isSpread;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.moreToolBox.spread = !self.moreToolBox.isSpread;
            }];
        }];
    }
    
}

-(UIButton *)exChangeBtn{
    if (!_exChangeBtn) {
        _exChangeBtn = [UIButton ButtonImageWithFrame:CGRectMake(self.width-kMargin15-self.height, 0, self.height, self.height) normalImgPath:@"publish_mode_exchange" touchImgPath:@"publish_mode_exchange" isBackImage:NO Target:self action:@selector(exchangeBarModeAction:)];
    }
    return _exChangeBtn;
}

-(UIView *)moreToolBox{
    if (!_moreToolBox) {
        _moreToolBox = [[DZMoreToolBox alloc] initWithFrame:CGRectMake(0, 0, self.exChangeBtn.left - kMargin30, self.height)];
        _moreToolBox.spread = YES;
    }
    return _moreToolBox;
}

-(UIView *)editerToolBox{
    if (!_editerToolBox) {
        _editerToolBox = [[DZEditerToolBox alloc] initWithFrame:CGRectMake(0, 0, self.exChangeBtn.left - kMargin30, self.height)];
        _editerToolBox.spread = NO;
    }
    return _editerToolBox;
}



@end
