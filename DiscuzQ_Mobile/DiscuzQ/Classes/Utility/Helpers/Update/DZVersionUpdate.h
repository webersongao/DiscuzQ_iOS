//
//  DZVersionUpdate.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/11/29.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DZVersionUpdate : NSObject


/**
 比较版本号

 @param tipUpdate 提示更新回调
 */
+ (void)compareUpdate:(void(^)(NSString *newVersion, NSString *releaseNotes))tipUpdate;





@end


