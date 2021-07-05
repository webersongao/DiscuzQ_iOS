//
//  DZThreadQuestion.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadQuestion.h"
#import "DZHtmlLabel.h"
#import "DZThreadHelper.h"
#import "DZPicSquareView.h"
#import "DZThreadListStyle.h"

@interface DZThreadQuestion ()<DZPicSquareDelegate>

@property (nonatomic, strong) DZLabel *stateLabel;  //!< 属性注释
@property(nonatomic,strong) DZHtmlLabel *contentLabel;
@property(nonatomic,strong) DZPicSquareView *imageSquare;

@end

@implementation DZThreadQuestion

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_questionView];
    }
    return self;
}

-(void)config_questionView{
    
    [self addSubview:self.stateLabel];
    [self addSubview:self.imageSquare];
    [self addSubview:self.contentLabel];
}

- (void)updateThreadQuestion:(DZQDataThread *)Model style:(DZDContentStyle *)localStyle{
    
    [self layoutQuestionSubview:localStyle];
    self.stateLabel.attributedText = localStyle.kf_titleString;
    [self.contentLabel updateContent_Html:localStyle.kf_contentItem];
    
    self.imageSquare.imgDelegate = nil;
    self.imageSquare.imgDelegate = self;
    
//    NSInteger answerState = Model.relationships.question.attributes.is_answer;
    
    [self.imageSquare updateSquareUrlList:Model.relationships.firstPost.relationships.images grid:localStyle.kf_squareGrid];
    
}

-(void)layoutQuestionSubview:(DZDContentStyle *)layout{

    self.stateLabel.frame = layout.kf_titleFrame;
    self.contentLabel.frame = layout.kf_contentFrame;
    self.imageSquare.frame = layout.kf_mediaFrame;
}

#pragma mark DZPicSquareDelegate

- (void)collectionView:(DZPicSquareView *)collectionView squareData:(NSArray<DZQDataAttachment *> *)attachArray DidSelectItem:(NSInteger)index{
    
    [DZThreadHelper touchThreadPicSquareData:attachArray DidSelectItem:index];
    
}

-(DZLabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KTitle_Color font:KBoldFont(KContent_fontSize) textAlignment:NSTextAlignmentLeft];
    }
    return _stateLabel;
}

-(DZPicSquareView *)imageSquare{
    if (!_imageSquare) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _imageSquare = [[DZPicSquareView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    return _imageSquare;
}

-(DZHtmlLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
    }
    return _contentLabel;
}


@end
