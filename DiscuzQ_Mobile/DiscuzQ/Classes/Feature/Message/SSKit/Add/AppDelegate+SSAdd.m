//
//  AppDelegate+DEAdd.m
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import "AppDelegate+SSAdd.h"


@implementation DZQDelegate (SSAdd)


//获取全局单例
+(DZQDelegate *)sharedAppDelegate{
    DZQDelegate *appDelegate = (DZQDelegate*)[[UIApplication sharedApplication] delegate];
    return appDelegate;
}





@end
