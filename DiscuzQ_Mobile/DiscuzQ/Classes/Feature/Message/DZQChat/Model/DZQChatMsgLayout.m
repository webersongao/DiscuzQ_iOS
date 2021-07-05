//
//  DZQChatMsgLayout.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatMsgLayout.h"

@implementation DZQChatMsgLayout

//根据模型返回布局
-(instancetype)initWithMsg:(DZQChatMessage *)message{
    if(self = [super init]){
        self.message = message;
    }
    return self;
}

-(void)setMessage:(DZQChatMessage *)message{
    _message = message;
    
    switch (_message.messageType) {
            
        case DZQChatMsgTypeText:
            [self setText];
            break;
        case DZQChatMsgTypeImage:
        case DZQChatMsgTypeGif:
            [self setImage];
            break;
        case DZQChatMsgTypeVoice:
            [self setVoice];
            break;
        case DZQChatMsgTypeMap:
            [self setMap];
            break;
        case DZQChatMsgTypeVideo:
            [self config_innerVideo];
            break;
        case DZQChatMsgTypeThread:
//            [self config_innerThread];
            break;
        case DZQChatMsgTypeUndo:
            [self setRecallMessage];
            break;
        case DZQChatMsgTypeDelete:
            [self setRemoveMessage];
            break;
        default:
            break;
    }
}


//显示文字消息 这个自适应计算有误差 用sizeToFit就比较完美 有好办法告诉我
-(void)setText{
    
    _textLabRect = [NSObject getRectWith:_message.attTextString width:DZQChatTextInitWidth];
    
    CGFloat textWidth  = _textLabRect.size.width;
    CGFloat textHeight = _textLabRect.size.height;
    
    if(_message.messageFrom == DZQChatMsgFromOther){
        _headerImgRect = CGRectMake(DZQChatIconLeft,DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
        _backImgButtonRect = CGRectMake(DZQChatIconLeft+DZQChatIconWH+DZQChatIconRight, self.headerImgRect.origin.y, textWidth+DZQChatTextLRB+DZQChatTextLRS, textHeight+DZQChatTextTop+DZQChatTextBottom);
        
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRB, DZQChatAirBottom, DZQChatAirLRS);
        
        _textLabRect.origin.x = DZQChatTextLRB;
        _textLabRect.origin.y = DZQChatTextTop;
        
    }else{
        _headerImgRect = CGRectMake(DZQChatIcon_RX, DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
        _backImgButtonRect = CGRectMake(DZQChatIcon_RX-DZQChatDetailRight-DZQChatTextLRB-textWidth-DZQChatTextLRS, self.headerImgRect.origin.y, textWidth+DZQChatTextLRB+DZQChatTextLRS, textHeight+DZQChatTextTop+DZQChatTextBottom);
        
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRS, DZQChatAirBottom, DZQChatAirLRB);
        
        _textLabRect.origin.x = DZQChatTextLRS;
        _textLabRect.origin.y = DZQChatTextTop;
    }
    
    
    //判断时间是否显示
    _timeLabRect = CGRectMake(0, 0, 0, 0);
    
    if(_message.showTime==YES){

       [self getTimeLabRect];
        
        CGRect hRect = self.headerImgRect;
        hRect.origin.y = DZQChatTimeTop+DZQChatTimeBottom+DZQChatTimeHeight;
        self.headerImgRect = hRect;
        
        _backImgButtonRect = CGRectMake(_backImgButtonRect.origin.x, _headerImgRect.origin.y, _backImgButtonRect.size.width, _backImgButtonRect.size.height);
    }
    
    _cellHeight = _backImgButtonRect.size.height + _backImgButtonRect.origin.y + DZQChatCellBottom;
    
}


