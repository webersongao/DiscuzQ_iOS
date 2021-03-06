//
//  DZQChatVoiceCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatVoiceCell.h"

@implementation DZQChatVoiceCell


-(void)config_ChatCellUserInterface{
    
    [super config_ChatCellUserInterface];
    
    
    _voiceBackView = [[UIView alloc]init];
    [self.mBackImgButton addSubview:self.voiceBackView];
    _voiceBackView.userInteractionEnabled = YES;
    _voiceBackView.backgroundColor = [UIColor clearColor];
    
    
    _mTimeLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
    _mTimeLab.textAlignment = NSTextAlignmentCenter;
    _mTimeLab.font = [UIFont systemFontOfSize:DZQChatVoiceTimeFont];
    _mTimeLab.userInteractionEnabled = YES;
    _mTimeLab.backgroundColor = [UIColor clearColor];

    
    _mVoiceImg = [[UIImageView alloc]initWithFrame:CGRectMake(80, 5, 20, 20)];
    _mVoiceImg.userInteractionEnabled = YES;
    _mVoiceImg.animationDuration = 1;
    _mVoiceImg.animationRepeatCount = 0;
    _mVoiceImg.backgroundColor = [UIColor clearColor];
    
    
    _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.indicator.center=CGPointMake(80, 15);
    
    
    [_voiceBackView addSubview:_indicator];
    [_voiceBackView addSubview:_mVoiceImg];
    [_voiceBackView addSubview:_mTimeLab];
    
    
    //整个列表只能有一个语音处于播放状态 通知其他正在播放的语音停止
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DZQAudioPlayerDidFinishPlay) name:@"VoicePlayHasInterrupt" object:nil];
    
    //红外线感应监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sensorStateChange:)
                                                 name:UIDeviceProximityStateDidChangeNotification
                                               object:nil];
}


-(void)updateChatCell:(DZQChatMsgLayout *)layout indexPath:(NSIndexPath *)indexPath delegate:(id)delegate{
    [super updateChatCell:layout indexPath:indexPath delegate:delegate];
    
    UIImage *image = [UIImage imageNamed:layout.message.backImgString];
    image = [image resizableImageWithCapInsets:layout.imageInsets resizingMode:UIImageResizingModeStretch];
    
    self.mBackImgButton.frame = layout.backImgButtonRect;
    [self.mBackImgButton setBackgroundImage:image forState:UIControlStateNormal];
    
    
    _mVoiceImg.image = layout.message.voiceImg;
    _mVoiceImg.animationImages = layout.message.voiceImgs;
    _mVoiceImg.frame = layout.voiceImgRect;
    
    
    _mTimeLab.text = layout.message.voiceTime;
    _mTimeLab.frame = layout.voiceTimeLabRect;
    
}


//播放音频 暂停音频
-(void)buttonPressed:(UIButton *)sender{
    if(!_contentVoiceIsPlaying){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"VoicePlayHasInterrupt" object:nil];
        _contentVoiceIsPlaying = YES;
        [_mVoiceImg startAnimating];
        _audio = [DZQAudioPlayer Shared];
        _audio.delegate = self;
        [_audio playSongWithData:self.layout.message.voice];
    }else{
        [self DZQAudioPlayerDidFinishPlay];
    }
}

//播放显示开始加载
- (void)DZQAudioPlayerBeiginLoadVoice{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.indicator startAnimating];
    });
}

//开启红外线感应
- (void)DZQAudioPlayerBeiginPlay{
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    [self.indicator stopAnimating];
    
}

//关闭红外线感应
- (void)DZQAudioPlayerDidFinishPlay{
    [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
    _contentVoiceIsPlaying = NO;
    [_mVoiceImg stopAnimating];
    [[DZQAudioPlayer Shared] stopSound];
}

//处理监听触发事件
-(void)sensorStateChange:(NSNotificationCenter *)notification{
    if ([[UIDevice currentDevice] proximityState] == YES){
        KSLog(@"Device is close to user");
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    }
    else{
        KSLog(@"Device is not close to user");
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}



@end
