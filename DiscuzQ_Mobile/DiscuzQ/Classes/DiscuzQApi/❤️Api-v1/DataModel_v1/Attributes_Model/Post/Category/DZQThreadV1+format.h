//
//  DZQThreadV1+format.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQThreadV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQThreadV1 (format)

@end


@interface DZQDataThread (format)

-(NSString *)shareTitle;
-(NSString *)shareContent;
-(NSString *)shareImagePath;
-(NSString *)shareUrlString;

@end

NS_ASSUME_NONNULL_END
