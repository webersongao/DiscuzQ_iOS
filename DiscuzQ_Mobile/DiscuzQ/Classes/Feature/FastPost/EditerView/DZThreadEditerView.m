//
//  DZThreadEditerView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadEditerView.h"
#import "DZEditTextView.h"
#import "DZTextField.h"
#import "ZHPickerView.h"
#import "DZAttachGridView.h"

@interface DZThreadEditerView ()

@property (nonatomic, strong) DZTextField *titleField;  //!< 标题
@property (nonatomic, strong) DZEditTextView *contentField;  //!< 正文
@property (nonatomic, strong) DZAttachGridView *mediaAttach;  //!< 图片或视频
@property (nonatomic, strong) DZAttachGridView *fileAttach;  //!< 附件

@property (nonatomic, strong) ZHPickerView *payPricePicker;  //!< 付费价格
@property (nonatomic, strong) ZHPickerView *categoryPicker;  //!< 分类选择
@property (nonatomic, strong) ZHPickerView *textNumPicker;  //!< 限制浏览字数

@property (nonatomic, strong) UIView *editdddToolbar;  //!< 艾特，话题 表情 键盘工具条
@property (nonatomic, strong) UIView *editerToolbar;  //!< 富文本编辑器 键盘工具条

@end




@implementation DZThreadEditerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_threadEditerView];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}


-(void)config_threadEditerView{
    
    [self addSubview:self.titleField];
    [self addSubview:self.contentField];
    [self addSubview:self.mediaAttach];
    [self addSubview:self.fileAttach];
    [self addSubview:self.categoryPicker];
    [self addSubview:self.payPricePicker];
    [self addSubview:self.textNumPicker];
    
}



#pragma mark   /********************* 初始化 *************************/


- (DZTextField *)titleField{
    if (!_titleField) {
        _titleField = [[DZTextField alloc] initWithFrame:CGRectMake(kMargin15, 0, self.width-kMargin30, kToolBarHeight)];
    }
    return _titleField;
}

-(DZEditTextView *)contentField{
    if (!_contentField) {
        _contentField = [[DZEditTextView alloc] initWithFrame:CGRectMake(kMargin15, CGRectGetMaxY(self.titleField.frame), self.width-kMargin30, 300)];
    }
    return _contentField;
}



-(DZAttachGridView *)mediaAttach{
    if (!_mediaAttach) {
        DZGridFlowLayout *layout = [[DZGridFlowLayout alloc] initWithWidth:self.width-kMargin30 WHScale:1.0];
        _mediaAttach = [[DZAttachGridView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    return _mediaAttach;
}

-(DZAttachGridView *)fileAttach{
    if (!_fileAttach) {
        DZGridFlowLayout *layout = [[DZGridFlowLayout alloc] initWithWidth:self.width-kMargin30 WHScale:0.5];
        _fileAttach = [[DZAttachGridView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    return _fileAttach;
}

-(ZHPickerView *)payPricePicker{
    if (!_payPricePicker) {
        _payPricePicker = [[ZHPickerView alloc] initPickviewWithArray:@[@"张三",@"李四"] isHaveNavControler:YES];
        _payPricePicker.backgroundColor = KDebug_Color;
    }
    return _payPricePicker;
}


-(ZHPickerView *)categoryPicker{
    if (!_categoryPicker) {
        _categoryPicker = [[ZHPickerView alloc] initPickviewWithArray:@[@"张三",@"李四"] isHaveNavControler:YES];
        _categoryPicker.backgroundColor = KDebug_Color;
    }
    return _categoryPicker;
}



-(ZHPickerView *)textNumPicker{
    if (!_textNumPicker) {
        _textNumPicker = [[ZHPickerView alloc] initPickviewWithArray:@[@"张三",@"李四"] isHaveNavControler:YES];
        _textNumPicker.backgroundColor = KDebug_Color;
    }
    return _textNumPicker;
}



@end
