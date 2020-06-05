//
//  SpaceModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserItemModel.h"
#import "PrivacyModel.h"

@interface SpaceModel : NSObject

@property (nonatomic, copy) NSString *uid;  //!< 属性注释
@property (nonatomic, copy) NSString *username;  //!< 属性注释
@property (nonatomic, copy) NSString *status;  //!< 属性注释
@property (nonatomic, copy) NSString *emailstatus;  //!< 属性注释
@property (nonatomic, copy) NSString *avatarstatus;  //!< 属性注释
@property (nonatomic, copy) NSString *videophotostatus;  //!< 属性注释
@property (nonatomic, copy) NSString *adminid;  //!< 属性注释
@property (nonatomic, copy) NSString *groupid;  //!< 属性注释
@property (nonatomic, copy) NSString *groupexpiry;  //!< 属性注释
@property (nonatomic, copy) NSString *extgroupids;  //!< 属性注释
@property (nonatomic, copy) NSString *regdate;  //!< 属性注释
@property (nonatomic, copy) NSString *credits;  //!< 属性注释
@property (nonatomic, copy) NSString *notifysound;  //!< 属性注释
@property (nonatomic, copy) NSString *timeoffset;  //!< 属性注释
@property (nonatomic, copy) NSString *newpm;  //!< 属性注释
@property (nonatomic, copy) NSString *newprompt;  //!< 属性注释
@property (nonatomic, copy) NSString *accessmasks;  //!< 属性注释
@property (nonatomic, copy) NSString *allowadmincp;  //!< 属性注释
@property (nonatomic, copy) NSString *onlyacceptfriendpm;  //!< 属性注释
@property (nonatomic, copy) NSString *conisbind;  //!< 属性注释
@property (nonatomic, copy) NSString *freeze;  //!< 属性注释
@property (nonatomic, copy) NSString *selfId;  //!< 属性注释
@property (nonatomic, assign) BOOL isfriend;  //!< 是否是好友关系 （字段慎用）
@property (nonatomic, copy) NSString *extcredits1;  //!< 威望
@property (nonatomic, copy) NSString *extcredits2;  //!< 金钱
@property (nonatomic, copy) NSString *extcredits3;  //!< 贡献
@property (nonatomic, copy) NSString *extcredits4;  //!< 属性注释
@property (nonatomic, copy) NSString *extcredits5;  //!< 属性注释
//@property (nonatomic, copy) NSString *extcredits6;  //!< 属性注释
//@property (nonatomic, copy) NSString *extcredits7;  //!< 属性注释
//@property (nonatomic, copy) NSString *extcredits8;  //!< 属性注释
@property (nonatomic, copy) NSString *friends;  //!< 属性注释
@property (nonatomic, copy) NSString *posts;  //!< 属性注释
@property (nonatomic, copy) NSString *threads;  //!< 属性注释
@property (nonatomic, copy) NSString *digestposts;  //!< 属性注释
@property (nonatomic, copy) NSString *doings;  //!< 属性注释
@property (nonatomic, copy) NSString *blogs;  //!< 属性注释
@property (nonatomic, copy) NSString *albums;  //!< 属性注释
@property (nonatomic, copy) NSString *sharings;  //!< 属性注释
@property (nonatomic, copy) NSString *attachsize;  //!< 属性注释
@property (nonatomic, copy) NSString *views;  //!< 属性注释
@property (nonatomic, copy) NSString *oltime;  //!< 属性注释
@property (nonatomic, copy) NSString *todayattachs;  //!< 属性注释
@property (nonatomic, copy) NSString *todayattachsize;  //!< 属性注释
@property (nonatomic, copy) NSString *feeds;  //!< 属性注释
@property (nonatomic, copy) NSString *follower;  //!< 属性注释
@property (nonatomic, copy) NSString *following;  //!< 属性注释
@property (nonatomic, copy) NSString *newfollower;  //!< 属性注释
@property (nonatomic, copy) NSString *blacklist;  //!< 属性注释
@property (nonatomic, copy) NSString *videophoto;  //!< 属性注释
@property (nonatomic, copy) NSString *spacename;  //!< 属性注释
@property (nonatomic, copy) NSString *spacedescription;  //!< 属性注释
@property (nonatomic, copy) NSString *domain;  //!< 属性注释
@property (nonatomic, copy) NSString *addsize;  //!< 属性注释
@property (nonatomic, copy) NSString *addfriend;  //!< 属性注释
@property (nonatomic, copy) NSString *menunum;  //!< 属性注释
@property (nonatomic, copy) NSString *theme;  //!< 属性注释
@property (nonatomic, copy) NSString *spacecss;  //!< 属性注释
@property (nonatomic, copy) NSString *blockposition;  //!< 属性注释
@property (nonatomic, copy) NSString *recentnote;  //!< 属性注释
@property (nonatomic, copy) NSString *spacenote;  //!< 属性注释

@property (nonatomic, strong) PrivacyModel *privacy;  //!< 属性注释

