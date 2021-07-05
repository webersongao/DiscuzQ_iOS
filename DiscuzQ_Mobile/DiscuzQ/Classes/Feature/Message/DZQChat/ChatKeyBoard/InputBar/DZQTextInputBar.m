//
//  DZQTextInputBar.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQTextInputBar.h"
#import "DZQChatKeyHeader.h"
#import "DZQAudioPlayer.h"
#import "DZQChatTextView.h"

@interface DZQTextInputBar ()<UITextViewDelegate,DZQRecordButtonDelegate>

@property(nonatomic,strong) DZQChatBarButton *audioButton;
@property(nonatomic,strong) DZQChatBarButton *emotionButton;
@property(nonatomic,strong) DZQChatBarButton *moreButton;
//输入框背景 输入框 缓存输入的文字
@property(nonatomic,strong) DZQRecordButton *inputButton;
@property(nonatomic,strong) DZQChatTextView *inputTextView;

//输入框的高度
@property(nonatomic,assign) CGFloat   inputTextStrH;
//当前的编辑状态（默认 语音 编辑文本 发送表情 其他功能）
@property(nonatomic,assign)DZQKeyStatus keyBoardStatus;

@end

@implementation DZQTextInputBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_TextInputBar];
        self.inputTextStrH = DZQChatTextHeight;
        [self layoutChatBarSubviews:YES];
        [self updateTextInputBarStatus:DZQKeyStatusDefault];
    }
    return self;
}

-(void)config_TextInputBar{
    [self addSubview:self.moreButton];
    [self addSubview:self.audioButton];
    [self addSubview:self.inputButton];
    [self addSubview:self.emotionButton];
    [self.inputButton addSubview:self.inputTextView];
}

-(NSString *)textString{
    NSString *message = self.inputTextView.attributedText.string;
    NSString *newMessage = [message stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return newMessage;//self.inputTextView.attributedText.string;
}

-(void)layoutChatBarSubviews:(BOOL)isInit{
    
    if (isInit) {
        self.audioButton.left = DZQChatBtnDistence;
        self.moreButton.right = self.width - DZQChatBtnDistence;
        self.inputButton.left = self.audioButton.right + DZQChatBtnDistence;
        self.emotionButton.right = self.moreButton.left - DZQChatBtnDistence;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.inputButton.height = self.inputTextView.height = self.inputTextStrH;
        [self.inputTextView.superview layoutIfNeeded];
        self.moreButton.bottom  = self.height - DZQChatBBottomDistence;
        self.inputButton.bottom = self.height - DZQChatTBottomDistence;
        self.audioButton.bottom  = self.height - DZQChatBBottomDistence;
        self.emotionButton.bottom  = self.height - DZQChatBBottomDistence;
    }];
    
}


