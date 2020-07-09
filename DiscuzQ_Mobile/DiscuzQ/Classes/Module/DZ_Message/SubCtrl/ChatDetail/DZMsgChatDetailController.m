//
//  DZMsgChatDetailController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/2.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZMsgChatDetailController.h"
#import "MessageModel.h"
#import "DZEmoticonKeyboard.h"
#import "ChatContentCell.h"
#import "DZMsgNetTool.h"
#import "DZBaseTableView.h"
#import "DZOtherUserController.h"

static CGFloat kToolBarH = 50;
@interface DZMsgChatDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *chatTableView;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) BOOL isRefresh;
@property (nonatomic, assign) NSInteger pressIndexRow;

@property (nonatomic, strong) NSMutableDictionary *sourceDic;
@property (nonatomic, strong) NSMutableArray<MessageModel *> *messageModelArr;
@property (nonatomic, strong) NSMutableDictionary *cellHeightDict;  // 缓存cell高度
// 表情键盘
@property (nonatomic, strong) DZEmoticonKeyboard *emoKeyboard;

@end

@implementation DZMsgChatDetailController

- (void)willMoveToParentViewController:(UIViewController *)parent {
    if (parent == nil) {
        [self.emoKeyboard hideCustomerKeyBoard];
    }
    [super willMoveToParentViewController:parent];
}

/**
 *  添加TableView
 */
- (void)addChatView {
    self.chatTableView = [[DZBaseTableView alloc] init];
    self.chatTableView.frame = CGRectMake(0, KNavi_ContainStatusBar_Height, KScreenWidth, KScreenHeight - KNavi_ContainStatusBar_Height -kToolBarH);
    self.chatTableView.backgroundColor = KWhite_Color;
    self.chatTableView.delegate = self;
    self.chatTableView.dataSource = self;
    self.chatTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.chatTableView];
}

/**
 *  点击聊天界面收起键盘
 */
- (void)endEdit {
    [self.emoKeyboard hideCustomerKeyBoard];
    [self restoreChatView];
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =checkTwoStr(self.username,@"聊天室");
    
    // 加自定义表情键盘必须添加这行代码。
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeAll;
    }
    
    // 添加聊天tableview
    [self addChatView];
    
    // 刷新方法
    _page=0;
    _isRefresh=YES;
    [self refreshMethod];
    
    [self loadHistoryData:[NSString stringWithFormat:@"%ld",(long)self.page]];
    
    // 表情输入框
    [self createHPGrowingTextView];
}

#pragma mark - 请求方法
- (void)refreshMethod {
    KWEAKSELF;
    // 页数
    self.chatTableView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        KSLog(@"刷新");
        [weakSelf.chatTableView.mj_header endRefreshing];
        
        if (weakSelf.isRefresh == YES || weakSelf.page > 0) {
            [weakSelf updateData];
            weakSelf.page -- ;
        } else if (weakSelf.page == 1) {
            KSLog(@"无数据");
            [MBProgressHUD showInfo:@"没有更多回复"];
        }
    }];
    
}

#pragma mark -  创建表情键盘
- (DZEmoticonKeyboard *)emoKeyboard {
    if (!_emoKeyboard) {
        _emoKeyboard = [[DZEmoticonKeyboard alloc] initWithFrame:CGRectMake(0, KScreenHeight - kToolBarH, KScreenWidth, kToolBarH)];
    }
    return _emoKeyboard;
}

- (void)createHPGrowingTextView{
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.view addSubview:self.emoKeyboard];
    self.emoKeyboard.backgroundColor = K_Color_MainGray;
    self.emoKeyboard.textBarView.style = chat_textBar;
    _emoKeyboard.textBarView.textView.placeholderText = @"回复消息";
    [_emoKeyboard.textBarView.sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    
    KWEAKSELF;
    self.emoKeyboard.sendBlock = ^ {
        [weakSelf sendAction];
    };
    
    self.emoKeyboard.textBarView.sendMessageBlock = ^ {
        [weakSelf sendAction];
    };
    
    self.emoKeyboard.showBlock = ^(CGFloat height) {
        [weakSelf keyboardShowChatViewScroll:height];
    };
    
    self.emoKeyboard.changeBlock = ^(CGFloat eveheight, CGFloat height) {
        NSTimeInterval animationDuration = BShowTime;
        [weakSelf chatViewScrollAnimation:animationDuration andOffsetY:CGRectGetMinY(weakSelf.chatTableView.frame) - eveheight];
    };
}

