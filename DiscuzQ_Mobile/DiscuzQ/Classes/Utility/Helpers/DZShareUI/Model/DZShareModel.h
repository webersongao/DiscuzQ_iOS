//
//  DZShareModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2016/12/22.
//
//

#import <Foundation/Foundation.h>

@interface DZShareModel : NSObject

@property (nonatomic, copy) NSString *url;  //!< 分享地址
@property (nonatomic, copy) NSString *desc;  //!< 描述
@property (nonatomic, copy) NSString *icon;  //!< 分享图片地址
@property (nonatomic, copy) NSString *title;  //!< 分享内容标题
@property (nonatomic, copy)NSString *originIcon; //!< 原始图片地址
@property (nonatomic, strong) NSDictionary *platContents;  //!< 平台内容


@end

