//
//  DZThreadListModel+Display.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/31.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListModel+Display.h"
#import "DZThreadVarModel.h"

@implementation DZThreadListModel (Display)

/**
 根据帖子类型设置描述
 
 @param page 页数
 @param groupDic 所在群组
 @param typeDic 帖子类型 投票、活动等
 @return 帖子model
 */
-(DZThreadListModel *)dealModelWithPage:(NSInteger)page andGroup:(NSDictionary *)groupDic andType:(NSDictionary *)typeDic {
    
    self.grouptitle = [groupDic stringForKey:self.authorid];
    
    self.typeName = [typeDic stringForKey:self.typeId];
    self.mainTitleString = [self dealSpecialTypeThread:page];
    
    [self updateThreadModelLayout];
    return  self;
}


- (DZThreadListModel *)dealSpecialThread{
    self.mainTitleString = [self dealSpecialTypeThread:0];
    return self;
}


- (NSString *)dealSpecialTypeThread:(NSInteger)page {
    NSString *useSubjectStr = self.mainTitleString;
    if ([self isTopThread] && page == 1 && self.typeName.length) {
        useSubjectStr = [NSString stringWithFormat:@"%@,%@",self.typeName,self.subject];
    } else {
        NSString *spaceCharater = @"    ";
        if ([self isSpecialThread]) {
            if (self.typeName.length) {
                useSubjectStr = [NSString stringWithFormat:@"%@[%@]%@",spaceCharater,self.typeName,self.subject];
            } else {
                useSubjectStr = [NSString stringWithFormat:@"%@%@",spaceCharater,self.subject];
            }
        } else {
            if (self.typeName.length) {
                useSubjectStr = [NSString stringWithFormat:@"[%@]%@",self.typeName,self.subject];
            }
        }
    }
    
    return useSubjectStr;
}

// 特殊帖判断
- (BOOL)isSpecialThread {
    NSArray *specialArr = @[@"1",@"4",@"5"];
    if ([DataCheck isValidString:self.special]) {
        if ([specialArr containsObject:self.special]) {
            return YES;
        }
    }
    return NO;
}

// 置顶帖判断
- (BOOL)isTopThread {
    NSArray *topCheckArray = @[@"1",@"2",@"3"];
    if ([topCheckArray containsObject:self.displayorder]) {
        return YES;
    }
    return false;
}


// 是否是本版帖子
- (BOOL)isCurrentForum:(NSString *)fid {
    if ([@[@"3",@"2"] containsObject:self.displayorder] && ![self.fid isEqualToString:fid]) { // 非本版帖子
        return YES;
    }
    return NO;
}


@end












