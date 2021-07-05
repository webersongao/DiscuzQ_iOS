//
//  DZDomainListController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/3/30.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZDomainListController.h"
#import "UIAlertController+Extension.h"
#import "DZSiteListView.h"
#import "DZSiteListView.h"

@interface DZDomainListController ()

@property (nonatomic, strong) DZSiteListView *listView;  //!< <#属性注释#>
@property (nonatomic, strong) NSMutableArray <DZSiteItem *> *dataSourceArr;  //!< 属性注释

@end

@implementation DZDomainListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"可切换网站列表";
    [self config_SiteListViewAction];
    [self configNaviBar:@"添加" type:NaviItemText Direction:NaviDirectionRight];
}


-(void)config_SiteListViewAction{
    
    [self.view addSubview:self.listView];
    self.dataSourceArr = [NSMutableArray arrayWithArray:[DZSiteHelper localSiteDataArray]];
    [self.listView updateLocalSiteListView:self.dataSourceArr];
    
    KWEAKSELF
    self.listView.selectBlock = ^(NSIndexPath *indexPath) {
        [weakSelf listViewdidSelectRowAtIndexPath:indexPath];
    };
    
    self.listView.deleteBlock = ^(NSIndexPath *indexPath) {
        [weakSelf listViewdidDeleteDomainAtIndexPath:indexPath];
    };
    
}



- (void)rightBarBtnClick:(UIButton *)button {
    
    [UIAlertController alertTextFieldWithTitle:@"注意" message:@"请输入域名！\n以’http‘或’https‘开头,结尾不带斜线" firstHolder:@"名称" secendHolder:@"域名" oriController:self doneText:@"确定" cancelText:@"取消" doneHandle:^(UIAlertController *AlertCtrl, UITextField *firstField, UITextField *secendField) {
        
        NSString *nameString = firstField.text;
        NSString *domainString = secendField.text;
        
        if (!nameString.length) {
            [MBProgressHUD showInfo:@"请输入名称"];
            [self showDetailViewController:AlertCtrl sender:nil];
            return;
        }
        if (!domainString.length) {
            [MBProgressHUD showInfo:@"请输入域名"];
            [self showDetailViewController:AlertCtrl sender:nil];
            return;
        }
        
        if ([domainString hasSuffix:@"/"]) {
            [MBProgressHUD showInfo:@"请去除域名末尾斜线"];
            [self showDetailViewController:AlertCtrl sender:nil];
            return;
        }
        
        DZSiteItem *item = [DZSiteItem siteName:nameString url:domainString desc:@""];
        [self.dataSourceArr addObject:item];
        [DZSiteHelper saveToLocalSiteDataArray:self.dataSourceArr];
        
        [self.listView updateLocalSiteListView:self.dataSourceArr];
        
    } cancelHandle:nil];
    
}

- (void)listViewdidSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CurrentDomain = [DZMobileCtrl siteRootDomain];
    NSString *newDomain =  self.dataSourceArr[indexPath.row].siteUrlString;
    
    if (![newDomain isEqualToString:CurrentDomain]) {
        if ([[DZSiteHelper shared] updateLocalUrlDomain:newDomain]) {
            [self changeLocalSiteConfig:@"切换成功，重启App后生效"];
            [self.listView updateLocalSiteListView:self.dataSourceArr];
        }else{
            [DZMobileCtrl showAlertInfo:@"切换站点失败"];
        }
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [self.listView setEditing:YES animated:animated];
}

- (void)listViewdidDeleteDomainAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *currentUrl = self.dataSourceArr[indexPath.row].siteUrlString;
    if ([currentUrl isEqualToString:[DZMobileCtrl siteRootDomain]]) {
        [[DZSiteHelper shared] updateLocalUrlDomain:nil];
        [self changeLocalSiteConfig:@"已切换为默认站点"];
    }
    
    [self.dataSourceArr removeObjectAtIndex:indexPath.row];
    [DZSiteHelper saveToLocalSiteDataArray:self.dataSourceArr];
    
    [self.listView updateLocalSiteListView:self.dataSourceArr];
}


-(void)changeLocalSiteConfig:(NSString *)alertString{
    
    [DZMobileCtrl showAlertInfo:alertString];
    [[DZMobileCtrl sharedCtrl] signoutWithCompletion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:DZ_DomainUrlChange_Notify object:Nil];
}


-(DZSiteListView *)listView{
    if (!_listView) {
        _listView = [[DZSiteListView alloc] initWithFrame:KView_OutNavi_Bounds];
    }
    return _listView;
}


@end






