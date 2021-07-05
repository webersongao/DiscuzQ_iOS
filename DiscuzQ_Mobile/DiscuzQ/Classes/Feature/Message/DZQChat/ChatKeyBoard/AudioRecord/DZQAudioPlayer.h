//
//  DZQAudioPlayer.h
//  BloodSugarForDoc
//
//  Created by WebersonGao on 14-9-1.
//  Copyright (c) 2014年 shake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@protocol DZQAudioPlayerDelegate <NSObject>

- (void)DZQAudioPlayerBeiginLoadVoice;

- (void)DZQAudioPlayerBeiginPlay;

- (void)DZQAudioPlayerDidFinishPlay;

@end


@interface DZQAudioPlayer : NSObject

@property (nonatomic, strong) AVAudioPlayer *player;

@property (nonatomic, weak) id<DZQAudioPlayerDelegate> delegate;

+ (instancetype)Shared;

-(void)playSongWithUrl:(NSString *)songUrl;

-(void)playSongWithData:(NSData *)songData;

- (void)stopSound;

@end
