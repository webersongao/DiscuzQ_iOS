//
//  DZUserModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserModel.h"

@implementation DZUserModel


-(BOOL)isUserLogin{
    if (self.user_id.length && self.access_token.length) {
        return YES;
    }
    return NO;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

#pragma mark   /********************* 数据库继承方法 *************************/

- (NSArray *)primaryKey
{
    NSString *uidStr = checkNull(self.user_id);
    return @[FieldName(uidStr)];
}

- (NSString *)tableName
{
    return @"DZQ_AuthTable";
}

- (void)startUpdateProperties
{
    NSArray *updateProperties = @[@"access_token",@"refresh_token",@"username",@"avatarUrl"];
    [super startUpdateProperties:updateProperties];
}

-(NSArray *)excludedFields
{
    return @[@"rowID"];
}


#pragma mark   /********************* 工具类方法 *************************/

+(instancetype)configUserModel:(NSDictionary *)dataDict token:(NSDictionary *)tokenDict{
    
    NSDictionary *userDict = [dataDict dictionaryForKey:@"attributes"];
    DZUserModel *model = [DZUserModel yy_modelWithDictionary:userDict];
    
    model.user_id = DZQStrNull([userDict objectForKey:@"id"]);
    
    model.expires_in = [tokenDict longLongForKey:@"expires_in"];
    model.token_type = DZQStrNull([tokenDict objectForKey:@"token_type"]);
    model.access_token = DZQStrNull([tokenDict objectForKey:@"access_token"]);
    model.refresh_token = DZQStrNull([tokenDict objectForKey:@"refresh_token"]);
    
    return model;
    
}




@end
