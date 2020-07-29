//
//  DZSiriTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/14.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum MPEG_mode_e {
  SiriError = 0,
  SiriNormal,
} SiriStatus;

@interface DZSiriTool : NSObject

+(instancetype)sharedTool;

/// 开启 现说现译
- (void)stardSpeechRecognizer:(void (^)(void))StatusBlock endBlock:(void (^)(NSString * String,BOOL isFinal))endBlock;

- (void)cancelSpeechRecognizer:(void (^)(void))StatusBlock;






@end


