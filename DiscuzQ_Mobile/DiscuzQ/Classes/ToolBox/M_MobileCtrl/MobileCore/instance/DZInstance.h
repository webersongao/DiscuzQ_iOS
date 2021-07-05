//
//  DZInstance.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  存放各种单例属性

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZInstance : NSObject

@property (nonatomic, strong, readonly) DZQSiteV1 *siteModel;  //!< 站点信息
@property (nonatomic, strong, readonly) NSDateFormatter *dateFormatter;  //!< 属性注释
@property (nonatomic, strong, readonly) NSArray<DZThreadCateM *> *cateModelArray;  //!< 主题分类



-(void)saveSiteModel:(DZQSiteV1 *)siteModel;

-(void)saveThreadCateArray:(NSArray<DZThreadCateM *> *)cateArray;








@end

NS_ASSUME_NONNULL_END