-(void)setImage{
    
    UIImage *image = _message.image;
    CGFloat imgWidth  = CGImageGetWidth(image.CGImage);
    CGFloat imgHeight = CGImageGetHeight(image.CGImage);
    CGFloat imgActualHeight = DZQChatImageMaxSize;
    CGFloat imgActualWidth =  DZQChatImageMaxSize * imgWidth/imgHeight;
    
    _message.contentMode =  UIViewContentModeScaleAspectFit;

    if(imgActualWidth>DZQChatImageMaxSize){
        imgActualWidth = DZQChatImageMaxSize;
        imgActualHeight = imgActualWidth * imgHeight/imgWidth;
    }
    if(imgActualWidth<DZQChatImageMaxSize*0.25){
        imgActualWidth = DZQChatImageMaxSize * 0.25;
        imgActualHeight = DZQChatImageMaxSize * 0.8;
        _message.contentMode =  UIViewContentModeScaleAspectFill;
    }
    
    if(_message.messageFrom == DZQChatMsgFromOther){
        _headerImgRect = CGRectMake(DZQChatIconLeft,DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
        _backImgButtonRect = CGRectMake(DZQChatIconLeft+DZQChatIconWH+DZQChatIconRight, self.headerImgRect.origin.y, imgActualWidth, imgActualHeight);
        
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRB, DZQChatAirBottom, DZQChatAirLRS);
        
    }else{
        _headerImgRect = CGRectMake(DZQChatIcon_RX, DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
        _backImgButtonRect = CGRectMake(DZQChatIcon_RX-DZQChatDetailRight-imgActualWidth, self.headerImgRect.origin.y, imgActualWidth, imgActualHeight);
        
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRS, DZQChatAirBottom, DZQChatAirLRB);
    }
    
    //判断时间是否显示
    _timeLabRect = CGRectMake(0, 0, 0, 0);
    
    if(_message.showTime==YES){
        
       [self getTimeLabRect];
        
        CGRect hRect = self.headerImgRect;
        hRect.origin.y = DZQChatTimeTop+DZQChatTimeBottom+DZQChatTimeHeight;
        self.headerImgRect = hRect;
        
        _backImgButtonRect = CGRectMake(_backImgButtonRect.origin.x, _headerImgRect.origin.y, _backImgButtonRect.size.width, _backImgButtonRect.size.height);
    }
    
    _cellHeight = _backImgButtonRect.size.height + _backImgButtonRect.origin.y + DZQChatCellBottom;
    
}


-(void)setVoice{
    
    //计算时间
    CGRect rect = [NSObject getRectWith:_message.voiceTime width:150 font:[UIFont systemFontOfSize:DZQChatVoiceTimeFont] spacing:0 Row:0];
    CGFloat timeWidth  = rect.size.width;
    CGFloat timeHeight = rect.size.height;
    
    //根据时间设置按钮实际长度
    CGFloat timeLength = DZQChatVoiceMaxWidth - DZQChatVoiceMinWidth;
    CGFloat changeLength = timeLength/60;
    CGFloat currentLength = changeLength*_message.voiceDuration+DZQChatVoiceMinWidth;
    
    if(_message.messageFrom == DZQChatMsgFromOther){
        
        _headerImgRect = CGRectMake(DZQChatIcon_RX, DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
        _backImgButtonRect = CGRectMake(DZQChatIconLeft+DZQChatIconWH+DZQChatIconRight, self.headerImgRect.origin.y, currentLength, DZQChatVoiceHeight);
        
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRB, DZQChatAirBottom, DZQChatAirLRS);

        _voiceTimeLabRect = CGRectMake(_backImgButtonRect.size.width-timeWidth-10, (_backImgButtonRect.size.height-timeHeight)/2, timeWidth, timeHeight);
        
        _voiceImgRect = CGRectMake(20, (_backImgButtonRect.size.height-DZQChatVoiceImgSize)/2, DZQChatVoiceImgSize, DZQChatVoiceImgSize);
        
    }else{
        
        _headerImgRect = CGRectMake(DZQChatIcon_RX, DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        _backImgButtonRect = CGRectMake(DZQChatIcon_RX-DZQChatDetailRight-currentLength, self.headerImgRect.origin.y, currentLength, DZQChatVoiceHeight);
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRS, DZQChatAirBottom, DZQChatAirLRB);
        
        _voiceTimeLabRect = CGRectMake(10, (_backImgButtonRect.size.height-timeHeight)/2, timeWidth, timeHeight);
        
        _voiceImgRect = CGRectMake(_backImgButtonRect.size.width-DZQChatVoiceImgSize-20, (_backImgButtonRect.size.height-DZQChatVoiceImgSize)/2, DZQChatVoiceImgSize, DZQChatVoiceImgSize);
    }
    
    //判断时间是否显示
    _timeLabRect = CGRectMake(0, 0, 0, 0);
    
    if(_message.showTime==YES){
        
       [self getTimeLabRect];
        
        CGRect hRect = self.headerImgRect;
        hRect.origin.y = DZQChatTimeTop+DZQChatTimeBottom+DZQChatTimeHeight;
        self.headerImgRect = hRect;
        
        _backImgButtonRect = CGRectMake(_backImgButtonRect.origin.x, _headerImgRect.origin.y, _backImgButtonRect.size.width, _backImgButtonRect.size.height);
    }
    
    _cellHeight = _backImgButtonRect.size.height + _backImgButtonRect.origin.y + DZQChatCellBottom;
    
}