//语音10  表情11  其他功能12
-(void)chatKeyBarBtnAction:(UIButton *)sender{
    self.currentBtn.selected = NO;
    self.currentBtn = sender;
    [[DZQAudioPlayer Shared] stopSound];
    
    switch (self.keyBoardStatus) {
            //默认在底部状态
        case DZQKeyStatusDefault:{
            if(sender.tag==10){
                // 默认 -- 语音
                [self updateTextInputBarStatus:DZQKeyStatusVoice];
                
            }else if (sender.tag==11){
                // 默认 -- 表情
                [self updateTextInputBarStatus:DZQKeyStatusSymbol];
                
            }else if (sender.tag == 12){
                // 默认 -- 其他
                [self updateTextInputBarStatus:DZQKeyStatusAdd];
            }
        }
            break;
            
            //在输入语音的状态
        case DZQKeyStatusVoice:{
            if(sender.tag == 10){
                // 语音 -- 编辑
                [self updateTextInputBarStatus:DZQKeyStatusEdit];
                
            }else if (sender.tag == 11){
                // 语音 -- 表情
                [self updateTextInputBarStatus:DZQKeyStatusSymbol];
                
            }else if (sender.tag == 12){
                // 语音 -- 其他
                [self updateTextInputBarStatus:DZQKeyStatusAdd];
            }
            [self textViewDidChange:self.inputTextView];
        }
            break;
            
            //在编辑文本的状态
        case DZQKeyStatusEdit:{
            if(sender.tag == 10){
                // 编辑 -- 语音
                [self updateTextInputBarStatus:DZQKeyStatusVoice];
                
            }else if (sender.tag == 11){
                // 编辑 -- 表情
                [self updateTextInputBarStatus:DZQKeyStatusSymbol];
                
            }else if (sender.tag == 12){
                // 编辑 -- 其他
                [self updateTextInputBarStatus:DZQKeyStatusAdd];
            }
        }
            break;
            
            //在选择表情的状态
        case DZQKeyStatusSymbol:{
            if(sender.tag == 10){
                // 表情 -- 语音
                [self updateTextInputBarStatus:DZQKeyStatusVoice];
                
            }else if (sender.tag == 11){
                // 表情 -- 编辑
                [self updateTextInputBarStatus:DZQKeyStatusEdit];
                
            }else if (sender.tag == 12){
                // 表情 -- 其他
                [self updateTextInputBarStatus:DZQKeyStatusAdd];
            }
        }
            break;
            
            //在选择其他功能的状态
        case DZQKeyStatusAdd:{
            if(sender.tag == 10){
                // 其他 -- 语音
                [self updateTextInputBarStatus:DZQKeyStatusVoice];
                
            }else if (sender.tag== 11){
                // 其他 -- 表情
                [self updateTextInputBarStatus:DZQKeyStatusSymbol];
                
            }else if (sender.tag== 12){
                // 其他 -- 其他
                if (self.inputTextView.isFirstResponder) {
                    [self.inputTextView resignFirstResponder];
                }else{
                    [self.inputTextView becomeFirstResponder];
                }
                [self updateTextInputBarStatus:DZQKeyStatusAdd];
            }
        }
            break;
            
        default:
            break;
    }
}

-(void)updateTextInputBarStatus:(DZQKeyStatus)status{
    
    self.keyBoardStatus = status;
    self.height = (self.inputTextStrH + DZQChatTMarginDefault);
    [self layoutChatBarSubviews:NO];
    
    if (self.inDelegate && [self.inDelegate respondsToSelector:@selector(DZQTextInputBarUpdateHeight:Status:)]) {
        [self.inDelegate DZQTextInputBarUpdateHeight:self.height Status:status];
    }
}


#pragma UITextViewDelegate发送按钮
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if(text.length==0){
        [[DZQChatEmotionCenter sharedCenter] deleteEmtionString:self.inputTextView];
        [self textViewDidChange:self.inputTextView];
        return YES;
    }
    
    if ([text isEqualToString:@"\n"]) {
        if (self.inDelegate && [self.inDelegate respondsToSelector:@selector(DZQTextInputBarSendText:)]) {
            [self.inDelegate DZQTextInputBarSendText:self.textString];
        }
        [self chat_resetTextInputBarStatusWhenSendText];
        return NO;
    }
    
    return YES;
}

-(void)chat_resetTextInputBarStatusWhenSendText{
    [self resetInputTextViewArea];
    [self updateTextInputBarStatus:DZQKeyStatusEdit];
}

//监听输入框的操作 输入框高度动态变化
- (void)textViewDidChange:(DZQChatTextView *)textView{
    if (_keyBoardStatus != DZQKeyStatusEdit) {
        _keyBoardStatus = DZQKeyStatusEdit;
    }
    
    NSString *message = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (self.inDelegate && [self.inDelegate respondsToSelector:@selector(DZQTextInputBarTextDidChange:)]) {
        [self.inDelegate DZQTextInputBarTextDidChange:message];
    }
    
    NSInteger height = [textView heightOfTextView];
    
    if(self.inputTextStrH != height){
        self.inputTextStrH = height;
        [self updateTextInputBarStatus:DZQKeyStatusEdit];
    }else{
        [textView scrollRangeToVisible:NSMakeRange(textView.text.length,1)];
    }
}

