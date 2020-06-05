//
//  DZPostSiriViewController.m
//  DiscuzMobile
//
//  Created by WebersonGao on 2019/11/14.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZPostSiriViewController.h"
#import "DZSiriTool.h"

@interface DZPostSiriViewController ()

@property (nonatomic, copy) NSString *contentString;  //!< 属性注释
@property (nonatomic, assign) UIButton *inputButton;  //!< 属性注释
@property (nonatomic, assign) UIButton *clearButton;  //!< 属性注释
@property (nonatomic, strong) UITextView *contentView;  //!< 属性注释

@end

@implementation DZPostSiriViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.inputButton];
    [self.view addSubview:self.clearButton];
}

-(void)inputButtoninsideAction:(UIButton *)button{
    KWEAKSELF
    [[DZSiriTool sharedTool] cancelSpeechRecognizer:^{
        [weakSelf.inputButton setTitle:@"Siri-输入文字" forState:UIControlStateNormal];
    }];
}

-(void)inputButtonDownAction:(UIButton *)button{
    //启动识别服务
    KWEAKSELF
    [[DZSiriTool sharedTool] stardSpeechRecognizer:^{
        [weakSelf.inputButton setTitle:@"Siri-语音识别中..." forState:UIControlStateNormal];
    } endBlock:^(NSString *String,BOOL isFinal) {
        [weakSelf reloadInputContentView:String];
    }];
}

-(void)clearButtoninsideAction:(UIButton *)button{
    self.contentView.text = nil;
    [[DZSiriTool sharedTool] cancelSpeechRecognizer:nil];
}

-(void)reloadInputContentView:(NSString *)string{
    
    if (self.contentView.text.length) {
        self.contentView.text = [NSString stringWithFormat:@"%@-%@",self.contentView.text,string];
    }else{
        self.contentView.text = string;
    }
}

#pragma mark   /********************* 初始化UI *************************/

-(UITextView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UITextView alloc] initWithFrame:CGRectMake(15.f, KNavi_ContainStatusBar_Height+kMargin10, KScreenWidth- 30, KScreenHeight-250)];
        _contentView.layer.borderColor = [UIColor orangeColor].CGColor;
        _contentView.layer.borderWidth = 1.f;
    }
    return _contentView;
}

-(UIButton *)inputButton{
    if (_inputButton == nil) {
        _inputButton = [UIButton ButtonTextWithFrame:CGRectMake(20, self.contentView.bottom+20.f, KScreenWidth-40, 40) titleStr:@"Siri-输入文字" titleColor:[UIColor orangeColor] titleTouColor:[UIColor orangeColor] font:KBoldFont(16.f) Radius:4.f Target:self action:@selector(inputButtoninsideAction:)];
        [_inputButton addTarget:self action:@selector(inputButtonDownAction:) forControlEvents:UIControlEventTouchDown];
        _inputButton.backgroundColor = [UIColor redColor];
    }
    return _inputButton;
}

-(UIButton *)clearButton{
    if (_clearButton == nil) {
        _clearButton = [UIButton ButtonTextWithFrame:CGRectMake(20, self.inputButton.bottom+20.f, KScreenWidth-40, 40) titleStr:@"Siri-清空文字" titleColor:[UIColor orangeColor] titleTouColor:[UIColor orangeColor] font:KBoldFont(16.f) Radius:4.f Target:self action:@selector(clearButtoninsideAction:)];
        _clearButton.backgroundColor = [UIColor redColor];
    }
    return _clearButton;
}

@end