@property (nonatomic, copy) NSString *feedfriend;  //!< 属性注释
@property (nonatomic, copy) NSArray *acceptemail;  //!< 属性注释
@property (nonatomic, copy) NSString *magicgift;  //!< 属性注释
@property (nonatomic, copy) NSString *stickblogs;  //!< 属性注释
@property (nonatomic, copy) NSString *publishfeed;  //!< 属性注释
@property (nonatomic, copy) NSString *customshow;  //!< 属性注释
@property (nonatomic, copy) NSString *customstatus;  //!< 属性注释
@property (nonatomic, copy) NSString *medals;  //!< 属性注释
@property (nonatomic, copy) NSString *sightml;  //!< 属性注释
@property (nonatomic, copy) NSString *groupterms;  //!< 属性注释
@property (nonatomic, copy) NSString *authstr;  //!< 属性注释
@property (nonatomic, copy) NSString *groups;  //!< 属性注释
@property (nonatomic, copy) NSString *attentiongroup;  //!< 属性注释
@property (nonatomic, copy) NSString *gender;  //!< 属性注释
@property (nonatomic, copy) NSString *birthyear;  //!< 属性注释
@property (nonatomic, copy) NSString *birthmonth;  //!< 属性注释
@property (nonatomic, copy) NSString *birthday;  //!< 属性注释
@property (nonatomic, copy) NSString *constellation;  //!< 属性注释
@property (nonatomic, copy) NSString *zodiac;  //!< 属性注释
@property (nonatomic, copy) NSString *nationality;  //!< 属性注释
@property (nonatomic, copy) NSString *birthprovince;  //!< 属性注释
@property (nonatomic, copy) NSString *birthcity;  //!< 属性注释
@property (nonatomic, copy) NSString *birthdist;  //!< 属性注释
@property (nonatomic, copy) NSString *birthcommunity;  //!< 属性注释
@property (nonatomic, copy) NSString *resideprovince;  //!< 属性注释
@property (nonatomic, copy) NSString *residecity;  //!< 属性注释
@property (nonatomic, copy) NSString *residedist;  //!< 属性注释
@property (nonatomic, copy) NSString *residecommunity;  //!< 属性注释
@property (nonatomic, copy) NSString *residesuite;  //!< 属性注释
@property (nonatomic, copy) NSString *graduateschool;  //!< 属性注释
@property (nonatomic, copy) NSString *company;  //!< 属性注释
@property (nonatomic, copy) NSString *education;  //!< 属性注释
@property (nonatomic, copy) NSString *occupation;  //!< 属性注释
@property (nonatomic, copy) NSString *position;  //!< 属性注释
@property (nonatomic, copy) NSString *revenue;  //!< 属性注释
@property (nonatomic, copy) NSString *affectivestatus;  //!< 属性注释
@property (nonatomic, copy) NSString *lookingfor;  //!< 属性注释
@property (nonatomic, copy) NSString *bloodtype;  //!< 属性注释
@property (nonatomic, copy) NSString *height;  //!< 属性注释
@property (nonatomic, copy) NSString *weight;  //!< 属性注释
@property (nonatomic, copy) NSString *site;  //!< 属性注释
@property (nonatomic, copy) NSString *bio;  //!< 属性注释
@property (nonatomic, copy) NSString *interest;  //!< 属性注释
@property (nonatomic, copy) NSString *field1;  //!< 属性注释
@property (nonatomic, copy) NSString *field2;  //!< 属性注释
@property (nonatomic, copy) NSString *field3;  //!< 属性注释
@property (nonatomic, copy) NSString *field4;  //!< 属性注释
@property (nonatomic, copy) NSString *field5;  //!< 属性注释
@property (nonatomic, copy) NSString *field6;  //!< 属性注释
@property (nonatomic, copy) NSString *field7;  //!< 属性注释
@property (nonatomic, copy) NSString *field8;  //!< 属性注释
@property (nonatomic, copy) NSString *port;  //!< 属性注释
@property (nonatomic, copy) NSString *lastvisit;  //!< 属性注释
@property (nonatomic, copy) NSString *lastactivity;  //!< 属性注释
@property (nonatomic, copy) NSString *lastpost;  //!< 属性注释
@property (nonatomic, copy) NSString *lastsendmail;  //!< 属性注释
@property (nonatomic, copy) NSString *invisible;  //!< 属性注释
@property (nonatomic, copy) NSString *buyercredit;  //!< 属性注释
@property (nonatomic, copy) NSString *sellercredit;  //!< 属性注释
@property (nonatomic, copy) NSString *favtimes;  //!< 属性注释
@property (nonatomic, copy) NSString *sharetimes;  //!< 属性注释
@property (nonatomic, copy) NSString *profileprogress;  //!< 属性注释


@property (nonatomic, strong) AdmingroupModel *admingroup;  //!< 属性注释
@property (nonatomic, strong) UserGroupModel *group;  //!< 属性注释

@property (nonatomic, copy) NSString *lastactivitydb;  //!< 属性注释
@property (nonatomic, copy) NSString *buyerrank;  //!< 属性注释
@property (nonatomic, copy) NSString *sellerrank;  //!< 属性注释
@property (nonatomic, copy) NSString *groupiconid;  //!< 属性注释
@property (nonatomic, copy) NSString *avatar;  //!< 属性注释



@end


