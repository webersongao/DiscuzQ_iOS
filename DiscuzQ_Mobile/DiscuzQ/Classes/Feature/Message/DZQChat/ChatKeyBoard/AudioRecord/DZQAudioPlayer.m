//
//  DZQAudioPlayer.m
//  BloodSugarForDoc
//
//  Created by shake on 14-9-1.
//  Copyright (c) 2014年 shake. All rights reserved.
//

#import "DZQAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>


@interface DZQAudioPlayer ()<AVAudioPlayerDelegate>

@end

@implementation DZQAudioPlayer

+ (DZQAudioPlayer *)Shared
{
    static DZQAudioPlayer *Shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Shared = [[self alloc] init];
    });
    return Shared;
}

- (void)playSongWithUrl:(NSString *)songUrl
{
    dispatch_async(dispatch_queue_create("playSoundFromUrl", NULL), ^{
        [self.delegate DZQAudioPlayerBeiginLoadVoice];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:songUrl]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self playSoundWithData:data];
        });
    });
}

- (void)playSongWithData:(NSData *)songData
{
    [self setupPlaySound];
    [self playSoundWithData:songData];
}

- (void)playSoundWithData:(NSData *)soundData
{
    if (_player) {
        [_player stop];
        _player.delegate = nil;
        _player = nil;
    }
    NSError *playerError;
    _player = [[AVAudioPlayer alloc]initWithData:soundData error:&playerError];
    _player.volume = 1.0f;
    if (_player == nil){
        KSLog(@"ERror creating player: %@", [playerError description]);
    }
    _player.delegate = self;
    [_player play];
    [self.delegate DZQAudioPlayerBeiginPlay];
}

-(void)setupPlaySound
{
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
}

- (void)stopSound{
	if (_player.isPlaying) {
		[_player stop];
	}
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	[self.delegate DZQAudioPlayerDidFinishPlay];
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self.delegate DZQAudioPlayerDidFinishPlay];
}

@end
