//
//  DZQNetTool+Notification.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Notification.h"


@implementation DZQNetTool (Notification)


/// 消息列表
/// @param filter filter
//    通知类型
//    默认不传查全部
//    system 系统通知
//    replied 回复我的
//    liked 点赞我的
//    rewarded 打赏我的
//    related @我的
-(void)dz_notiListWithTypeFilter:(NSString * _Nullable )filter success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Noti_list,nil,[NSString stringWithFormat:@"&filter[type]=%@",checkNull(filter)]);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Noti_list,@"list") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
    
}





@end