- (void)chat_textInputViewDidChange:(NSObject *)emojiText{
    [self textViewDidChange:[self.inputTextView updaeteEmoji:emojiText]];
}


//设置默认状态
-(void)setKeyBoardStatus:(DZQKeyStatus)status{
    if (_keyBoardStatus == status) {
        return;
    }
    _keyBoardStatus = status;
    self.inputTextView.hidden = NO;
    
    if(status == DZQKeyStatusDefault){
        
        self.currentBtn.selected = NO;
        [self resetInputTextViewArea];
        [self.inputTextView resignFirstResponder];
        
    }else if (status == DZQKeyStatusVoice){
        
        self.currentBtn.selected = YES;
        self.inputTextView.hidden = YES;
        self.inputTextStrH = DZQChatTextHeight;
        [self.inputTextView resignFirstResponder];
        
    }else if (status == DZQKeyStatusEdit){
        
        self.currentBtn.selected = NO;
        [self.inputTextView becomeFirstResponder];
        
    }else if (status == DZQKeyStatusSymbol){
        
        self.currentBtn.selected = YES;
        [self.inputTextView resignFirstResponder];
        
    }else if (status == DZQKeyStatusAdd){
        
        self.currentBtn.selected = YES;
    }
    
}



-(void)resetInputTextViewArea{
    self.inputTextStrH = DZQChatTextHeight;
    [self.inputTextView resetInputState];
}

#pragma mark DZQRecordButtonDelegate  语音录制按钮

- (void)DZQRecordButtonBackAudio:(NSData *)voice time:(NSInteger)time{
    if(self.inDelegate && [self.inDelegate respondsToSelector:@selector(DZQTextInputBarSendAudio:time:)]){
        [self.inDelegate DZQTextInputBarSendAudio:voice time:time];
    }
}

// ========= 初始化 =========

//左侧按钮
- (DZQChatBarButton *)audioButton{
    if (!_audioButton) {
        _audioButton = [DZQChatBarButton BarButton:CGSizeMake(DZQChatBtnSize, DZQChatBtnSize) tag:10 img:@"icon_yuying" selImg:@"icon_shuru" Target:self action:@selector(chatKeyBarBtnAction:)];
    }
    return _audioButton;
}

//添加按钮
-(DZQChatBarButton *)moreButton{
    if (!_moreButton) {
        _moreButton = [DZQChatBarButton BarButton:CGSizeMake(DZQChatBtnSize, DZQChatBtnSize) tag:12 img:@"icon_tianjia" selImg:@"icon_tianjia" Target:self action:@selector(chatKeyBarBtnAction:)];
    }
    return _moreButton;
}
//表情按钮
- (DZQChatBarButton *)emotionButton{
    if (!_emotionButton) {
        _emotionButton = [DZQChatBarButton BarButton:CGSizeMake(DZQChatBtnSize, DZQChatBtnSize) tag:11 img:@"icon_biaoqing" selImg:@"icon_shuru" Target:self action:@selector(chatKeyBarBtnAction:)];
    }
    return _emotionButton;
}

// 语音按钮   输入框
-(DZQRecordButton *)inputButton{
    if (!_inputButton) {
        _inputButton = [[DZQRecordButton alloc] initWithSize:CGSizeMake(DZQChatTextWidth, DZQChatTextHeight) delegate:self];
    }
    return _inputButton;
}

-(DZQChatTextView *)inputTextView{
    if (!_inputTextView) {
        _inputTextView = [DZQChatTextView chatInputWithFrame:self.inputButton.bounds delehgate:self];
    }
    return _inputTextView;
}

@end