#pragma mark -  键盘sendAction
-(void)sendAction{
    [self.emoKeyboard hideCustomerKeyBoard];
    [self restoreChatView];
    [self postBtnClick:nil];
}

- (void)restoreChatView {
    
    if (!self.emoKeyboard.imageboaudIsShow) {
        [UIView animateWithDuration:BShowTime animations:^{
            self.chatTableView.frame = CGRectMake(0, KNavi_ContainStatusBar_Height - self.emoKeyboard.ChangeHeight, KScreenWidth, KScreenHeight - KNavi_ContainStatusBar_Height - kToolBarH);
        }];
    }
}

////当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification {
    
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    
    height += self.emoKeyboard.ChangeHeight;
    [self keyboardShowChatViewScroll:height];
    
}

- (void)chatViewScrollAnimation:(NSTimeInterval)duration andOffsetY:(CGFloat)offsetY {
    CGRect frame = self.chatTableView.frame;
    CGRect rect = CGRectMake(0,offsetY,frame.size.width,frame.size.height);
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:duration];
    self.chatTableView.frame = rect;
    [UIView commitAnimations];
}

/**
 键盘升起，界面滚动避免遮挡
 @param customKeyboardHeight 自定义键盘高度
 */
- (void)keyboardShowChatViewScroll:(CGFloat)customKeyboardHeight {
    NSTimeInterval animationDuration = BShowTime;
    
    if (self.messageModelArr.count > 0) {
        
        NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messageModelArr.count - 1 inSection:0];
        [self.chatTableView visibleCells];
        UITableViewCell *lastCell = [self.chatTableView cellForRowAtIndexPath:lastIndexPath];
        
        if ([self.chatTableView.visibleCells containsObject:lastCell]) {
            
            CGRect lastFrame = lastCell.frame;
            CGFloat offsetY = CGRectGetMaxY(lastFrame) - (KScreenHeight - customKeyboardHeight);
            if (offsetY > 0) {
                [self.chatTableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
                [self chatViewScrollAnimation:animationDuration andOffsetY: -customKeyboardHeight];
            }
        } else {
            
            [self.chatTableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
            [self chatViewScrollAnimation:0 andOffsetY: -customKeyboardHeight];
        }
    }
    
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification {
    [self restoreChatView];
}

/**
 *  加载数据
 */
- (void)loadHistoryData:(NSString *)page {
    
    
}

- (void)updateData {
    [self.cellHeightDict removeAllObjects];
    [self loadHistoryData:[NSString stringWithFormat:@"%ld",(long)self.page]];
}

-(void)postBtnClick:(UIButton *)btn {
    NSString *messagestr = self.emoKeyboard.textBarView.textView.text;
    
    KWEAKSELF
    [self.HUD showLoadingMessag:@"" toView:nil];
    [DZMsgNetTool DZ_SendMsgToOtherUser:messagestr UserNamme:self.username touid:self.touid completion:^(BaseResModel *resModel, NSError *error) {
        [self.HUD hide];
        if (resModel) {
            if (resModel) {
                [MBProgressHUD showInfo:@"发送成功"];
                self.page = 0;
                weakSelf.isRefresh = YES;
                [self performSelector:@selector(updateData) withObject:nil afterDelay:1];
                self.emoKeyboard.textBarView.textView.text = @"";
            } else {
                [MBProgressHUD showInfo:@"发消息的时间间隔小于15秒，请稍后再试"];
            }
        }else{
            [self showServerError:error];
        }
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageModelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatcontent"];
    if (cell == nil) {
        cell = [[ChatContentCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"chatcontent"];
    }
    
    UILongPressGestureRecognizer * longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
    [cell.messageLabel addGestureRecognizer:longGesture];
    cell.messageModel = self.messageModelArr[indexPath.row];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goOtherCenter:)];
    cell.headView.tag = indexPath.row;
    [cell.headView addGestureRecognizer:tap];
    
    return cell;
}

- (void)goOtherCenter:(UITapGestureRecognizer *)sender {
    UIView *view = sender.view;
    MessageModel *model = self.messageModelArr[view.tag];
    [[DZMobileCtrl sharedCtrl] PushToOtherUserController:model.authorid];
}

//长按触发的事件
- (void)longAction:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        NSIndexPath *pressedIndexPath = [self.chatTableView indexPathForRowAtPoint:[sender locationInView:self.chatTableView]];
        
        ChatContentCell *cell = [self.chatTableView cellForRowAtIndexPath:pressedIndexPath];
        //一定要调用这个方法
        [cell.messageLabel becomeFirstResponder];
        //创建菜单控制器
        UIMenuController * menuvc = [UIMenuController sharedMenuController];
        UIMenuItem * menuItem = [[UIMenuItem alloc]initWithTitle:@"拷贝" action:@selector(copyAction)];
        UIMenuItem * menuItem1 = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(deleteAction)];
        menuvc.menuItems = @[menuItem,menuItem1];
        [menuvc setTargetRect:CGRectMake(cell.messageLabel.bounds.size.width/2, cell.messageLabel.bounds.origin.y, 0, 0) inView:cell.messageLabel];
        [menuvc setMenuVisible:YES animated:YES];
        
        self.pressIndexRow = pressedIndexPath.row;
        KWEAKSELF;
        cell.messageLabel.copyBlock = ^{
            [weakSelf copyText];
        };
        cell.messageLabel.deleteBlock = ^{
            [weakSelf deleteMessage];
        };
        
    }
}

