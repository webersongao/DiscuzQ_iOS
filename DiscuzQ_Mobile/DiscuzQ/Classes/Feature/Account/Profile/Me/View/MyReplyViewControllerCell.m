//
//  MyReplyViewControllerCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/9/2.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "MyReplyViewControllerCell.h"

@implementation MyReplyViewControllerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, KScreenWidth-20, 50)];
    self.titleLabel.font = [UIFont systemFontOfSize:14.0];
    self.titleLabel.numberOfLines = 0;
    [self addSubview:self.titleLabel];
    
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.titleLabel.frame.size.height+10, 80, 15)];
    self.nameLabel.font = [UIFont systemFontOfSize:12.0];
    [self addSubview:self.nameLabel];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, self.titleLabel.frame.size.height+10, 120, 15)];
    self.timeLabel.font = [UIFont systemFontOfSize:12.0];
    [self addSubview:self.timeLabel];
    
}

-(void)setData:(NSDictionary*)dic{
    self.titleLabel.text = [dic stringForKey:@"subject"];
    self.nameLabel.text = [dic stringForKey:@"author"];
    self.timeLabel.text =[dic stringForKey:@"dateline"];
}

@end
