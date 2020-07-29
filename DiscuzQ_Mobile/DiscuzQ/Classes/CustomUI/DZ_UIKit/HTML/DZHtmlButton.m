
//
//  DTCoreTextHandlerButton.m
//  MyCoreTextDemo
//
//  Created by Bjmsp on 2018/1/24.
//  Copyright © 2018年 ZJ. All rights reserved.
//

#import "DZHtmlButton.h"
#import "DZHtmlItem.h"
#import "DZThreadHelper.h"

@interface DZHtmlButton ()

@property (nonatomic, assign) DZHtmlUrlType urlType;

@end

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
    }else if([_url hasPrefix:dz_HtmlUrl_key]){
        return DZHtmlUrl_SpanUrl;
    }
    return DZHtmlUrl_Unknow;
}

#pragma mark - private Methods
-(void)onBtnClick:(DZHtmlButton *)btn{
    switch (btn.urlType) {
        case DZHtmlUrl_Http:{
            [[DZMobileCtrl sharedCtrl] PushToWebViewController:btn.url];
            break;
        }
        case DZHtmlUrl_Tel:{
            NSString *phoneNum = [[btn.url componentsSeparatedByString:@":"] lastObject];
            [[DZMobileCtrl sharedCtrl] PushToPhoneViewWithNumber:phoneNum];
            break;
        }
        case DZHtmlUrl_Mail:{
            break;
        }
        case DZHtmlUrl_SpanUrl:{
            [DZHtmlButton openHtmlUrlWithSpanUrl:btn.url];
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
+ (void)openHtmlUrlWithSpanUrl:(NSString *)htmlUrlStr{
    
    NSURL *htmlUrl = KURLString(htmlUrlStr);
    NSString *host = htmlUrl.host;
    NSString *queryString = htmlUrl.query;
    
    NSDictionary *paraDict = [NSString DZParamsURL:queryString];
    NSString *ParaId = [paraDict stringValueForKey:dz_ParaId_key default:@""];
    
    if ([host isEqualToString:@"topic"]) {
       [DZThreadHelper thread_TopicDetailAction:ParaId];
    }else if ([host isEqualToString:@"member"]){
        [DZThreadHelper thread_UserCenterCellAction:ParaId];
    }
    
    
    
    
}





@end
