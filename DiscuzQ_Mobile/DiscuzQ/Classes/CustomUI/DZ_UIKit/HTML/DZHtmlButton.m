
//
//  DTCoreTextHandlerButton.m
//  MyCoreTextDemo
//
//  Created by Bjmsp on 2018/1/24.
//  Copyright © 2018年 ZJ. All rights reserved.
//

#import "DZHtmlButton.h"
@implementation DZHtmlButton

#pragma mark - Life Cycle
+ (DZHtmlButton *)getButtonWithURL:(NSString *)url
                               withIdentifier:(NSString *)identifier
                                        frame:(CGRect)frame{
    DZHtmlButton *button = [[DZHtmlButton alloc] initWithFrame:frame];
    button.url = url;
    button.identifier = identifier;
    [button setTitleColor:KGreen_Color forState:UIControlStateNormal];
    [button addTarget:button action:@selector(onBtnClick:) forControlEvents:UIControlEventAllEvents];
    return button;
}

- (DZHtmlUrlType)urlType{
    if ([_url hasPrefix:@"http"]) {
        return DZHtmlUrl_Http;
    }else if([_url hasPrefix:@"tel"]){
        return DZHtmlUrl_Tel;
    }else if([_url hasPrefix:@"mailto"]){
        return DZHtmlUrl_Mail;
    }
    return DZHtmlUrl_Unknow;
}


#pragma mark - private Methods
-(void)onBtnClick:(DZHtmlButton *)btn{
    switch (btn.urlType) {
        case DZHtmlUrl_Http:{
            [DZHtmlButton openWebPage:btn.url];
            break;
        }
        case DZHtmlUrl_Tel:{
            NSString *phoneNum = [[btn.url componentsSeparatedByString:@":"] lastObject];
            [DZHtmlButton dailPhoneNum:phoneNum];
             break;
             }
        case DZHtmlUrl_Mail:{
            break;
        }
        default:
            break;
    }
}


#pragma mark - Public Methods
//打开链接
+ (void)openWebPage:(NSString *)url{
    [[DZMobileCtrl sharedCtrl] PushToWebViewController:url];
//    [[UIApplication sharedApplication ] openURL:[NSURL URLWithString:url] options:nil completionHandler:nil];
}

//拨打电话
+ (void)dailPhoneNum:(NSString *)phoneNum{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:nil completionHandler:nil];
}




@end
