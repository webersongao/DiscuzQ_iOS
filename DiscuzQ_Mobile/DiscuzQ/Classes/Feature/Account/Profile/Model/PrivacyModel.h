//
//  PrivacyModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserFeedModel : NSObject

//"feed": {
//       "doing": "1",
//       "blog": "1",
//       "upload": "1",
//       "poll": "1",
//       "newthread": "1"
//   },
@property (nonatomic, copy) NSString *doing;  //!< 属性注释
@property (nonatomic, copy) NSString *blog;  //!< 属性注释
@property (nonatomic, copy) NSString *upload;  //!< 属性注释
@property (nonatomic, copy) NSString *poll;  //!< 属性注释
@property (nonatomic, copy) NSString *newthread;  //!< 属性注释

@end

@interface UserViewModel : NSObject
//"view": {
//       "index": "0",
//       "friend": "0",
//       "wall": "0",
//       "home": "0",
//       "doing": "0",
//       "blog": "0",
//       "album": "0",
//       "share": "0"
//   },
@property (nonatomic, copy) NSString *index;  //!< 属性注释
@property (nonatomic, copy) NSString *friendNum;  //!< 属性注释
@property (nonatomic, copy) NSString *wall;  //!< 属性注释
@property (nonatomic, copy) NSString *home;  //!< 属性注释
@property (nonatomic, copy) NSString *doing;  //!< 属性注释
@property (nonatomic, copy) NSString *blog;  //!< 属性注释
@property (nonatomic, copy) NSString *album;  //!< 属性注释
@property (nonatomic, copy) NSString *share;  //!< 属性注释

@end

@interface DZProfileModel : NSObject

//"profile": {
//    "field1": "0"
//}
@property (nonatomic, copy) NSString *field1;  //!< 属性注释
@property (nonatomic, copy) NSString *field2;  //!< 属性注释
@property (nonatomic, copy) NSString *field3;  //!< 属性注释
@property (nonatomic, copy) NSString *field4;  //!< 属性注释
@property (nonatomic, copy) NSString *field5;  //!< 属性注释
@property (nonatomic, copy) NSString *field6;  //!< 属性注释
@property (nonatomic, copy) NSString *field7;  //!< 属性注释
@property (nonatomic, copy) NSString *field8;  //!< 属性注释

@end


@interface PrivacyModel : NSObject

//"privacy": {
//"feed": {5 items},
//"view": {8 items},
//"profile": {1 item}
//},

@property (nonatomic, strong) UserFeedModel *feed;  //!< 属性注释
@property (nonatomic, strong) UserViewModel *view;  //!< 属性注释
@property (nonatomic, strong) DZProfileModel *profile;  //!< 属性注释


@end


