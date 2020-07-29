//
//  DZToolBox.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZToolBox.h"
#import "DZQMacroHeader.h"

@implementation DZToolBox

// 转换UIImage 为 NSData
+(NSData* _Nullable)dz_getDataFromImage:(UIImage* _Nullable)image{
    
    NSData *data;
    
    /*判断图片是不是png格式的文件*/
    if(UIImagePNGRepresentation(image)){
        data = UIImagePNGRepresentation(image);
    }else{
        /*判断图片是不是jpeg格式的文件*/
        data = UIImageJPEGRepresentation(image,1.0);
    }
    return data;
}

// 字符串转 数组
NSArray* DZQStringToNSArray(NSString * _Nullable arrayStr){
    arrayStr = arrayStr ? arrayStr : @"";
    if (arrayStr.length) {
        NSString * muString = [NSString removeSpaceAndNewline:arrayStr];
        muString = [muString stringByReplacingOccurrencesOfString:@"(" withString:@""];
        muString = [muString stringByReplacingOccurrencesOfString:@")" withString:@""];
        NSArray *localArr =  [muString componentsSeparatedByString:@","];
        return localArr;
    }
    return nil;
}
// 拼接接口 queryStr 、token 及 url (queryStr 可以为空)
NSString* _Nullable DZQUrlCommonPara(NSString * __nullable apiCtrl,NSString * __nullable subCtrl,NSString * __nullable queryStr)
{
    NSString *baseApiCtrl = apiCtrl.length ? apiCtrl : @"/api";
    if ([baseApiCtrl hasSuffix:@"/"]) {
        baseApiCtrl = [baseApiCtrl substringToIndex:baseApiCtrl.length-1];
    }
    baseApiCtrl = [NSString stringWithFormat:@"%@/%@",baseApiCtrl,DZQStrNull(subCtrl)];
    NSString *queryString = queryStr.length ? [NSString stringWithFormat:@"%@&",DZQStrNull(queryStr)] :@"";
    
    if ([DZQ_BASEURL hasSuffix:@"/"] && [baseApiCtrl hasPrefix:@"/"]) {
        baseApiCtrl = [baseApiCtrl substringFromIndex:1];
    }
    if ([baseApiCtrl hasSuffix:@"/"]) {
        baseApiCtrl = [baseApiCtrl substringToIndex:baseApiCtrl.length-1];
    }
    if ([queryString hasPrefix:@"?"]) {
        queryString = [queryString substringFromIndex:1];
    }
     NSString *URLString = [NSString stringWithFormat:@"%@%@?%@%@",DZQ_BASEURL,baseApiCtrl,queryString,DZQ_from_TAG];
    
    URLString = [URLString stringByReplacingOccurrencesOfString:@"=(null)" withString:@"="];
    URLString = [URLString stringByReplacingOccurrencesOfString:@"null" withString:@""];
    
    return URLString;
}



@end
