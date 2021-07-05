//
//  NSString+HTTPURL.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "NSString+HTTPURL.h"

@implementation NSString (HTTPURL)



#pragma mark   /********************* 工具方法 *************************/

/**
 *  拼接公共上行
 *
 *  @param baseUrl 含有空格必须编码不然af不兼容崩溃
 *
 *  @return urlString
 */
+ (NSString *)appendCommonParamsUrl:(NSString *)baseUrl
{
    if (baseUrl && ([baseUrl rangeOfString:DZQ_from_TAG].location == NSNotFound)) {
        baseUrl = addUrlParam(baseUrl,DZQ_from_TAG);
    }
    return [baseUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}


+ (void)rebuiltUrlParams:(NSDictionary *)rootDictionary url:(NSString *)requestUrl{
    
    KSLog(@"Discuz Q 请求链接：requestURL is \n\n %@ \n\n",[DataCheck rebuiltParams:rootDictionary url:requestUrl]);
}


NSString* addUrlParam(NSString *baseurl, NSString *param)
{
    if(!baseurl || [baseurl length] == 0
       || !param || [param length] == 0)
        return baseurl;
    
    NSString* resultUrl = @"";
    if ([baseurl rangeOfString:@"?"].length == 0)
    {
        resultUrl = [NSString stringWithFormat:@"%@?%@", baseurl, param];
    }else{
        if([baseurl hasSuffix:@"?"]){
            //以?结尾,不带&
            resultUrl = [NSString stringWithFormat:@"%@%@", baseurl, param];
        }else{
            //存在?,但是不以?结尾,带&
            resultUrl = [NSString stringWithFormat:@"%@&%@", baseurl, param];
        }
    }
    return resultUrl;
}






@end
