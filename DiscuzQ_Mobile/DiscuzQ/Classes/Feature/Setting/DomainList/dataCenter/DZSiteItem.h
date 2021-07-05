//
//  DZSiteItem.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZSiteItem : NSObject

@property (nonatomic, copy, readonly) NSString *siteName;  //!< 属性注释
@property (nonatomic, copy, readonly) NSString *siteUrlString;  //!< 属性注释
@property (nonatomic, copy, readonly) NSString *siteDescription;  //!< 属性注释
@property (nonatomic, copy, readonly) NSString *siteIcon;  //!< 属性注释

+ (instancetype)siteName:(NSString *)name url:(NSString *)url desc:(NSString *)desc;


@end

NS_ASSUME_NONNULL_END
