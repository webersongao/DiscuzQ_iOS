//
//  DZThreadCashPayView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadCashPayView.h"
#import "DZCashButton.h"
#import "DZThreadHelper.h"
#import "DZUserPayListView.h"
#import "DZEqualLayoutTool.h"

@interface DZThreadCashPayView ()

@property (nonatomic, strong) UILabel *infoLabel;  //!< 付费信息
@property (nonatomic, strong) UIButton *unfoldButton;  //!< 折叠按钮
@property (nonatomic, strong) DZCashButton *cashPayButton;  //!< 付费、打赏按钮
@property (nonatomic, strong) DZUserPayListView *rewardPayList;  //!< 付费、打赏用户列表

@end

@implementation DZThreadCashPayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        [self config_ThreadCashPayView];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}

-(void)config_ThreadCashPayView{
    [self addSubview:self.cashPayButton];
    [self addSubview:self.infoLabel];
    [self addSubview:self.rewardPayList];
    [self addSubview:self.unfoldButton];
}


-(void)updateThreadPayView:(DZQDataThread *)dataModel payLayout:(DZDPayStyle *)layout{
    
    NSArray *localArray = nil;
    if (dataModel.attributes.price > 0) {
        // 付费
        NSString *typeStr = @"查看内容";
        //        文章类型(0 普通 1 长文 2 视频 3 图片 4 语音 5 问答帖 6 商品帖)
        if (dataModel.attributes.type == 0) {
            typeStr = @"查看剩余内容";
        }else if (dataModel.attributes.type == 1){
            typeStr = @"查看剩余内容";
        }else if (dataModel.attributes.type == 2){
            typeStr = @"播放完整视频";
        }else if (dataModel.attributes.type == 3){
            typeStr = @"浏览完整图片";
        }
        
        localArray = dataModel.relationships.paidUsers;
        NSString *payStr = [NSString stringWithFormat:@"支付%.2f元%@",dataModel.attributes.price,typeStr];
        self.cashPayButton.hidden = (dataModel.attributes.price > 0) ? NO : YES;
        [self.cashPayButton setTitle:payStr forState:UIControlStateNormal];
        
        NSString *infoStr = [NSString stringWithFormat:@"%ld人已付费",localArray.count];
        self.infoLabel.text = infoStr;
        
    }else{
        // 打赏
        [self.cashPayButton setTitle:@"打赏" forState:UIControlStateNormal];
        localArray = dataModel.relationships.rewardedUsers;
        NSString *infoStr = [NSString stringWithFormat:@"%ld人已打赏",localArray.count];
        self.infoLabel.text = infoStr;
    }
    
    [self.rewardPayList updatePayUserList:localArray payLayout:layout];
    
    [self layoutPaySubviewLayout:layout];
    
}


-(void)layoutPaySubviewLayout:(DZDPayStyle *)layout{
    
    self.cashPayButton.frame = layout.kf_PayButton;
    self.infoLabel.frame = layout.kf_infoLabel;
    self.rewardPayList.frame = layout.kf_PayUserList;
    self.unfoldButton.frame = layout.kf_foldButton;
    
    [self.cashPayButton sizeToFit];
    self.cashPayButton.centerX = self.infoLabel.centerX;
}

-(void)unfoldPayListAction:(UIButton *)button{
    
    [DZThreadHelper thread_rewardOrPayListAction:nil];
}

// 打赏 付费
-(void)cashPayButtonPayAction:(UIButton *)button{
    
    [DZThreadHelper thread_rewardOrPayButtonAction:nil];
}



-(DZCashButton *)cashPayButton{
    if (!_cashPayButton) {
        _cashPayButton = [[DZCashButton alloc] initWithFrame:CGRectZero];
        [_cashPayButton addTarget:self action:@selector(cashPayButtonPayAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cashPayButton;
}

-(UILabel *)infoLabel{
    if (!_infoLabel) {
        _infoLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KGray_Color font:KFont(14) textAlignment:NSTextAlignmentCenter];
    }
    return _infoLabel;
}

-(DZUserPayListView *)rewardPayList{
    if (!_rewardPayList) {
        DZEqualLayoutTool * flowLayout = [[DZEqualLayoutTool alloc] initWithAlignType:AlignWithCenter betweenOfCell:kMargin5];
        _rewardPayList = [[DZUserPayListView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    }
    return _rewardPayList;
}

-(UIButton *)unfoldButton{
    if (!_unfoldButton) {
        _unfoldButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:nil titleColor:nil normalImgPath:@"dz_list_down" touchImgPath:@"dz_list_down_h" isBackImage:YES picAlpha:1];
        _unfoldButton.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
        [_unfoldButton addTarget:self action:@selector(unfoldPayListAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _unfoldButton;
}

@end
