//
//  DZThreadQuestionCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadQuestionCell.h"
#import "DZThreadQuestion.h"

@interface DZThreadQuestionCell ()

@property (nonatomic, strong) DZThreadQuestion *questionView;  //!< <#属性注释#>

@end

@implementation DZThreadQuestionCell


-(void)config_ThreadBaseListCell{
    [super config_ThreadBaseListCell];
    [self.contentView addSubview:self.questionView];
}


- (void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    [super updateThreadListCell:Model IndexPath:indexPath];
    [self layoutThreadQuestionCell:self.cellLayout];
    
    [self.questionView updateThreadQuestion:Model style:self.cellLayout.frame_content];
    
}



-(void)layoutThreadQuestionCell:(DZThreadListStyle *)layout{
    
    self.questionView.frame = layout.kf_content;
}





-(DZThreadQuestion *)questionView{
    if (!_questionView) {
        _questionView = [[DZThreadQuestion alloc] initWithFrame:CGRectZero];
    }
    return _questionView;
}


@end