// 只为了消除烦人的警告
- (void)copyAction {}
- (void)deleteAction {}

- (void)deleteMessage {
    
    MessageModel *msgModel = self.messageModelArr[self.pressIndexRow];
    [DZMsgNetTool DZ_DeleteOneMessage:msgModel.touid Pid:msgModel.pmid completion:^(BaseResModel *resModel, NSError *error) {
        if (resModel) {
            if (resModel.Message) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.pressIndexRow inSection:0];
                [self.messageModelArr removeObjectAtIndex:self.pressIndexRow];
                [self.cellHeightDict removeAllObjects];
                [self.chatTableView beginUpdates];
                [self.chatTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
                [self.chatTableView endUpdates];
            } else {
                [MBProgressHUD showInfo:@"删除失败"];
            }
        }else{
            [self showServerError:error];
        }
    }];
}

- (void)copyText {
    MessageModel *message = self.messageModelArr[self.pressIndexRow];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:message.text];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self endEdit];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.cellHeightDict[indexPath]) {
        self.cellHeightDict[indexPath] = @([self heightForRowAtIndexPath:indexPath tableView:tableView]);
    }
    return [self.cellHeightDict[indexPath] floatValue];
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGFloat height =[(ChatContentCell *)cell cellHeight];
    return height;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.emoKeyboard hideCustomerKeyBoard];
    [self restoreChatView];
    [self.view endEditing:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSMutableArray<MessageModel *> *)messageModelArr {
    if (!_messageModelArr) {
        _messageModelArr = [NSMutableArray array];
    }
    return _messageModelArr;
}

- (NSMutableDictionary *)sourceDic {
    if (!_sourceDic) {
        _sourceDic = [NSMutableDictionary dictionary];
    }
    return _sourceDic;
}

- (NSMutableDictionary *)cellHeightDict {
    if (!_cellHeightDict) {
        _cellHeightDict = [NSMutableDictionary dictionary];
    }
    return _cellHeightDict;
}

@end
