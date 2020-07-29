//
//  DZPostNormalController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostNormalController.h"
#import "DZThreadEditerView.h"

@interface DZPostNormalController ()

@property (nonatomic, strong) DZThreadEditerView *editerView;  //!< <#属性注释#>

@end

@implementation DZPostNormalController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.editerView];
    [self.dz_NavigationBar removeFromSuperview];
}


-(DZThreadEditerView *)editerView{
    if (!_editerView) {
        _editerView = [[DZThreadEditerView alloc] initWithFrame:self.view.bounds];
    }
    return _editerView;
}


@end
