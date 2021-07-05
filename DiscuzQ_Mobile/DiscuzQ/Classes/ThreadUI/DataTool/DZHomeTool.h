//
//  DZHomeTool.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZHomeTool : NSObject

/// 处理 返回的主题评论数据
+(NSArray<DZQDataPost *>*)post_dataPostResData:(DZQResV1 *)resModel style:(Class)styleCls;

+(NSArray<DZQDataThread *>*)thead_dataThreadResData:(DZQResV1 *)resModel style:(Class)styleCls;

// 主题分享
+(DZQDataThread *)thead_shareDataThreadResData:(DZQResV1 *)resModel style:(Class)styleCls;

@end

