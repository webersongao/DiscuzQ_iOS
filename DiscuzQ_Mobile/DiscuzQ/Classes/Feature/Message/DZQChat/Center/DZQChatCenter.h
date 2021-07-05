//
//  DZQChatCenter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DZQChatMsgLayout;

@interface DZQChatCenter : NSObject

+(void)pushToChatMapController:(DZQChatMsgLayout *)layout;

+(void)pushToChatLocationCtrl:(backDictionaryBlock)block;


@end

NS_ASSUME_NONNULL_END
