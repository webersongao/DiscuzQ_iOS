//
//  DZQDataLogic+Convert_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDataLogic.h"
#import "DZQResV3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQDataLogic (Convert_V3)

-(DZQResV3 *)revert_innerV3ResConvertWithJSON:(id)json dataClass:(Class)dataClass;


@end

NS_ASSUME_NONNULL_END
