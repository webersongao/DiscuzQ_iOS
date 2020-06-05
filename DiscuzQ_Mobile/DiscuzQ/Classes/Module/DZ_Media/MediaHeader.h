//
//  MediaHeader.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/20.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#ifndef HoHeader_h
#define HoHeader_h

#define  kHomeSegmentHeight  44.f
#define  kHomeHeaderHeight   KWidthScale(80.f)


#define  kLineSpacing       KWidthScale(0.f)   //    行间距 |
#define  kItemSpacing       kCellMargins //    item之间的最小列间距  实际上是自动计算
#define  kCellMargins       KWidthScale(15.f)  //    左右缩进
#define  kRowNumber         4.0    //列数
#define  kCellWidth         ((KScreenWidth - (kCellMargins * 2) - ((kRowNumber-1.0) * kItemSpacing))/kRowNumber)  //    Cell宽度
#define  kCellHeight        KWidthScale(60.f)  //    Cell高度
#define  kHeaderIconHeight  KWidthScale(40.f)




#endif /* HoHeader_h */
