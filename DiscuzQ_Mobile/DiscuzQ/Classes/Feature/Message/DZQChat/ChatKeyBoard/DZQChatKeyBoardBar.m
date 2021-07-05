//
//  DZQChatKeyBoardBar.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatKeyBoardBar.h"
#import "DZQTextInputBar.h"
#import "DZQChatKeyHeader.h"
#import "DZQChatKeyBordView.h"

@interface DZQChatKeyBoardBar ()<DZQTextInputBarDelegate,DZQChatKeyBordViewDelegate>


@property(nonatomic,assign)CGFloat keyBoardHieght;
//顶部线条
@property(nonatomic,strong) UIView   *topLine;
@property (nonatomic, strong) DZQTextInputBar *inputBar;  //!< <#属性注释#>
//底部表情、插件视图
@property (nonatomic, strong) UIView *tabbarGapView;  //!< <#属性注释#>
@property (strong, nonatomic) DZQChatKeyBordView *keyboradView;

//当前的编辑状态（默认 语音 编辑文本 发送表情 其他功能）
@property(nonatomic,assign)DZQKeyStatus keyBoardStatus;


@end

@implementation DZQChatKeyBoardBar

-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = KLightGray_Color;
        self.frame = CGRectMake(0, kScreenHeight-DZQChatKeyBarDefaultH, kScreenWidth, DZQChatKeyBarDefaultH);
        [self addSubview:self.inputBar];
        [self addSubview:self.topLine];
        [self addSubview:self.keyboradView];
        [self addSubview:self.tabbarGapView];
        [self updateSubViewLayoutWithKeyHeight:0];
        //键盘显示 回收的监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange_show:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange_hide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

#pragma mark 键盘显示监听事件

- (void)keyboardWillChange_hide:(NSNotification *)noti{
    [self messageViewUpdateWithKeyBoard:CGSizeZero Duration:0.25];
}

