//
//  oldMsgReplyModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2017/6/12.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface oldMsgReplyModel : NSObject

@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *auther;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *dateline;

@end
