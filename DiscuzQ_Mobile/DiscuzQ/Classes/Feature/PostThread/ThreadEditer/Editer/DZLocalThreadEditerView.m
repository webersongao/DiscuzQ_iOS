//
//  DZLocalThreadEditerView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZLocalThreadEditerView.h"
#import "ZHPickerView.h"
#import "DZEditerToolBar.h"
#import "DZThreadEditAreaView.h"

@interface DZLocalThreadEditerView ()

@property (nonatomic, strong) DZThreadEditAreaView *areaView;  //!< 属性注释
@property (nonatomic, strong) ZHPickerView *payPricePicker;  //!< 付费价格
@property (nonatomic, strong) ZHPickerView *categoryPicker;  //!< 分类选择
@property (nonatomic, strong) ZHPickerView *textNumPicker;  //!< 限制浏览字数

@property (nonatomic, strong) DZEditerToolBar *editerToolbar;  //!< 艾特，话题 表情 键盘工具条


@end

@implementation DZLocalThreadEditerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_threadEditerView];
        self.backgroundColor = KLightLine_Color;
    }
    return self;
}


-(void)config_threadEditerView{
    
    [self addSubview:self.areaView];
    [self addSubview:self.categoryPicker];
    [self addSubview:self.payPricePicker];
    [self addSubview:self.textNumPicker];
    [self addSubview:self.editerToolbar];
}

// 更新 文本信息
-(void)setLocalDraft:(DZThreadDraftM *)localDraft{
    [self.areaView updateEditerAreaView:localDraft];
}

-(DZThreadDraftM *)localDraft{
    return [self localEditerThreadDraft];
}


-(DZThreadDraftM *)localEditerThreadDraft{
    
    DZThreadDraftM *draft = [[DZThreadDraftM alloc] init];
    draft.type = 1;
    draft.title = self.areaView.titleStr;
    draft.content = self.areaView.contentStr;
    
    //    draft.title = @"标题：本文发自DiscuzQ iOS客户端-卫博生（测试）";
    //    draft.content = @"主题正文：Discuz Q iOS客户端是由个人开发，属于非官方版，基于OC Swift纯原生编程语言开发，从第一行原生代码开始，完全从零做起，非嵌套，非套壳儿，不含任何冗余功能和代码。所有代码已在Github上开源，真实可查。目前基本支持发帖，回帖，站内私信，推送，分享等基础功能，后面会逐步增加语音和视频云剪辑，社交雷达，表情包，广场等功能，欲了解最新开发进度：微信：ChinaMasker。 \n Discuz! Q 使用主流的框架，前后分离的方式重写了全部代码，数百个接口全部开放，原生的连接微信生态和腾讯云，帮助开发者事半功倍 ；基于 Apache License 2.0 开源协议，开发者无后顾之忧，只需专注于业务场景的落地。";
    
    return draft;
}




-(DZThreadEditAreaView *)areaView{
    if (!_areaView) {
        _areaView = [[DZThreadEditAreaView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height - self.editerToolbar.height - kMargin5)];
    }
    return _areaView;
}

-(ZHPickerView *)payPricePicker{
    if (!_payPricePicker) {
        _payPricePicker = [[ZHPickerView alloc] initPickviewWithArray:@[@"付费价格",@"张三",@"李四"] isHaveNavControler:YES];
        _payPricePicker.hidden = YES;
    }
    return _payPricePicker;
}


-(ZHPickerView *)categoryPicker{
    if (!_categoryPicker) {
        _categoryPicker = [[ZHPickerView alloc] initPickviewWithArray:@[@"分类选择",@"张三",@"李四"] isHaveNavControler:YES];
        _categoryPicker.hidden = YES;
    }
    return _categoryPicker;
}



-(ZHPickerView *)textNumPicker{
    if (!_textNumPicker) {
        _textNumPicker = [[ZHPickerView alloc] initPickviewWithArray:@[@"字数选择",@"张三",@"李四"] isHaveNavControler:YES];
        _textNumPicker.hidden = YES;
    }
    return _textNumPicker;
}


-(DZEditerToolBar*)editerToolbar{
    if (!_editerToolbar) {
        _editerToolbar = [[DZEditerToolBar alloc] initWithFrame:CGRectMake(0, self.height - kToolBarHeight, self.width, kToolBarHeight)];
        _editerToolbar.backgroundColor = KLightLine_Color;
    }
    return _editerToolbar;
}


@end
