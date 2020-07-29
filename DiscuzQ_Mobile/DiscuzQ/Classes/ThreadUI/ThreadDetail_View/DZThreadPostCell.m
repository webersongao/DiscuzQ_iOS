//
//  DZThreadPostCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadPostCell.h"
#import "DZPostCommentView.h"

@interface DZThreadPostCell ()

@property (nonatomic, strong) DZPostCommentView *post_Content;  //!< 属性注释

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
    
    [self.post_Content updatePostComment:dataPost style:postStyle];
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.post_Content.frame = self.bounds;
}


-(DZPostCommentView *)post_Content{
    if (!_post_Content) {
        _post_Content = [[DZPostCommentView alloc] initWithFrame:CGRectZero];
    }
    return _post_Content;
}

@end
