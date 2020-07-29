//
//  DZCheckModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/9.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZCheckModel : NSObject

@property (nonatomic, copy) NSString *discuzversion;  //!< 属性注释
@property (nonatomic, copy) NSString *charset;  //!< 属性注释
@property (nonatomic, copy) NSString *version;  //!< 属性注释
@property (nonatomic, copy) NSString *pluginversion;  //!< 属性注释
@property (nonatomic, copy) NSString *regname;  //!< 属性注释
@property (nonatomic, copy) NSString *sitename;  //!< 属性注释
@property (nonatomic, copy) NSString *ucenterurl;  //!< 属性注释
@property (nonatomic, copy) NSString *totalthreads;  //!< 属性注释
@property (nonatomic, copy) NSString *totalposts;  //!< 属性注释
@property (nonatomic, copy) NSString *totalforums;  //!< 属性注释
@property (nonatomic, copy) NSString *totalmembers;  //!< 属性注释
@property (nonatomic, copy) NSString *formhash;  //!< 属性注释
@property (nonatomic, copy) NSDictionary *setting;  //!< 属性注释

@end

