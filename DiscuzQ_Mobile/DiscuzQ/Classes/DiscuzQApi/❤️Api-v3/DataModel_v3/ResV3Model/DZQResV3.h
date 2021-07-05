//
//  DZQResV3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQOriginResV3.h"
#import "DZQBaseRes.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQBodyV3 : NSObject

@end

@interface DZQResV3 : DZQBaseRes

@property (nonatomic, assign, readonly) NSInteger resCode;  //!< 属性注释

@property (nonatomic, copy, readonly) NSString *resMessage;  //!< 属性注释

@property (nonatomic, strong, readonly) NSArray<DZQBodyV3 *> *resData;  //!< 属性注释

@property (nonatomic, copy, readonly) NSString *resRequestId;  //!< 属性注释

@property (nonatomic, copy, readonly) NSString *resRequestTime;  //!< 属性注释

+(DZQResV3 *)revert_V3ConvertWithOriRes:(DZQOriginResV3 *)res_formartModel oriJSON:(id)json modelClass:(Class)modelClass;

+(NSArray *)three_innerV3ConvertWithJSON:(NSArray<NSDictionary *> *)resModel_data urlCtrl:(NSString *)urlCtrl dataMaper:(DZQMaper *)dataMaper;







@end

NS_ASSUME_NONNULL_END
