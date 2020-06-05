//
//  DZQNetTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQURLHeader.h"
#import "DZQDataLogic.h"

@interface DZQNetTool : NSObject

+ (instancetype)shared;


@property (nonatomic, copy,readonly) NSString *token;  //!< 用户Token
@property (nonatomic, strong,readonly) DZQDataLogic *dataLogic;  //!< 数据格式化工具
@property (nonatomic, strong) PRBaiduHttpClient *NetClient;  //!< 网络请求类

-(void)updateDZQSDkToken:(NSString *)token;

/*
 *  清除缓存信息
 */
- (void)cleanUplogicCacheWithCompletion:(void (^)(void))completion;




@end







