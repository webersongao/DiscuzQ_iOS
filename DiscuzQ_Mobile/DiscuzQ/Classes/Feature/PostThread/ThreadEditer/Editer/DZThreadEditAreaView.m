//
//  DZThreadEditAreaView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadEditAreaView.h"
#import "DZQTextField.h"
#import "DZPickerHeader.h"
#import "DZEditTextView.h"
#import "DZAttachGridView.h"

@interface DZThreadEditAreaView ()

@property (nonatomic, strong) DZQTextField *titleField;  //!< 标题
@property (nonatomic, strong) DZEditTextView *contentField;  //!< 正文

@property (nonatomic, strong) UIButton *locationButton;  //!< 定位
@property (nonatomic, strong) UIButton *categoryButton;  //!< 分类

@property (nonatomic, strong) DZAttachGridView *mediaAttach;  //!< 图片或视频

@end

@implementation DZThreadEditAreaView

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
    
    [self addSubview:self.titleField];
    [self addSubview:self.contentField];
    
    [self addSubview:self.categoryButton];
    [self addSubview:self.locationButton];
    
    [self addSubview:self.mediaAttach];
    
    [self.mediaAttach updateDraftAttachList:nil];
    self.contentSize = CGSizeMake(self.width, MAX(self.mediaAttach.bottom + kMargin5, self.height));
}

-(NSString *)titleStr{
    return self.titleField.text;
}

- (NSString *)contentStr{
    return self.contentField.text;
}

-(void)updateEditerAreaView:(DZThreadDraftM *)threadDraft{
    
    
    [self.mediaAttach updateDraftAttachList:nil];
}

#pragma mark   /********************* 初始化 *************************/


-(DZQTextField *)titleField{
    if (!_titleField) {
        _titleField = [[DZQTextField alloc] initWithFrame:CGRectMake(kMargin15, 0, self.width-kMargin30, kToolBarHeight)];
        _titleField.layer.borderWidth = 0.5;
        _titleField.font = KBoldFont(14);
        _titleField.layer.borderColor = KLightGray_Color.CGColor;
        [_titleField placeQHolder:@"来一个吸引人的标题吧" color:KGray_Color font:KFont(15)];
    }
    return _titleField;
}

-(DZEditTextView *)contentField{
    if (!_contentField) {
        _contentField = [[DZEditTextView alloc] initWithFrame:CGRectMake(kMargin15, self.titleField.bottom+kMargin5, self.width-kMargin30, 300)];
        _contentField.layer.borderWidth = 0.5;
        _contentField.font = KFont(14);
        _contentField.layer.borderColor = KLightGray_Color.CGColor;
        [_contentField placeTextHolder:@"来喽，剩下的就该你编故事喽......" color:KGray_Color font:KFont(15)];
    }
    return _contentField;
}

-(UIButton *)categoryButton{
    if (!_categoryButton) {
        _categoryButton = [[UIButton alloc] initWithFrame:CGRectMake(kMargin15, self.contentField.bottom + kMargin10, 0, 0)];
        [_categoryButton layoutItemButtonWithTitle:@"选择分类" titleH:@"选择分类" image:@"dz_list_cate" imageH:@"dz_list_cate_h" imageTitleSpace:3];
    }
    return _categoryButton;
}

-(UIButton *)locationButton{
    if (!_locationButton) {
        _locationButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentField.right - 100, self.contentField.bottom + kMargin10, 0, 16)];
        [_locationButton layoutItemButtonWithTitle:@"手动定位" titleH:@"手动定位" image:@"dz_list_location" imageH:@"dz_list_location_h" imageTitleSpace:3];
        _locationButton.right = self.contentField.right;
    }
    return _locationButton;
}


-(DZAttachGridView *)mediaAttach{
    if (!_mediaAttach) {
        DZGridFlowLayout *layout = [[DZGridFlowLayout alloc] initWithWidth:self.width-kMargin30 WHScale:1.0];
        _mediaAttach = [[DZAttachGridView alloc] initWithFrame:CGRectMake(kMargin15, self.categoryButton.bottom + kMargin10, self.contentField.width, (self.height-kMargin10) - self.categoryButton.bottom) collectionViewLayout:layout];
    }
    return _mediaAttach;
}






@end
