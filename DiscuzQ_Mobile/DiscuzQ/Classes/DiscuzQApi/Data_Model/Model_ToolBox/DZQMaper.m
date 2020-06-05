//
//  DZQMaper.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQMaper.h"

@interface DZQMaper ()

@property (nonatomic, strong) NSDictionary *attributeMap;  //!< 模型字典
@property (nonatomic, strong) NSDictionary *relationshipMap;  //!< 接口字典

@end


@implementation DZQMaper


// 必须是 继承自 DZQSuperRelation 的类
// 每一个接口对应一行，不可以重复 和 接口复用
-(NSDictionary *)relationshipMap{
    
    return @{KDZQMapKey(DZQ_User_register,@"register") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_User_profile,@"profile") : kWrapper([DZQProfileRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_User_login,@"login") : kWrapper([DZQLoginRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Noti_list,@"list") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Topic_one,@"one") : kWrapper([DZQThreadRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Topic_list,@"list") : kWrapper([DZQThreadRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Cate_list,@"list") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Site_forum,@"forum") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             
//             KDZQMapKey(DZQ_Site_setlogo,@"logo") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             
             
             KDZQMapKey(DZQ_User_refreshToken,@"refreshToken") : kWrapper([DZQSuperRelation class], [DZQDataConvert new])
    };
}

// 必须是 继承自 DZQSuperAttribute 的类
-(NSDictionary *)attributeMap{
    return @{@"users":kModelWrapper([DZQUserModel class]),
             @"posts":kModelWrapper([DZQPostModel class]),
             @"token":kModelWrapper([DZQBaseToken class]),
             @"groups":kModelWrapper([DZQGroupModel class]),
             @"forums":kModelWrapper([DZQForumModel class]),
             @"threads":kModelWrapper([DZQThreadModel class]),
             @"categories":kModelWrapper([DZQCateModel class]),
             @"notification":kModelWrapper([DZQNotiModel class]),
             @"thread-video":kModelWrapper([DZQVideoModel class]),
             @"attachments":kModelWrapper([DZQAttachmentModel class]),
             
             
             //             @"settings":kModelWrapper([DZQNotiModel class]),
             
    };
}


- (Class)modelClassForKey:(NSString *)typeKey
{
    DZQModelWrapper *wrapper = self.attributeMap[typeKey];
    if (!wrapper || (id)wrapper == [NSNull null]) {
        return nil;
    }
    
    return wrapper.attCls;
}

- (Class)relationClassForUrlKey:(NSString *)urlKey{
    
    DZQWrapper *wrapper = self.relationshipMap[urlKey];
    if (!wrapper || (id)wrapper == [NSNull null]) {
        return nil;
    }
    
    return wrapper.relateCls;
}

- (DZQDataConvert *)dataConvertForKey:(NSString *)typeKey
{
    DZQWrapper *wrapper = self.relationshipMap[typeKey];
    if (!wrapper || (id)wrapper == [NSNull null]) {
        return nil;
    }
    
    return wrapper.convert;
}


#pragma mark   /********************* 工具方法 *************************/

//+(NSString *)urlkeyForRelationMap:(NSString *)urlName{
//
//    NSArray *keyArr = [urlName componentsSeparatedByString:@"_"];
//    NSString *keyStr = DZQTwoStr(urlName, DZQStrNull(keyArr.lastObject));
//
//    return keyStr;
//}


@end