- (void)keyboardWillChange_show:(NSNotification *)noti{
    
    CGSize keyboardSize = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSTimeInterval animationDuration= [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    self.keyBoardHieght = keyboardSize.height;
    [self messageViewUpdateWithKeyBoard:keyboardSize Duration:animationDuration];
}


#pragma mark DZQTextInputBarDelegate 文字输入框 代理

-(void)DZQTextInputBarSendText:(NSString *)textString{
    [self startSendMessage:textString];
    NSLog(@"WBS 输入框文字是 %@",textString);
}

// 输入框文本变化
-(void)DZQTextInputBarTextDidChange:(NSString *)changeString{
    if(changeString.length==0 || changeString==nil){
        self.keyboradView.emotionView.footer.sendButton.enabled = NO;
    }else{
        self.keyboradView.emotionView.footer.sendButton.enabled = YES;
    }
}

// 发送语音
-(void)DZQTextInputBarSendAudio:(NSData *)audioData time:(NSInteger)time;{
    if(self.delegate && [self.delegate respondsToSelector:@selector(DZQChatKeyBoardBarSendAudio:time:)]){
        [self.delegate DZQChatKeyBoardBarSendAudio:audioData time:time];
    }
}

// 高度更新
-(void)DZQTextInputBarUpdateHeight:(CGFloat)barHeight Status:(DZQKeyStatus)status{
    [self updateChatKeyBarStatus:status inputHeight:barHeight];
}

#pragma mark DZQChatKeyBordViewDelegate 底部视图按钮点击回调
//发送200  多功能点击10+
-(void)DZQChatKeyBordViewBtnClick:(NSInteger)index type:(DZQKeyBordFuncType)type{
    if(index==200){
        [self startSendMessage:self.inputBar.textString];
        [self.inputBar chat_resetTextInputBarStatusWhenSendText];
    }else if(index<200){
        if(self.delegate && [self.delegate respondsToSelector:@selector(DZQChatKeyBoardBarFunction:)]){
            [self.delegate DZQChatKeyBoardBarFunction:index];
        }
    }
}

//点击表情
-(void)DZQChatEmotionViewBtnClick:(NSObject *)emojiText{
    [self.inputBar chat_textInputViewDidChange:emojiText];
}


//开始发送消息
-(void)startSendMessage:(NSString *)message{
    if(message.length == 0){
        KSLog(@"文本为空");
    }else if(self.delegate && [self.delegate respondsToSelector:@selector(DZQChatKeyBoardBarSendText:)]){
        [self.delegate DZQChatKeyBoardBarSendText:message];
    }
    self.keyboradView.emotionView.footer.sendButton.enabled = NO;
}

//视图归位 设置默认状态 设置弹起的高度
-(void)resetChatKeyBoardInputViewEndEditing{
    [self.inputBar endEditing:YES];
    [self updateChatKeyBarStatus:DZQKeyStatusDefault inputHeight:DZQChatTextHeight];
}


-(void)updateChatKeyBarStatus:(DZQKeyStatus)status inputHeight:(CGFloat)inputHeight{
    
    self.keyBoardStatus = status;
    
    CGFloat keyHeight = [self keyboardHeightWithStatus:status];
    CGSize keySize = CGSizeMake(self.width, keyHeight);
    
    [self messageViewUpdateWithKeyBoard:keySize Duration:0.25];
}

- (void)messageViewUpdateWithKeyBoard:(CGSize)keySize Duration:(double)keyDuration
{
    [UIView animateWithDuration:0.25 animations:^{
        [self updateSubViewLayoutWithKeyHeight:keySize.height];
        if(self.delegate && [self.delegate respondsToSelector:@selector(DZQChatKeyBoardBarSize:duration:)]){
            [self.delegate DZQChatKeyBoardBarSize:keySize duration:keyDuration];
        }
    } completion:^(BOOL finished) {
    }];
}
//设置所有控件新的尺寸位置
-(void)updateSubViewLayoutWithKeyHeight:(CGFloat)keyHeight{
    
    self.inputBar.top = 0;
    
    self.keyboradView.top = self.inputBar.bottom;
    self.keyboradView.height = MIN(keyHeight, DZQChatWidgetHeight);
    
    self.tabbarGapView.top = self.keyboradView.bottom;
    
    self.height = self.inputBar.height + self.keyboradView.height + self.tabbarGapView.height;
    self.top = kScreenHeight - self.height;
}


-(CGFloat)keyboardHeightWithStatus:(DZQKeyStatus)status{
    
    BOOL isWidget = (status == DZQKeyStatusSymbol || status == DZQKeyStatusAdd);
    CGFloat keyHeight = isWidget ? DZQChatWidgetHeight : (status == DZQKeyStatusEdit ? self.keyBoardHieght : 0);
    return keyHeight;
}

//设置默认状态
-(void)setKeyBoardStatus:(DZQKeyStatus)status{
    _keyBoardStatus = status;
    if (status == DZQKeyStatusSymbol){
        self.keyboradView.type = DZQKeyBordFunc_Symbol;
    }else if (status == DZQKeyStatusAdd){
        self.keyboradView.type = DZQKeyBordFunc_Add;
    }
}

//开始布局就把底部的表情和多功能放在输入框底部了 这里需要对点击界外事件做处理
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    if(point.y>DZQChatKeyInputBarH){
        UIView *hitView = [super hitTest:point withEvent:event];
        
        NSMutableArray *array = [NSMutableArray new];
        
        if(self.keyboradView.type == DZQKeyBordFunc_Add){
            for(UIView * view in self.keyboradView.functionView.innerScrollView.subviews){
                [array addObjectsFromArray:view.subviews];
            }
        }else if(self.keyboradView.type == DZQKeyBordFunc_Symbol){
            
            CGPoint buttonPoint = [self.keyboradView.emotionView.footer.sendButton convertPoint:point fromView:self];
            if(CGRectContainsPoint(self.keyboradView.emotionView.footer.sendButton.bounds, buttonPoint)) {
                [array addObject:self.keyboradView.emotionView.footer.sendButton];
            }else{
                CGPoint footerPoint = [self.keyboradView.emotionView.footer.emojiFooterScrollView convertPoint:point fromView:self];
                if(CGRectContainsPoint(self.keyboradView.emotionView.footer.emojiFooterScrollView.bounds, footerPoint)) {
                    [array addObjectsFromArray: self.keyboradView.emotionView.footer.emojiFooterScrollView.subviews];
                }else{
                    [array addObjectsFromArray: self.keyboradView.emotionView.collectionView.subviews];
                }
            }
        }
        
        for(UIView *subView in array) {
            CGPoint myPoint = [subView convertPoint:point fromView:self];
            if(CGRectContainsPoint(subView.bounds, myPoint)) {
                hitView = subView;
                break;
            }
        }
        return hitView;
    }else{
        return [super hitTest:point withEvent:event];
    }
}

/// =================   初始化    =====================

-(UIView *)topLine{
    if (!_topLine) {
        _topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 0.5)];
        _topLine.backgroundColor = KDarkLine_Color;
    }
    return _topLine;
}

-(DZQTextInputBar *)inputBar{
    if (!_inputBar) {
        _inputBar = [[DZQTextInputBar alloc] initWithFrame:CGRectMake(0, 0, self.width, DZQChatKeyInputBarH)];
        _inputBar.inDelegate = self;
    }
    return _inputBar;
}

-(DZQChatKeyBordView *)keyboradView{
    if (!_keyboradView) {
        _keyboradView = [[DZQChatKeyBordView alloc]initWithFrame:CGRectMake(0, self.inputBar.bottom, self.width, DZQChatWidgetHeight)];
        _keyboradView.delegate = self;
    }
    return _keyboradView;
}

-(UIView *)tabbarGapView{
    if (!_tabbarGapView) {
        _tabbarGapView = [[UIView alloc] initWithFrame:CGRectMake(0, self.keyboradView.bottom, self.width, KTabbar_Gap)];
    }
    return _tabbarGapView;
}

@end
