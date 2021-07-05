//
//  DZMSgNotiBaseController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMSgNotiBaseController.h"

@interface DZMSgNotiBaseController ()
{
    CGRect m_frame;
}

@end

@implementation DZMSgNotiBaseController

- (instancetype)initWithSubFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        m_frame = frame;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = m_frame;
    [self setDz_HideNaviBar:YES];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadLocalNotiAndMsgData) name:DZ_TabbarRefresh_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadLocalNotiAndMsgData) name:DZ_DomainUrlChange_Notify object:nil];
    
}


-(void)loadLocalNotiAndMsgData{
    
}

-(void)loadLocalDialogOrMsgListData{
    
}


-(void)reloadNotiAndMsgDataWhenChange{
    
}



- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




@end
