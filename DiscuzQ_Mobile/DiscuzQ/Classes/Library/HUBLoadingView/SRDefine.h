//
//  SRDefine.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/10/10.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#ifndef SlimeRefresh_SRDefine_h
#define SlimeRefresh_SRDefine_h

//==============编译时手动选择加载动画 modify by sxd ================
#define USE_UIACTIVTYINDICATORVIEW  //使用系统的加载动画 或者 三色球(垂直视角)  Teaque 4.0
#define USE_THREEBALL_LOADINGVIEW   //使用三色球(水平视角)加载动画            Teaque 5.0
//===============================================================

#ifdef USE_THREEBALL_LOADINGVIEW
#undef USE_UIACTIVTYINDICATORVIEW
#endif

#define kStartTo    0.7f
#define kEndTo      0.15f

#define kRefreshImageWidth  17.0f
#define kAnimationInterval  (1.0f/50.0f)

#ifdef USE_THREEBALL_LOADINGVIEW
    #define kTBLoadingDefaultHeight 50.0f
#elif defined USE_UIACTIVTYINDICATORVIEW
    #define kTBLoadingDefaultHeight 32.0f
#endif

#define kBallOffsetY 25
#define kBallSize   7
#define kImageViewSize  100/2 //35

NS_INLINE CGFloat distansBetween(CGPoint p1 , CGPoint p2) {
    return sqrtf((p1.x - p2.x)*(p1.x - p2.x) + (p1.y - p2.y)*(p1.y - p2.y));
}
#endif
