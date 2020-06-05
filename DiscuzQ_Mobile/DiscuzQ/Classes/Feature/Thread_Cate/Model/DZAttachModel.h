//
//  DZAttachModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZAttachModel : NSObject

//"aid": "5",
//"tid": "33",
//"pid": "42",
//"uid": "10013",
//"dateline": "1575614004",
//"filename": "人身保险伤残评定标准（行业标准）-太保安联.docx",
//"filesize": "59055",
//"attachment": "https://www.bushcraftcn.com/data/attachment/forum/201912/06/143324jls0fwu8vfi4syls.attach",
//"remote": "0",
//"description": "附件的描述",
//"readperm": "0",
//"price": "30",
//"isimage": "0",
//"width": "0",
//"thumb": "https://www.bushcraftcn.com/api/mobile/?module=forumimage&aid=5&size=268x380&key=e7b632e5ea3d4a53&version=5",
//"picid": "0",
//"type": ""


@property (nonatomic, copy) NSString *aid;
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *pid;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *dateline;

@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *filesize;
@property (nonatomic, copy) NSString *remote;
@property (nonatomic, copy) NSString *attch_desc;  // 描述文字 description
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *isimage;
@property (nonatomic, assign) float width;  //!< 属性注释
@property (nonatomic, copy) NSString *picid;

@property (nonatomic, copy) NSString *attachment;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *readperm;
@property (nonatomic, copy) NSString *type;


@end

