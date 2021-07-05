//
//  DZWebUrlCenter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/1/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZWebUrlCenter.h"
#import "DZNativeHelper.h"

static NSString *DZJSPrefix = @"wx://doumao_ios/";
static NSString *DZAppStoreUrl_01 = @"http://itunes.apple";
static NSString *DZAppStoreUrl_02 = @"https://itunes.apple";

@interface DZWebUrlCenter ()

@end

@implementation DZWebUrlCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isAllowJS = YES;
    }
    return self;
}

- (BOOL)processWebviewWithReqString:(NSString *)UrlString
{
    NSString* reqstr = checkNull(UrlString);
    
    if([reqstr hasPrefix:DZJSPrefix])
    {
        NSRange range = {0};
        range.location = [DZJSPrefix length];
        range.length = [reqstr length] - range.location;
        NSString* json = [reqstr substringWithRange:range];
        NSString* newjson = [json stringByRemovingPercentEncoding];
        if (self.isAllowJS) {
            [self WebviewClientExecSync:newjson withConfig:nil];
        }else{
            KSLog(@"WBS 禁止执行JS");
        }
        return NO;
    } else {
        //不是抖猫自己js，后还需要做js的兼容处理比如下载等其他错误js
        return [self.class handleRedirectUrl:reqstr];
    }
}

+ (BOOL)handleRedirectUrl:(NSString *)url
{
    if ([self.class isAppOpenUrl:url]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{UIApplicationOpenURLOptionsSourceApplicationKey:@YES} completionHandler:nil];
        return NO;
    }
    return YES;
}

//当webview接到了js交互消息的时候，会回调给这里
//json格式基本都是 {"apiName":"xxx", "params":{xxxxx}}
-(NSString*)WebviewClientExecSync:(NSString*) json withConfig:(NSDictionary*) config
{
    NSData *string = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id rootData = [NSJSONSerialization JSONObjectWithData:string options:NSJSONReadingMutableLeaves error:&error];
    if (rootData) {
        if ([rootData isKindOfClass:[NSDictionary class]]) {
            [self webViewClientCallBackEventHandle:rootData];
        } else if ([rootData isKindOfClass:[NSArray class]]) {
            for (NSDictionary *data in rootData) {
                [self webViewClientCallBackEventHandle:data];
            }
        }
    }
    return @"";
}

- (void)webViewClientCallBackEventHandle:(NSDictionary *)rootData
{
    [DZNativeHelper webUrlLogicNativeCallData:rootData];
}


+ (BOOL)isAppOpenUrl:(NSString*)url
{
    BOOL isAppUrl = NO;
    if (url.length >= DZAppStoreUrl_01.length && [url hasPrefix:DZAppStoreUrl_01])
    {
        isAppUrl = YES;
    }
    else if (url.length >= DZAppStoreUrl_02.length && [url hasPrefix:DZAppStoreUrl_02])
    {
        isAppUrl = YES;
    }
    return isAppUrl;
}





@end
