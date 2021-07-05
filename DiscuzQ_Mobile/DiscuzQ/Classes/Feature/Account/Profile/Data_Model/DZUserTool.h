//
//  DZUserTool.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZUserTool : NSObject

+(NSArray<DZQDataFollow *>*)User_dataFollowResData:(DZQResV1 *)resModel;

+(NSArray<DZQDataCashLog *>*)User_dataCashLogResData:(DZQResV1 *)resModel;





@end

NS_ASSUME_NONNULL_END
