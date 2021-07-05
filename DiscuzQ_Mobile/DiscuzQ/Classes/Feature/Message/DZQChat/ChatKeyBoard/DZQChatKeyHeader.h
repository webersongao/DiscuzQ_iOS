//
//  DZQChatKeyHeader.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#ifndef DZQChatKeyHeader_h
#define DZQChatKeyHeader_h

//通过UIAlertController 来确定获取方式的时候需要传入键值对
//一下为键值对的key值 目前只提供三种 (相册 图库 摄像头)
#define DZQPickerWayFormIpc   @"DZQPickerWayFormIpc"
#define DZQPickerWayGallery   @"DZQPickerWayGallery"
#define DZQPickerWayCamer     @"DZQPickerWayCamer"

/**
 聊天界面底部的输入框视图
 */

#define DZQChatKeyInputBarH      55.0     //纯输入条 的高度

#define DZQChatKeyBarDefaultH      (55.0 + KTabbar_Gap) //初始化 的高度

#define DZQChatKeyBordBottomHeight     220    //底部视图的高度

//键盘总高度
#define DZQChatWidgetHeight    DZQChatKeyBordBottomHeight

//底部视图的顶部
#define DZQChatBtnSize           30           //按钮的大小
#define DZQChatBtnDistence       15.0           //控件之间的间隙
#define DZQChatTextWidth      kScreenWidth - (3*DZQChatBtnSize + 5* DZQChatBtnDistence)                       //输入框的宽度
#define DZQChatTextHeight        40           //输入框的高度
#define DZQChatTextMaxHeight     100           //输入框的最大高度

#define DZQChatTMarginDefault    kMargin15 //输入框上下间隙和
#define DZQChatBMarginDefault   kMargin25  //按钮上下间隙 和

#define DZQChatTBottomDistence   (DZQChatKeyInputBarH - DZQChatTextHeight)/2.0            //输入框上下间隙
#define DZQChatBBottomDistence  (DZQChatKeyInputBarH - DZQChatBtnSize)/2.0       //按钮上下间隙




// 访问方式
typedef NS_ENUM(NSInteger,DZQImgPickerStyle) {
    DZQImgPickerFormIpc=1, // 访问相册
    DZQImgPickerGallery,  // 访问图库
    DZQImgPickerCamer, // 访问摄像头
};


// 获取资源类型
typedef NS_ENUM(NSInteger,DZQImgPickerModelType) {
    DZQImgPickerModelImage=1, // 获取图片
    DZQImgPickerModelGif=2, // 获取Gif
    DZQImgPickerModelVideo, // 获取视频
    DZQImgPickerModelAll, // 全部获取
};



/**
 获取资源后的回调代码块

 @param wayStyle 获取资源的方式
 @param modelType 获取到的资源类型（图片 视频）
 @param object 返回的资源数据 图片直接返回UIImage对象 视频返回本地视频链接
 */
typedef void (^DZQImgPickerPicekerBlock)(DZQImgPickerStyle wayStyle,DZQImgPickerModelType modelType,id object);



/// 底部按钮点击的五种状态
typedef NS_ENUM(NSInteger,DZQKeyStatus) {
    DZQKeyStatusDefault = 1, // 默认在底部的状态
    DZQKeyStatusVoice,  // 准备发语音
    DZQKeyStatusEdit,  // 准备编辑文本
    DZQKeyStatusSymbol, // 准备发送表情
    DZQKeyStatusAdd, // 准备发送其他功能
};


// 弹出多功能界面是表情还是其他功能
typedef NS_ENUM(NSInteger,DZQKeyBordFuncType) {
    DZQKeyBordFunc_Add = 1,  // 多功能
    DZQKeyBordFunc_Symbol, // 表情
};


//表情视图的表单cell
#define DeleteButtonId  @"DeleteEmojiButtonId"

//表情的行数 列数
#define DZQChatEmojiRow     3
#define DZQChatEmojiLine    7

//系统自带表情的参数
#define EMOJI_CODE_TO_SYMBOL(x) ((((0x808080F0 | (x & 0x3F000) >> 4) | (x & 0xFC0) << 10) | (x & 0x1C0000) << 18) | (x & 0x3F) << 24);





#endif /* DZQChatKeyHeader_h */
