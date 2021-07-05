//
//  DZShareModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2016/12/22.
//
//

#import <Foundation/Foundation.h>

@interface DZShareModel : NSObject

@property (nonatomic, copy) NSString *title;  //!< 分享内容标题
@property (nonatomic, copy) NSString *iconPath;  //!< 分享图片地址
@property (nonatomic, copy) NSString *urlString;  //!< 分享地址
@property (nonatomic, copy) NSString *descString;  //!< 描述


+ (instancetype)shareWithThread:(DZQDataThread *)thread;


@end

