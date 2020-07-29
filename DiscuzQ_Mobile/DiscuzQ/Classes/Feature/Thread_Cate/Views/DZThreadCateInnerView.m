//
//  DZThreadCateInnerView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadCateInnerView.h"
#import "DZThreadListController.h"

@interface DZThreadCateInnerView ()<UIScrollViewDelegate>

@property (nonatomic ,strong) DZQDataCate *dataCate;
@property (nonatomic, strong) NSMutableArray<DZThreadListController *> *ctvArr;

@end

@implementation DZThreadCateInnerView

- (instancetype)initWithInnerFrame:(CGRect)frame cate:(DZQDataCate *)dataCate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.pagingEnabled = YES;
        self.dataCate = dataCate;
        [self config_UserTabControllerList];
    }
    return self;
}


-(void)first_updateInnerCateData:(NSInteger)index{
    if (index < 0 || index >= self.ctvArr.count) {
        return;
    }
    [self.ctvArr[index] updateSuperCateThreadListCtrlView];
}


//处理分类页面
-(void)config_UserTabControllerList{
    
    self.contentSize = CGSizeMake(self.ctvArr.count * KScreenWidth, self.height);
}


#pragma mark   /********** UIScrollViewDelegate ***********/

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(!scrollView.isDragging){
        return;
    }
    int index = (scrollView.contentOffset.x  + self.width * 0.5)/ self.width;
    if (self.backSBlock) {
        self.backSBlock(index);
    }
}


-(NSMutableArray<DZThreadListController *> *)ctvArr{
    if (!_ctvArr) {
        _ctvArr = [NSMutableArray arrayWithCapacity:3];
        for (int idx = 0; idx < 3; idx++) {
            DZThreadListController *listVc = [[DZThreadListController alloc] initWithCateid:self.dataCate.type_id order:idx];
            [self addSubview:listVc.view];
            listVc.view.left = self.width*idx;
            [listVc.dz_NavigationBar removeFromSuperview];
            listVc.listView.frame = CGRectMake(0, 0, KScreenWidth, self.height);
            [_ctvArr addObject:listVc];
        };
    }
    return _ctvArr;
}




@end
