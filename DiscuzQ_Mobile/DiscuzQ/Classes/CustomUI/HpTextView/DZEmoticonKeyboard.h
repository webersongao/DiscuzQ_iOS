//
//  DZEmoticonKeyboard.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/11/28.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZTextbarView.h"
#import "DZAttachmentBar.h"

#define BShowTime 0.25

typedef void(^EmoticonSendBlock)(void);
typedef void(^EmoticonShowBlock)(CGFloat height);
typedef void(^TextChangeBlock)(CGFloat eveheight, CGFloat height);
typedef void(^KeyboardShowBlock)(void);
typedef void(^KeyboardHideBlock)(void);

@interface DZEmoticonKeyboard : UIView<UIScrollViewDelegate>


@property (nonatomic, assign) BOOL imageboaudIsShow;

@property (nonatomic, strong) NSMutableArray *faceArray;    // 图片表情plist中的数组
@property (nonatomic, strong) NSMutableArray *imageNameArr; // 图片名字数组
@property (nonatomic, strong) UIView * imagebuttonView;  // 酷猴 呆呆男等表情切换栏
@property (nonatomic, strong) DZTextbarView *textBarView;
//@property (nonatomic, strong) UploadAttachView *uploadView;

@property (nonatomic, strong) DZAttachmentBar *attachmentBar;

@property (nonatomic, assign) CGFloat ChangeHeight;

@property (nonatomic, copy) KeyboardShowBlock keyboardShowBlock;
@property (nonatomic, copy) KeyboardHideBlock keyboardHideBlock;

@property (nonatomic, copy) EmoticonSendBlock sendBlock;
@property (nonatomic, copy) EmoticonShowBlock showBlock;
@property (nonatomic, copy) TextChangeBlock changeBlock;

- (void)hideCustomerKeyBoard;
- (void)clearData;
@end
