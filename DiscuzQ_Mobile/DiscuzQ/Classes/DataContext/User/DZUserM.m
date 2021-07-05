//
//  DZUserM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserM.h"
#import "DZQTokenV1.h"
#import "DataBaseHeader.h"

@implementation DZUserM


-(BOOL)isUserLogin{
    if (self.user_id.length && self.tokenModel && !self.tokenModel.isExpired) {
        return YES;
    }
    return NO;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

+ (instancetype)user_modelWithDictionary:(NSDictionary *)dictionary {
    
    NSMutableDictionary *innerMuDict = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    
    for (NSString *blobKey in [self.class blobFields].allKeys) {
        NSData *tokenData = [innerMuDict objectForKey:blobKey];
        NSDictionary *tokenDict = [NSDictionary dictionaryWithData:tokenData];
        [innerMuDict setValue:tokenDict forKey:blobKey];
    }
    
    return [self DZQ_ModelWithDictionary:innerMuDict];
}

#pragma mark   /********************* 数据库继承方法 *************************/

- (NSArray *)primaryKey
{
    NSString *uidStr = checkNull(self.user_id);
    return @[FieldName(uidStr)];
}

- (NSString *)tableName
{
    return @"DQ_UserInfoTable";
}

+(NSDictionary<NSString *,Class> *)blobFields{
    return @{ @"tokenModel" : [DZQTokenV1 class]};
}

- (void)startUpdateProperties
{
    NSArray *updateProperties = @[@"tokenModel",@"username",@"avatarUrl"];
    [super startUpdateProperties:updateProperties];
}

// 排除不处理的字段
-(NSArray *)excludedFields
{
    return @[@"rowID",@"typeUnreadNotis"];
}


#pragma mark   /********************* 工具类方法 *************************/

+(instancetype)configUserModel:(NSDictionary *)dataDict token:(NSDictionary *)tokenDict{
    
    NSDictionary *userDict = [dataDict dictionaryForKey:@"attributes"];
    DZUserM *model = [DZUserM DZQ_ModelWithDictionary:userDict];
    
    model.typeUnreadNotis = nil;
    model.user_id = DZQStrNull([userDict objectForKey:@"id"]);
    
    model.tokenModel = [DZQTokenV1 DZQ_ModelWithDictionary:tokenDict];
    
    return model;
}




@end
