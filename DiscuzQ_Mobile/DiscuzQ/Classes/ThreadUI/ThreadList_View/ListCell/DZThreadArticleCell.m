//
//  DZThreadArticleCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadArticleCell.h"
#import "DZThreadArticle.h"

@interface DZThreadArticleCell ()

@property (nonatomic, strong) DZThreadArticle *articleView;  //!< 长段文章

@end

@implementation DZThreadArticleCell


-(void)config_ThreadBaseListCell{
    [super config_ThreadBaseListCell];
    [self.contentView addSubview:self.articleView];
    
}


-(void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    [super updateThreadListCell:Model IndexPath:indexPath];
    [self layoutThreadArticleCell:self.cellLayout];
    
    [self.articleView updateThreadArticle:Model style:self.cellLayout];

}

-(void)layoutThreadArticleCell:(DZThreadListStyle *)layout{
    
    self.articleView.frame = layout.kf_content;
    
}



-(DZThreadArticle *)articleView{
    if (!_articleView) {
        _articleView = [[DZThreadArticle alloc] initWithFrame:CGRectZero];
    }
    return _articleView;
}



@end
