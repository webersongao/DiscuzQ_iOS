//
//  DZQChatViewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatViewController.h"
#import "DZQChatKeyBoardBar.h"
#import "DZQImagePicker.h"
#import "DZQChatCenter.h"
#import "DZQChatDatas.h"
#import "DZQChatListView.h"
#import "DZQMediaGroupView.h"

@interface DZQChatViewController ()<DZQChatKeyBoardBarDelegate,DZQChatListViewDelegate>

@property (nonatomic, strong) NSString *sessionId;
@property (nonatomic, strong) DZQDataDialog *dialog;

//表单
@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic,strong)DZQChatListView *chatListView;

//底部输入框 携带表情视图和多功能视图
@property(nonatomic,strong)DZQChatKeyBoardBar *inputbar;

//访问相册 摄像头
@property(nonatomic,strong)DZQImagePicker *dataPicker;

@end

@implementation DZQChatViewController

- (instancetype)initWithDialog:(DZQDataDialog *)daDialog
{
    self = [super init];
    if (self) {
        self.dialog = daDialog;
        self.sessionId = @"13540033104";
        _datas = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_ChatDetailController];
    [self.view addSubview:self.inputbar];
    [self.view addSubview:self.chatListView];
    [self.view bringSubviewToFront:self.inputbar];
    self.title = self.dialog.relationships.recipient.attributes.username;
}

-(void)config_ChatDetailController{
    KWEAKSELF
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [weakSelf.datas addObjectsFromArray:[DZQChatDatas LoadingMessagesStartWithChat:weakSelf.sessionId]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.chatListView updateChatDetailList:[weakSelf.datas copy] scrollIndex:nil];
        });
    });
}


#pragma DZQChatListViewDelegate 会话listView代理回调

// Cell Action
-(void)DZQChatListClickAction:(NSIndexPath *)indexPath layout:(DZQChatMsgLayout *)layout{
    
    if (layout.message.messageType == DZQChatMsgTypeMap) {
        // 地图定位
        [DZQChatCenter pushToChatMapController:layout];
    }
}

/// Cell Media （图片，视频，音频）等
-(void)DZQChatListMediaAction:(NSInteger)currentIndex mediaItems:(NSArray *)mediaItems{
    
    DZQMediaGroupView *imageGroupView = [[DZQMediaGroupView alloc]initWithGroupItems:mediaItems currentIndex:currentIndex];
    [self.navigationController.view addSubview:imageGroupView];
    
    __block DZQMediaGroupView *blockView = imageGroupView;
    blockView.dismissBlock = ^{
        [blockView removeFromSuperview];
        blockView = nil;
    };
    
    [self.inputbar resetChatKeyBoardInputViewEndEditing];
}

// Cell 头像
-(void)DZQChatListHeaderAction:(NSIndexPath *)indexPath layout:(DZQChatMsgLayout *)layout{
    KSLog(@"WBS  头像的点击事件");
}

// Cell 结束编辑状态
-(void)DZQChatListEndEdiAction:(DZQChatListView *)listView{
    [self.inputbar resetChatKeyBoardInputViewEndEditing];
}

#pragma DZQChatKeyBoardBarDelegate 底部输入框代理回调
//点击按钮视图frame发生变化 调整当前列表frame
-(void)DZQChatKeyBoardBarSize:(CGSize)keySize duration:(CGFloat)duration{
//    [UIView animateWithDuration:duration animations:^{
        self.chatListView.height = (self.inputbar.y - KNavi_ContainStatusBar_Height);
//    } completion:^(BOOL finished) {
        [self scrollChatlistViewToBottom];
//    }];
}

-(void)scrollChatlistViewToBottom
{
    if (self.datas.count >= 1)
    {
        [self.chatListView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.datas.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}

//发送文本 列表滚动至底部
-(void)DZQChatKeyBoardBarSendText:(NSString *)textString{
    NSDictionary *dic = @{@"text":textString};
    [self sendMessage:dic messageType:DZQChatMsgTypeText];
}


//发送语音
-(void)DZQChatKeyBoardBarSendAudio:(NSData *)voice time:(NSInteger)second{
    
    NSDictionary *dic = @{@"voice":voice,@"second":@(second)};
    [self sendMessage:dic messageType:DZQChatMsgTypeVoice];
}


//多功能视图点击回调  图片10  视频11  位置12
-(void)DZQChatKeyBoardBarFunction:(NSInteger)index{
    
    KWEAKSELF
    if(index==10 || index==11){
        [self.dataPicker getImagePickerWithAlertController:self modelType:DZQImgPickerModelImage + index-10 pickerBlock:^(DZQImgPickerStyle wayStyle, DZQImgPickerModelType modelType, id object) {
            //发送图片和gif图
            if(index==10){
                if(modelType == DZQImgPickerModelImage){
                    UIImage *image = (UIImage *)object;
                    NSDictionary *dic = @{@"image":image};
                    [weakSelf sendMessage:dic messageType:DZQChatMsgTypeImage];
                }else{
                    NSURL *imgUrl = (NSURL *)object;
                    NSDictionary *dic = @{@"imageLocalPath":imgUrl};
                    [weakSelf sendMessage:dic messageType:DZQChatMsgTypeGif];
                }
            }else{
                NSString *localPath = (NSString *)object;
                NSDictionary *dic = @{@"videoLocalPath":localPath};
                [weakSelf sendMessage:dic messageType:DZQChatMsgTypeVideo];
            }
        }];
        
    }else{
        [DZQChatCenter pushToChatLocationCtrl:^(NSDictionary *Dictionary) {
            [weakSelf sendMessage:Dictionary messageType:DZQChatMsgTypeMap];
        }];
    }
}


//发送消息
-(void)sendMessage:(NSDictionary *)dic messageType:(DZQChatMsgType)messageType{
    KWEAKSELF
    [DZQChatDatas sendMessage:dic sessionId:self.sessionId messageType:messageType messageBlock:^(DZQChatMsgLayout *layout, NSError *error, NSProgress *progress) {
        [weakSelf.datas addObject:layout];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.datas.count-1 inSection:0];
        [weakSelf.chatListView updateChatDetailList:[weakSelf.datas copy] scrollIndex:indexPath];
    }];
}

-(DZQChatKeyBoardBar *)inputbar{
    if (!_inputbar) {
        _inputbar = [DZQChatKeyBoardBar new];
        _inputbar.delegate = self;
    }
    return _inputbar;
}

-(DZQChatListView *)chatListView{
    if (!_chatListView) {
        CGRect frame = CGRectMake(0, KNavi_ContainStatusBar_Height, kScreenWidth, KView_OutNavi_Bounds.size.height-self.inputbar.height);
        _chatListView = [[DZQChatListView alloc]initWithFrame:frame];
        _chatListView.listDelegate = self;
    }
    return _chatListView;
}

-(DZQImagePicker *)dataPicker{
    if (!_dataPicker) {
        _dataPicker = [[DZQImagePicker alloc]init];
    }
    return _dataPicker;
}


@end
