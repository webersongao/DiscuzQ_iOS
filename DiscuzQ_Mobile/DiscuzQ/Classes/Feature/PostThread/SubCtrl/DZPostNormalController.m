//
//  DZPostNormalController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostNormalController.h"
#import "DZThreadPostEditerView.h"

@interface DZPostNormalController ()

@property (nonatomic, strong) DZThreadPostEditerView *editerView;  //!< <#属性注释#>

@end

@implementation DZPostNormalController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_PostTabController];
    [self.view addSubview:self.editerView];
    [self.dz_NavigationBar removeFromSuperview];
}

-(void)config_PostTabController{
    
    [self configNaviBar:@"发布" type:NaviItemText Direction:NaviDirectionRight];
}

-(DZThreadPostEditerView *)editerView{
    if (!_editerView) {
       CGRect editRect = CGRectMake(0, 0, self.view.width, KView_OutNavi_Bounds.size.height - KTabbar_Gap);
        _editerView = [[DZThreadPostEditerView alloc] initWithFrame:editRect];
    }
    return _editerView;
}


@end
