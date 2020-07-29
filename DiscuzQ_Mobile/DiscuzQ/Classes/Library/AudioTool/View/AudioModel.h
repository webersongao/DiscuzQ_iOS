//
//  AudioModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2017/6/8.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioModel : NSObject

@property (nonatomic, copy) NSString *audioUploadId;
@property (nonatomic, strong) NSURL *recordFileUrl;
@property (nonatomic, strong) NSURL *mp3Url;
@property (nonatomic, assign) NSInteger time;

- (instancetype)initAudioWithId:(NSString *)uploadId andMp3Url:(NSURL *)mp3Url;

+ (instancetype)audioWithId:(NSString *)uploadId andMp3Url:(NSURL *)mp3Url;

@end
