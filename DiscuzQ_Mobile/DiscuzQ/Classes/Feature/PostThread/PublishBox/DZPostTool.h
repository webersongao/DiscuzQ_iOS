//
//  DZPostTool.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZPostTool : NSObject

+(BOOL)isDraftCanPublish:(DZThreadDraftM *)localDraft;



+(void)publishLocalThread:(DZThreadDraftM *)draft captcha:(NSDictionary *)captcha completion:(void (^)(DZQDataUser *varModel, BOOL success))completion failure:(void (^)(DZQErrorV1 * error))failure;


@end

NS_ASSUME_NONNULL_END
