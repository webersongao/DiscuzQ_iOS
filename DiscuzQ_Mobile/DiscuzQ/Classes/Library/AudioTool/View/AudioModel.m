//
//  AudioModel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2017/6/8.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "AudioModel.h"

@implementation AudioModel

- (instancetype)initAudioWithId:(NSString *)uploadId andMp3Url:(NSURL *)mp3Url {
    if (self = [super init]) {
        self.audioUploadId = uploadId;
        self.mp3Url = mp3Url;
    }
    return self;
}

+ (instancetype)audioWithId:(NSString *)uploadId andMp3Url:(NSURL *)mp3Url {
    AudioModel *model = [[AudioModel alloc] initAudioWithId:uploadId andMp3Url:mp3Url];
    return model;
}

@end
