//
//  DZWebCodeView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/11.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScaleView.h"
#import <WebKit/WebKit.h>

@interface DZVerifyResultModel : NSObject

@property (nonatomic, copy) NSString *appid;
@property (nonatomic, copy) NSString *randstr;  // 随机字符串
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, copy) NSString *ticket; /// 获取的凭证

@end

typedef void(^DZVerifyBlock)(DZVerifyResultModel *verModel);

@interface DZWebCodeView : DZScaleView<WKNavigationDelegate, WKScriptMessageHandler>

- (void)loadTXCaptchaWithSizeBlock:(backSizeBlock)sizeBlock Completion:(DZVerifyBlock)completion disMiss:(backNoneBlock)dismissBlock;

@end
