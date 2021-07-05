//
//  DZThreadArticle.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadArticle.h"
#import "DZArticleAttachList.h"
#import "DZThreadListStyle.h"
#import "DZPicSquareView.h"
#import "DZThreadHelper.h"
#import "DZHtmlLabel.h"

@interface DZThreadArticle ()<DZPicSquareDelegate>

@property(nonatomic,strong) DZLabel *titleLabel;  // 标题
@property(nonatomic,strong) DZHtmlLabel *contentLabel; // 内容
@property(nonatomic,strong) DZPicSquareView *imageSquare; // 配图
@property(nonatomic,strong) DZArticleAttachList *attachListView; // 附件列表

@end

@implementation DZThreadArticle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_articleView];
    }
    return self;
}

-(void)config_articleView{
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.imageSquare];
    [self addSubview:self.attachListView];

}


- (void)updateThreadArticle:(DZQDataThread *)Model style:(DZDHeadStyle *)localStyle{
    
    
    [self layoutArticleSubview:localStyle.frame_content];
    
    self.titleLabel.attributedText = localStyle.frame_content.kf_titleString;
    
    self.imageSquare.imgDelegate = nil;
    self.imageSquare.imgDelegate = self;
      
    DZQPostRelationV1 *relateModel = Model.relationships.firstPost.relationships;
    
    [self.imageSquare updateSquareUrlList:relateModel.images grid:localStyle.frame_content.kf_squareGrid];
    [self.contentLabel updateContent_Html:localStyle.frame_content.kf_contentItem];

    [self.attachListView updateFileAttachMentList:Model.relationships.firstPost.relationships.attachments];
}


-(void)layoutArticleSubview:(DZDContentStyle *)layout{
    
    self.titleLabel.font = layout.kf_titleFont;
    self.titleLabel.frame = layout.kf_titleFrame;
    self.contentLabel.frame = layout.kf_contentFrame;
    self.imageSquare.frame = layout.kf_mediaFrame;
    self.attachListView.frame = layout.kf_attachFrame;
    
}


#pragma mark DZPicSquareDelegate

- (void)collectionView:(DZPicSquareView *)collectionView squareCcrollDidScroll:(CGFloat)offsetY{
    
    
}



- (void)collectionView:(DZPicSquareView *)collectionView squareData:(NSArray<DZQDataAttachment *> *)attachArray DidSelectItem:(NSInteger)index{
    
    [DZThreadHelper touchThreadPicSquareData:attachArray DidSelectItem:index];
    
}

-(DZLabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KTitle_Color font:KFont(KTitle_fontSize) textAlignment:NSTextAlignmentLeft];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

-(DZHtmlLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
    }
    return _contentLabel;
}

-(DZPicSquareView *)imageSquare{
    if (!_imageSquare) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _imageSquare = [[DZPicSquareView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    return _imageSquare;
}

-(DZArticleAttachList *)attachListView{
    if (!_attachListView) {
        _attachListView = [[DZArticleAttachList alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _attachListView;
}


@end
