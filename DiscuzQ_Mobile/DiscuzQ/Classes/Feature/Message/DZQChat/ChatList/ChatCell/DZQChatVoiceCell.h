//
//  DZQChatVoiceCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatBaseCell.h"
#import "DZQAudioPlayer.h"

@interface DZQChatVoiceCell : DZQChatBaseCell<DZQAudioPlayerDelegate>

@property (nonatomic, strong) UIView *voiceBackView;
@property (nonatomic, strong) UILabel *mTimeLab;
@property (nonatomic, strong) UIImageView *mVoiceImg;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;

//是否在播放
@property (nonatomic, assign)BOOL contentVoiceIsPlaying;

//音频路径 音频文件 播放控制
@property(nonatomic, strong)NSString *voiceURL;
@property(nonatomic, strong)NSData *songData;
@property(nonatomic, strong)DZQAudioPlayer *audio;

@end


