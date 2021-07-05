//
//  DZQDataLogic.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQResV1.h"
#import "DZQResV3.h"
#import "DZQMaper.h"

@interface DZQDataLogic : NSObject

@property (nonatomic, assign, readonly) NSInteger version;  //!< 属性注释
@property (nonatomic, strong, readonly) DZQMaper *Maper;  //!< 属性注释

-(void)updateLogicVersion:(NSInteger)version;

/// 清除缓存信息
- (void)cleanCacheWithBlock:(void (^)(void))completion;

-(DZQResError *)resErrorWithError:(PRError *)oriError;

-(NSDictionary *)loadResponseDataWithUrl:(NSString *)urlString;

-(void)saveResponseDataWithUrl:(NSString *)urlString response:(NSDictionary *)response;

-(void)resModelWithJSON:(id)json urlCtrl:(NSString *)urlCtrl completion:(void (^)(DZQBaseRes *resModel))completion;

-(void)resV3ModelWithJSON:(id)json dataClass:(Class)dataClass completion:(void (^)(DZQBaseRes *resModel))completion;


@end


