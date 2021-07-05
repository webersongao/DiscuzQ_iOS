//
//  DZThreadPostCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadPostCell.h"
#import "DZPostViewContiner.h"

@interface DZThreadPostCell ()

@property (nonatomic, strong) DZPostViewContiner *post_Content;  //!< 属性注释

@end

@implementation DZThreadPostCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_ThreadPostCell];
    }
    return self;
}

-(void)config_ThreadPostCell{
    
    [self.contentView addSubview:self.post_Content];
}



-(void)updateThreadPostCell:(DZQDataPost *)dataPost{
    
    DZDPostCellStyle *postStyle = (DZDPostCellStyle *)dataPost.styleModel;
    
    [self.post_Content updatePostContiner:dataPost style:postStyle];
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.post_Content.frame = self.bounds;
}


-(DZPostViewContiner *)post_Content{
    if (!_post_Content) {
        _post_Content = [[DZPostViewContiner alloc] initWithFrame:CGRectZero];
    }
    return _post_Content;
}

@end
