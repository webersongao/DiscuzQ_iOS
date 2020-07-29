//
//  DZThreadProperty.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/28.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZThreadTypeModel : NSObject

@property (nonatomic, copy) NSString *fid;
@property (nonatomic, copy) NSString *typeId;
@property (nonatomic, copy) NSString *name;

@end

@interface DZThreadPermModel : NSObject

@property (nonatomic, copy) NSString *allowpost;  //!< 属性注释
@property (nonatomic, copy) NSString *allowreply;  //!< 属性注释
@property (nonatomic, copy) NSString *uploadhash;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *allowupload;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *attachremain;  //!< 属性注释

@end

@interface DZThreadTypesModel : NSObject

@property (nonatomic, copy) NSString *status;  //!< 属性注释
@property (nonatomic, copy) NSString *required;  //!< 属性注释
@property (nonatomic, copy) NSString *listable;  //!< 属性注释
@property (nonatomic, copy) NSString *prefix;  //!< 属性注释

@property (nonatomic, strong) NSDictionary *types;  //!< 属性注释


@end

@interface DZActivitySetModel : NSObject

@property (nonatomic, strong) NSArray *activitytype;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *activityfield;  //!< 属性注释

@end

