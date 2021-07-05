//
//  DZQChatListView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatListView.h"
#import "DZQChatBaseCell.h"
#import "DZQMediaGroupItem.h"

@interface DZQChatListView ()<UITableViewDelegate,UITableViewDataSource,DZQChatCellDelegate>

@property(nonatomic,strong)NSArray *dataArrSource;

@end

@implementation DZQChatListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self config_chatListView];
        self.backgroundColor = KLightGray_Color;
    }
    return self;
}


-(void)config_chatListView{
    
    [self registerClass:NSClassFromString(@"DZQChatTextCell") forCellReuseIdentifier:DZQChatTextCellId];
    [self registerClass:NSClassFromString(@"DZQChatImageCell") forCellReuseIdentifier:DZQChatImageCellId];
    [self registerClass:NSClassFromString(@"DZQChatVoiceCell") forCellReuseIdentifier:DZQChatVoiceCellId];
    [self registerClass:NSClassFromString(@"DZQChatMapCell") forCellReuseIdentifier:DZQChatMapCellId];
    [self registerClass:NSClassFromString(@"DZQChatVideoCell") forCellReuseIdentifier:DZQChatVideoCellId];
}


-(void)updateChatDetailList:(NSArray *)datas scrollIndex:(NSIndexPath *)indexPath{
    self.dataArrSource = datas;
    [self reloadData];
    if (!indexPath) { return; }
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArrSource.count == 0 ? 0 : 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArrSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [(DZQChatMsgLayout *)self.dataArrSource[indexPath.row] cellHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZQChatMsgLayout *layout = self.dataArrSource[indexPath.row];
    DZQChatBaseCell *chatCell = [tableView dequeueReusableCellWithIdentifier:layout.message.cellString];
    [chatCell updateChatCell:layout indexPath:indexPath delegate:self];
    return chatCell;
}


//视图归位
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.listDelegate respondsToSelector:@selector(DZQChatListEndEdiAction:)]) {
        [self.listDelegate DZQChatListEndEdiAction:self];
    }
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if ([self.listDelegate respondsToSelector:@selector(DZQChatListEndEdiAction:)]) {
        [self.listDelegate DZQChatListEndEdiAction:self];
    }
}




#pragma DZQChatCellDelegate
/// 点击定位
-(void)DZQChatCellLocationClick:(NSIndexPath *)indexPath layout:(DZQChatMsgLayout *)layout{
    if ([self.listDelegate respondsToSelector:@selector(DZQChatListClickAction:layout:)]) {
        [self.listDelegate DZQChatListClickAction:indexPath layout:layout];
    }
}

#pragma DZQChatCellDelegate
/// 点击图片 点击短视频
-(void)DZQChatCellImageVideoClick:(NSIndexPath *)indexPath layout:(DZQChatMsgLayout *)layout{
    
    NSInteger currentIndex = 0;
    NSMutableArray *groupItems = [NSMutableArray new];
    
    for(int i=0;i<self.dataArrSource.count;++i){
        NSIndexPath *ip = [NSIndexPath indexPathForRow:i inSection:0];
        DZQChatBaseCell *cell = [self cellForRowAtIndexPath:ip];
        DZQChatMsgLayout *mLayout = self.dataArrSource[i];
        
        DZQMediaGroupItem *item = [DZQMediaGroupItem new];
        if(mLayout.message.messageType == DZQChatMsgTypeImage){
            item.imageType = DZQImageGroupImage;
            item.fromImgView = cell.mImgView;
            item.fromImage = mLayout.message.image;
        }else if(mLayout.message.messageType == DZQChatMsgTypeGif){
            item.imageType = DZQImageGroupGif;
            item.fromImgView = cell.mImgView;
            item.fromImages = mLayout.message.imageArr;
        }else if (mLayout.message.messageType == DZQChatMsgTypeVideo){
            item.imageType = DZQImageGroupVideo;
            item.videoPath = mLayout.message.videoLocalPath;
            item.fromImgView = cell.mImgView;
            item.fromImage = mLayout.message.videoImage;
        }else continue;
        
        item.contentMode = mLayout.message.contentMode;
        item.itemTag = groupItems.count + 10;
        if([mLayout isEqual:layout])currentIndex = groupItems.count;
        [groupItems addObject:item];
    }
    
    if ([self.listDelegate respondsToSelector:@selector(DZQChatListMediaAction:mediaItems:)]) {
        [self.listDelegate DZQChatListMediaAction:currentIndex mediaItems:groupItems];
    }
}



@end
