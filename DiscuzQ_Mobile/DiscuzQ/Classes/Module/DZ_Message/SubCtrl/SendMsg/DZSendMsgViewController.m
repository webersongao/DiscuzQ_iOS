//
//  DZSendMsgViewController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/2.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZSendMsgViewController.h"

@interface DZSendMsgViewController ()<UITextFieldDelegate,UITextViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UITextView *messageTextView;
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UIButton *postButton;
@property (nonatomic, strong) UIScrollView *bgScrollView;
@end

@implementation DZSendMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dz_NavigationItem.title = @"发送消息";
    [self config_SendMsgView];
    if ([DataCheck isValidString:self.uid]) {
        [self configNaviBar:@"取消" type:NaviItemText Direction:NaviDirectionLeft];
    }
}

-(void)leftBarBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)config_SendMsgView{
    
    [self.view addSubview:self.bgScrollView];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *userView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, KScreenWidth, 55)];
    userView.backgroundColor = [UIColor whiteColor];
    
    UILabel *peopleLable = [[UILabel alloc] initWithFrame:CGRectMake(kMargin15, 20, 55, 15)];
    peopleLable.text = @"收件人:";
    peopleLable.font = KFont(14);
    [userView addSubview:peopleLable];
    
    CGFloat titleFieldW = self.view.width - peopleLable.right - kMargin30;
    self.titleTextField =[[UITextField alloc] initWithFrame:CGRectMake(peopleLable.right+kMargin15,7, titleFieldW, 41)];
    self.titleTextField.placeholder = @"请输入用户名";
    self.titleTextField.font = KFont(17);
    self.titleTextField.delegate = self;
    
    self.titleTextField.layer.cornerRadius  = 4.0;
    self.titleTextField.layer.borderWidth = 1.0;
    self.titleTextField.layer.borderColor = KGray_Color.CGColor;
    
    self.titleTextField.text = self.uid;
    
    [userView addSubview:self.titleTextField];
    
    [_bgScrollView addSubview:userView];
    
    [self.messageTextView addSubview:self.placeholderLabel];
    [self.bgScrollView addSubview:self.messageTextView];
    
    
    
    [_bgScrollView addSubview:self.postButton];
}

-(void)postData{
    
    if (![self isLogin]) {
        return;
    }
    if(![DataCheck isValidString:self.messageTextView.text]){
        [MBProgressHUD showInfo:@"消息内容为空"];
        return;
    }
    if(![DataCheck isValidString:self.titleTextField.text]){
        [MBProgressHUD showInfo:@"用户名内容为空"];
        return;
    }
    [self.HUD showLoadingMessag:@"发送中" toView:self.view];
    
    // 发送消息
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_bgScrollView endEditing:YES];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text hasEmoji]) {
        return NO;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    
    if (![textView.text isEqualToString:@""]) {
        self.placeholderLabel.hidden = YES;
    } else {
        self.placeholderLabel.hidden = NO;
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [self.messageTextView resignFirstResponder];
    if ([textView.text isEqualToString:@""]) {
        self.placeholderLabel.hidden = NO;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [_bgScrollView endEditing:YES];
}


-(UIScrollView *)bgScrollView{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc]initWithFrame:KView_OutNavi_Bounds];
        _bgScrollView.contentSize = CGSizeMake(self.view.width, KView_OutNavi_Bounds.size.height+1);
        [_bgScrollView setShowsHorizontalScrollIndicator:NO];
        [_bgScrollView setShowsVerticalScrollIndicator:NO];
        _bgScrollView.pagingEnabled = YES;
        _bgScrollView.scrollEnabled = NO;
        _bgScrollView.delegate = self;
    }
    return _bgScrollView;
}

-(UITextView *)messageTextView{
    if (!_messageTextView) {
        _messageTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 55+kMargin20,KScreenWidth-20, 340)];
        _messageTextView.delegate = self;
        _messageTextView.font = KFont(17);
        _messageTextView.layer.cornerRadius  = 4.0;
        _messageTextView.layer.borderWidth = 1.0;
        _messageTextView.layer.borderColor = KGray_Color.CGColor;
    }
    return _messageTextView;
}

- (UILabel *)placeholderLabel{
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,10, KScreenWidth-40, 15)];
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.textAlignment = NSTextAlignmentLeft;
        _placeholderLabel.text =@"请输入短消息的内容";
        _placeholderLabel.font = KFont(17);
        _placeholderLabel.textColor = KLightGray_Color;
    }
    return _placeholderLabel;
}

-(UIButton *)postButton{
    if (!_postButton) {
        _postButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_postButton setTitle:@"发送" forState:UIControlStateNormal];
        [_postButton setBackgroundColor:K_Color_Theme];
        [_postButton addTarget:self action:@selector(postData) forControlEvents:UIControlEventTouchUpInside];
        _postButton.frame = CGRectMake(10, self.messageTextView.bottom +kMargin40 ,KScreenWidth -20, 40);
        _postButton.layer.cornerRadius  = 4.0;
        _postButton.layer.borderWidth = 1.0;
        _postButton.layer.borderColor = KGray_Color.CGColor;
    }
    return _postButton;
}

@end
