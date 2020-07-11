//
//  DTCoreTextHandlerButton.h
//  MyCoreTextDemo
//
//  Created by Bjmsp on 2018/1/24.
//  Copyright © 2018年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DZHtmlUrlType){
    DZHtmlUrl_Unknow,
    DZHtmlUrl_Http,
    DZHtmlUrl_Tel,
    DZHtmlUrl_Mail,
    DZHtmlUrl_Download,
};


//自定义的Button，用于处理富文本中的a标签处理
@interface DZHtmlButton : UIButton

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, assign) DZHtmlUrlType urlType;
/**
 类方法创建Button

 @param url a标签链接
 @param identifier a标签的ID标识，唯一
 @return 返回一个用于响应的Button
 */
+ (DZHtmlButton *)htmlButtonURL:(NSString *)url withIdentifier:(NSString *)identifier frame:(CGRect)frame;


//打开链接
+ (void)openWebPage:(NSString *)url;

//拨打电话
+ (void)dailPhoneNum:(NSString *)phoneNum;



@end
