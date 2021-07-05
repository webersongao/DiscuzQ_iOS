//
//  DZQApiListController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQApiListController.h"


@interface DZQApiListController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *sectionArray;  //!< 属性注释
@property (nonatomic, strong) NSArray<NSArray *> *dataArray;  //!< 属性注释
@property (nonatomic, strong) UITableView *listView;  //!< 属性注释

@end

@implementation DZQApiListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_localDataArray];
    [self.view addSubview:self.listView];
    [self.listView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray[section].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    return cell;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sectionArray[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kMargin20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kMargin40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    NSInteger Section = indexPath.section;
    
    if (Section == 0) {
        if (row == 0) {
            // 前端获取配置接口
            
        }else if (row == 1){
            // 站点基本信息接口
            
        }else if (row == 2){
            // 上传,删除站点 logo 接口
            
        }else if (row == 3){
            // 检查更新
            
        }
    }else if (Section == 1){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 2){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 3){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 4){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 5){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 6){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 7){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 8){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 9){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 10){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 11){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 12){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 13){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 14){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 15){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 16){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 17){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 18){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 19){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 20){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 21){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }else if (Section == 22){
        if (row == 0) {
            
        }else if (row == 1){
            
        }else if (row == 2){
            
        }else if (row == 3){
            
        }else if (row == 4){
            
        }else if (row == 5){
            
        }
    }
    
}

















-(UITableView *)listView{
    if (!_listView) {
        _listView = [[UITableView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
        _listView.delegate = self;
        _listView.dataSource = self;
    }
    return _listView;
}




-(void)config_localDataArray{
    self.sectionArray = @[@"1、站点",
                          @"2、用户",
                          @"3、用户认证",
                          @"4、用户组",
                          @"5、权限",
                          @"6、通知",
                          @"7、分类",
                          @"8、主题",
                          @"9、回复",
                          @"10、附件",
                          @"11、敏感词",
                          @"12、举报",
                          @"13、表情",
                          @"14、邀请",
                          @"15、订单",
                          @"16、钱包",
                          @"17、短信",
                          @"18、设置",
                          @"19、财务",
                          @"20、关注",
                          @"21、短消息",
                          @"22、会话"
    ];
    
    self.dataArray = @[@[@"前端获取配置接口",@"站点基本信息接口",@"上传,删除站点 logo 接口",@"检查更新"],
                       @[@"用户批量删除接口",@"上传头像接口",@"删除用户头像",@"用户资料修改",@"批量修改用户的用户组",@"用户资料展示",@"用户搜索接口",@"实名认证接口",@"用户信息导出",@"删除用户微信信息",@"修改支付密码 - 获取验证 token",@"拉黑某个用户",@"取消拉黑用户",@"用户拉黑列表"],
                       @[@"用户认证"],
                       @[@"用户组"],
                       @[@"权限"],
                       @[@"通知"],
                       @[@"分类"],
                       @[@"主题"],
                       @[@"回复"],
                       @[@"附件"],
                       @[@"敏感词"],
                       @[@"举报"],
                       @[@"表情"],
                       @[@"邀请"],
                       @[@"订单"],
                       @[@"钱包"],
                       @[@"短信"],
                       @[@"设置"],
                       @[@"财务"],
                       @[@"关注"],
                       @[@"短消息"],
                       @[@"会话"]
    ];
}



@end
