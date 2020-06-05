//
//  UserDataModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/8.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "UserDataModel.h"

@interface UserDataModel ()

@property (nonatomic, strong) NSArray *baseArray;  //!< 属性注释
@property (nonatomic, strong) NSArray *UserArray;  //!< 属性注释
@property (nonatomic, strong) TextIconModel *endModel;  //!< 属性注释
@property (nonatomic, strong) NSArray *extcreditsArray;  //!< 属性注释

@property (nonatomic, strong) UserVarModel *userVarModel;  //!< 属性注释

@end

@implementation UserDataModel

- (instancetype)initWithType:(PKCenterType)type {
    self = [super init];
    if (self) {
        [self configUserData:type];
    }
    return self;
}

-(void)configUserData:(PKCenterType)type{
    
    self.baseArray = [self baseInitData];
    
    if (type == PKCenterTypeMy) {
        self.UserArray = [self myUserInitData];
        self.endModel = [TextIconModel initWithText:@"退出" iconName:nil andDetail:nil action:cell_Logout];
    }else{
        self.UserArray = [self otherInitData];
        self.endModel = [TextIconModel initWithText:@"加好友" iconName:nil andDetail:nil action:cell_addFriend];
    }
    self.extcreditsArray = [self extcreditsArray];
    self.isOther = (type == PKCenterTypeOther) ? YES : NO;
    self.ListArray = @[self.baseArray,self.UserArray,self.extcreditsArray,@[self.endModel]];
}

-(void)updateUserDataModel:(UserVarModel *)userVarModel{
    _userVarModel = userVarModel;
    _spaceModel = userVarModel.space;
    // 基本信息
    for (int i = 0; i < self.baseArray.count; i ++) {
        TextIconModel *model = self.baseArray[i];
        if (i == 0) {
            model.detail = userVarModel.space.group.grouptitle;
        }else if (i == 1){
            model.detail = userVarModel.space.regdate;
        }
    }
    
    // 主题数 回帖 积分
    NSMutableArray *extcreditArray = [NSMutableArray array];
    NSInteger realPost = [userVarModel.space.posts integerValue] - [userVarModel.space.threads integerValue];
    TextIconModel *ext01 = [TextIconModel initWithText:@"主题数" iconName:@"ucex_0" andDetail:userVarModel.space.threads action:cell_None];  // 主题
    TextIconModel *ext02 = [TextIconModel initWithText:@"回帖数" iconName:@"ucex_1" andDetail:checkInteger(realPost) action:cell_None];  // 回帖
    TextIconModel *ext03 = [TextIconModel initWithText:@"积分值" iconName:@"ucex_2" andDetail:userVarModel.space.credits action:cell_None];  // 积分
    [extcreditArray addObjectsFromArray:@[ext01,ext02,ext03]];
    
    //从扩展积分设置中读取扩展积分的名称
    NSDictionary * extcreditsDict = userVarModel.extcredits;
    
    for (int index = 1; index <= extcreditsDict.allKeys.count; index++) {
        
        NSDictionary *rootDict = [extcreditsDict dictionaryForKey:[NSString stringWithFormat:@"%d",index]];
        NSString *titleStr = [rootDict stringForKey:@"title"];
        
        NSString *detailStr = nil;
        if (index == 1){
            detailStr = userVarModel.space.extcredits1;
        }else if (index == 2){
            detailStr = userVarModel.space.extcredits2;
        }else if (index == 3){
            detailStr = userVarModel.space.extcredits3;
        }else if (index == 4){
            detailStr = userVarModel.space.extcredits4;
        }else if (index == 5){
            detailStr = userVarModel.space.extcredits5;
        }else{
            detailStr = nil;
        }
        NSString * imageStr  = [NSString stringWithFormat:@"ucex_%ld",(long)index];
        
        if (titleStr.length) {
            TextIconModel *itemModel = [TextIconModel initWithText:titleStr iconName:imageStr andDetail:detailStr action:cell_None];
            [extcreditArray addObject:itemModel];
        }
    }
    
    self.extcreditsArray = [NSArray arrayWithArray:extcreditArray.copy];
    self.ListArray = @[self.baseArray,self.UserArray,extcreditArray,@[self.endModel]];
    
    KSLog(@"数据更新完毕");
}




-(NSArray *)baseInitData{
    TextIconModel *model01 = [TextIconModel initWithText:@"用户组" iconName:@"uclist_0" andDetail:nil action:cell_None];
    TextIconModel *model02 = [TextIconModel initWithText:@"注册时间" iconName:@"uclist_1" andDetail:nil action:cell_None];
    return @[model01,model02];
}

- (NSArray *)myUserInitData {
    
    TextIconModel *other01 = [TextIconModel initWithText:@"我的主题" iconName:@"ucex_0" andDetail:nil action:cell_Thread];
    TextIconModel *other02 = [TextIconModel initWithText:@"我的回复" iconName:@"ucex_1" andDetail:nil action:cell_reply];
    
    return @[other01,other02];
}

- (NSArray *)otherInitData {
    
    TextIconModel *other01 = [TextIconModel initWithText:@"他的主题" iconName:@"ucex_0" andDetail:nil action:cell_Thread];
    TextIconModel *other02 = [TextIconModel initWithText:@"他的回复" iconName:@"ucex_1" andDetail:nil action:cell_reply];
    
    return @[other01,other02];
}

- (NSArray *)extcreditsArray {
    
    TextIconModel *ext01 = [TextIconModel initWithText:@"主题数" iconName:@"ucex_0" andDetail:nil action:cell_None];  // 威望
    TextIconModel *ext02 = [TextIconModel initWithText:@"回帖数" iconName:@"ucex_1" andDetail:nil action:cell_None];  // 金钱
    TextIconModel *ext03 = [TextIconModel initWithText:@"积分值" iconName:@"ucex_2" andDetail:nil action:cell_None];  // 贡献
    
    return @[ext01,ext02,ext03];
}


@end