-(void)setMap{
    
    if(_message.messageFrom == DZQChatMsgFromOther){
        _headerImgRect = CGRectMake(DZQChatIconLeft,DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
        _backImgButtonRect = CGRectMake(DZQChatIconLeft+DZQChatIconWH+DZQChatIconRight, self.headerImgRect.origin.y, DZQChatMapWidth, DZQChatMapHeight);
        
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRB, DZQChatAirBottom, DZQChatAirLRS);
        
        
    }else{
        _headerImgRect = CGRectMake(DZQChatIcon_RX, DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
        _backImgButtonRect = CGRectMake(DZQChatIcon_RX-DZQChatDetailRight-DZQChatMapWidth, self.headerImgRect.origin.y, DZQChatMapWidth, DZQChatMapHeight);
        
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRS, DZQChatAirBottom, DZQChatAirLRB);
        
    }
    
    //判断时间是否显示
    _timeLabRect = CGRectMake(0, 0, 0, 0);
    
    if(_message.showTime==YES){
        
        [self getTimeLabRect];
        
        CGRect hRect = self.headerImgRect;
        hRect.origin.y = DZQChatTimeTop+DZQChatTimeBottom+DZQChatTimeHeight;
        self.headerImgRect = hRect;
        
        _backImgButtonRect = CGRectMake(_backImgButtonRect.origin.x, _headerImgRect.origin.y, _backImgButtonRect.size.width, _backImgButtonRect.size.height);
    }
    
    _cellHeight = _backImgButtonRect.size.height + _backImgButtonRect.origin.y + DZQChatCellBottom;
    
}

//短视频
-(void)config_innerVideo{
    
    CGFloat imgWidth  = CGImageGetWidth(_message.videoImage.CGImage);
    CGFloat imgHeight = CGImageGetHeight(_message.videoImage.CGImage);
    CGFloat imgActualHeight = DZQChatImageMaxSize;
    CGFloat imgActualWidth =  DZQChatImageMaxSize * imgWidth/imgHeight;
    
    if(imgActualWidth>DZQChatImageMaxSize){
        imgActualWidth = DZQChatImageMaxSize;
        imgActualHeight = imgActualWidth * imgHeight/imgWidth;
    }
    
    if(_message.messageFrom == DZQChatMsgFromOther){
        _headerImgRect = CGRectMake(DZQChatIconLeft,DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
         _backImgButtonRect = CGRectMake(DZQChatIconLeft+DZQChatIconWH+DZQChatIconRight, self.headerImgRect.origin.y, imgActualHeight, imgActualWidth);
  
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRB, DZQChatAirBottom, DZQChatAirLRS);
        
    }else{
        _headerImgRect = CGRectMake(DZQChatIcon_RX, DZQChatCellTop, DZQChatIconWH, DZQChatIconWH);
        
        _backImgButtonRect = CGRectMake(DZQChatIcon_RX-DZQChatDetailRight-imgActualWidth, self.headerImgRect.origin.y, imgActualWidth, imgActualHeight);
        
        _imageInsets = UIEdgeInsetsMake(DZQChatAirTop, DZQChatAirLRS, DZQChatAirBottom, DZQChatAirLRB);
    }
    
    //判断时间是否显示
    _timeLabRect = CGRectMake(0, 0, 0, 0);
    
    if(_message.showTime==YES){
        [self getTimeLabRect];
        CGRect hRect = self.headerImgRect;
        hRect.origin.y = DZQChatTimeTop+DZQChatTimeBottom+DZQChatTimeHeight;
        self.headerImgRect = hRect;
        
        _backImgButtonRect = CGRectMake(_backImgButtonRect.origin.x, _headerImgRect.origin.y, _backImgButtonRect.size.width, _backImgButtonRect.size.height);
    }
    
    _cellHeight = _backImgButtonRect.size.height + _backImgButtonRect.origin.y + DZQChatCellBottom;
    
}

-(void)config_innerThread{
    
}


//撤销的消息
-(void)setRecallMessage{
    
    
}


//删除的消息
-(void)setRemoveMessage{
       
}




//获取时间的frame值
-(void)getTimeLabRect{
    CGRect timeRect = [NSObject getRectWith:_message.messageTime width:DZQChatTimeWidth font:[UIFont systemFontOfSize:DZQChatTimeFont] spacing:0 Row:0];
    CGFloat timeWidth = timeRect.size.width+20;
    _timeLabRect = CGRectMake((kScreenWidth - timeWidth)/2, DZQChatTimeTop, timeWidth, DZQChatTimeHeight);
}


@end
