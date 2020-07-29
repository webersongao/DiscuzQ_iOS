//
//  AudioManager.h
//  audio
//
//  Created by WebersonGao on 2018/8/6.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AudioRecordView;

@interface AudioManager : NSObject

+ (void)setAudioTool:(AudioRecordView *)audioRecordView;

+ (NSMutableArray *)upLoadAudioArray;

+ (void)clearAudio;

+ (void)playWithUrl:(NSURL *)url;

+ (void)stopPlay;

@end
