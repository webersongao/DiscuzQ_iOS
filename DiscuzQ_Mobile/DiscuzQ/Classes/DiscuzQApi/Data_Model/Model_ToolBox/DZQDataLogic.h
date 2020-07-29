//
//  DZQDataLogic.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQResModel.h"
#import "DZQMaper.h"

@interface DZQDataLogic : NSObject

@property (nonatomic, strong) DZQMaper *Maper;  //!< 属性注释

/*
 *  清除缓存信息
 */
- (void)cleanCacheWithBlock:(void (^)(void))completion;


-(NSDictionary *)loadResponseDataWithUrl:(NSString *)urlString;

-(void)saveResponseDataWithUrl:(NSString *)urlString resData:(NSDictionary *)resData;

-(void)resModelWithJSON:(id)json urlCtrl:(NSString *)urlCtrl completion:(void (^)(DZQResModel *resModel))completion;


@end


