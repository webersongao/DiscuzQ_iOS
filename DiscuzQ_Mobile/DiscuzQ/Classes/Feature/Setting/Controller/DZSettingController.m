//
//  DZSettingController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZSettingController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import "DZPushCenter.h"
#import "DZEmailHelper.h"

@interface DZSettingController ()
@property (nonatomic,copy) NSString * strcache;
@property (nonatomic, strong) NSMutableArray *listArray;  //!< <#属性注释#>
@end

@implementation DZSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通用设置";
    
    [self config_SettingController];
    [self.view addSubview:self.tableView];
}

-(void)config_SettingController{
    self.dataSourceArr = self.listArray.copy;
    self.tableView = [[DZBaseTableView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = KDebug_Color;
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSourceArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = self.dataSourceArr[section];
    return arr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellId = @"SettingCellId";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    
    if (cell == nil) {
        cell = [[DZBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellId];
        cell.textLabel.font = KFont(14);
        cell.detailTextLabel.font = KFont(11);
        if (indexPath.section == 0 && indexPath.row == 0) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    
    NSArray *settingArr = self.dataSourceArr[indexPath.section];
    cell.textLabel.text = [settingArr objectAtIndex:indexPath.row];
    if (indexPath.section == 0 && indexPath.row == 2) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2fM",[[DZFileManager shareInstance] filePathSize]];
    }
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight_50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.5;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0: {
            if (indexPath.row == 0) {
                [DZMobileCtrl showAlertWarn:@"账号切换功能暂未启用"];
            }else if (indexPath.row == 1) {
                [self config_localDomain];
            }else if (indexPath.row == 2) {
                [self  cleanLocalCache];
            }
        }
            break;
        case 1: {
            if (indexPath.row == 0) {
                [self sendEmail];
            }else if (indexPath.row == 1) {
                [self evaluateAPP];
            }else if (indexPath.row == 2) {
                [self shareLocalAPP];
            }
        }
            break;
        case 2: {
            if (indexPath.row == 0) {
                [self localSiteinfo];
            }else if (indexPath.row == 1) {
                [self localUserTerms];
            }else if (indexPath.row == 2) {
                [self pushtoLocalAboutAPP];
            }else if (indexPath.row == 3){
                [self localUserALoginout];
            }
        }
            break;
        default:
            break;
    }
}

- (void)sendEmail {
    [DZEmailHelper Helper].navigationController = self.navigationController;
    [[DZEmailHelper Helper] prepareSendEmail];
}

- (void)config_localDomain {
    [[DZMobileCtrl sharedCtrl] PushToDomainSettingController];
}

- (void)evaluateAPP {
    [[DZMobileCtrl sharedCtrl] PushToAppStoreWebview];
}

- (void)shareLocalAPP {
    [[DZMobileCtrl sharedCtrl] shareMyMobileAPPWithView:self.view];
}

- (void)pushtoLocalAboutAPP {
    [[DZMobileCtrl sharedCtrl] PushToAppAboutViewController];
}

-(void)localSiteinfo{
    [[DZMobileCtrl sharedCtrl] PushToSiteInfoViewController];
}

- (void)localUserTerms {
    [[DZMobileCtrl sharedCtrl] PushToUserTermController];
}

- (void)localUserALoginout {
    
    if (![self isLogin]) {
        return;
    }
    ZHAlertView *alertV = [[ZHAlertView alloc] initWithTitle:@"退出登录？" contentText:@"您确定退出？退出将不能体验全部功能。" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
    
    alertV.rightBlock = ^{
        [self dz_PopCurrentViewController];
        [[NSNotificationCenter defaultCenter] postNotificationName:DZ_UserSigOut_Notify object:nil];
    };
    [alertV show];
}

#pragma mark - 清除缓存
-(void)cleanLocalCache {
    [self.HUD showLoadingMessag:@"正在清理" toView:self.view];
    
    [[DZMobileCtrl sharedCtrl] cleanLocalDataCache:^{
        
        [self.HUD hide];
        [DZMobileCtrl showAlertSuccess:@"清理成功！"];
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:2 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
    }];
}
-(NSMutableArray *)listArray{
    if (_listArray == nil) {
        _listArray = [NSMutableArray array];
        NSArray *setArr = @[@"账号切换",@"切换网站",@"清除程序缓存"];
        NSArray *appArr = @[@"反馈问题",@"评价应用",@"分享该应用"];
        NSArray *aboutArr = @[@"站点详情",@"服务条款",checkTwoStr(@"关于", DZ_APP_Name),@"退出当前账户"];
        _listArray = @[setArr,appArr,aboutArr].mutableCopy;
    }
    return _listArray;
}



@end
