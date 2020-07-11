
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

+ (DZHtmlButton *)htmlButtonURL:(NSString *)url withIdentifier:(NSString *)identifier frame:(CGRect)frame{
    DZHtmlButton *button = [[DZHtmlButton alloc] initWithFrame:frame];
    button.url = url;
    button.alpha = 0.5;
    button.identifier = identifier;
    //    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:button action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (DZHtmlUrlType)urlType{
    if ([_url hasPrefix:@"http"]) {
        if ([_url hasSuffix:@".zip"] || [_url hasSuffix:@".rar"] || [_url hasSuffix:@".exe"] || [_url hasSuffix:@".dmg"]) {
            return DZHtmlUrl_Download;
        }
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
        case DZHtmlUrl_Download:{
            [DZMobileCtrl PasteLocalBoardWithString:btn.url];
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
