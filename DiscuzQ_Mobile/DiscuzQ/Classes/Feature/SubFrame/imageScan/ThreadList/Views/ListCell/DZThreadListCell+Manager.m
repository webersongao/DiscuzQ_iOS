//
//  DZThreadListCell+Manager.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/23.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListCell+Manager.h"
#import "ForumTool.h"

@implementation DZThreadListCell (Manager)

-(void)configThreadCellManager{
    [self.cellView.headerView.IconButton addTarget:self action:@selector(IconButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.cellView.bottomBarView.zanButton addTarget:self action:@selector(zanButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

// 点击头像
-(void)IconButtonAction:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToOtherUserController:self.cellModel.authorid];
}

// 点赞
-(void)zanButtonAction:(UIButton *)button{
    
    if (![DZLoginModule isLogged]) {
        KSLog(@"WBS 用户未登录呦~~~");
        return;
    }
    
    if ([self.cellModel.recommend isEqualToString:@"1"]) {
        [MBProgressHUD showInfo:@"您已赞过该主题"];
    } else {
        button.enabled = NO;
        [ForumTool DZ_PraiseRequestTid:self.cellModel.tid successBlock:^{
            if (self.cellModel.isRecently) {
                KBack_ThreadBlock(^{
                    if ([DataCheck isValidString:self.cellModel.tid]) {
                        [[DZDatabaseHandle Helper] footThread:self.cellModel];
                    }
                });
                [self resetPraise:YES];
            }
        } failureBlock:^(NSError *error){
            [self resetPraise:NO];
        }];
    }
}

- (void)resetPraise:(BOOL)isSuccess {
    
    self.cellView.bottomBarView.zanButton.selected = isSuccess;
    self.cellModel.recommend = isSuccess ? @"1" : @"0";
    if (isSuccess) {
        self.cellModel.recommend_add = [NSString stringWithFormat:@"%ld",[self.cellModel.recommend_add integerValue] + 1];
    }else{
        self.cellView.bottomBarView.zanButton.enabled = YES;
    }
    [self.cellView.bottomBarView.zanButton setTitle:checkTwoStr(@"点赞：", self.cellModel.recommend_add) forState:UIControlStateNormal];
}





@end
