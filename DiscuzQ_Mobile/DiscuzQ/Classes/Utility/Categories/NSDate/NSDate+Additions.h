//
//  NSDate+Additions.h
//  ChatRoom_Demo
//
//  Created by Gao on 14-11-3.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)

+ (NSCalendar *) currentCalendar;
+ (NSDate *)convertDateToLocalTime: (NSDate *)forDate;

#pragma mark - 相对日期
+ (NSDate *) dateNow;
+ (NSDate *) dateTomorrow;
+ (NSDate *) dateYesterday;
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;
//超过一年返回nil，没超过一年返回原值
+ (NSString *)beyongOneYearWithTime:(NSString *)time;

#pragma mark - 日期转字符串
- (NSString *) stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
- (NSString *) stringWithFormat: (NSString *) format;
@property (nonatomic, readonly) NSString *shortString;
@property (nonatomic, readonly) NSString *shortDateString;
@property (nonatomic, readonly) NSString *shortTimeString;
@property (nonatomic, readonly) NSString *mediumString;
@property (nonatomic, readonly) NSString *mediumDateString;
@property (nonatomic, readonly) NSString *mediumTimeString;
@property (nonatomic, readonly) NSString *longString;
@property (nonatomic, readonly) NSString *longDateString;
@property (nonatomic, readonly) NSString *longTimeString;

#pragma mark - 日期比较
- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate;

- (BOOL) isToday;
- (BOOL) isTomorrow;
- (BOOL) isYesterday;

- (BOOL) isSameWeekAsDate: (NSDate *) aDate;
- (BOOL) isThisWeek;
- (BOOL) isNextWeek;
- (BOOL) isLastWeek;

- (BOOL) isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) isThisMonth;
- (BOOL) isNextMonth;
- (BOOL) isLastMonth;

- (BOOL) isSameYearAsDate: (NSDate *) aDate;
- (BOOL) isThisYear;
- (BOOL) isNextYear;
- (BOOL) isLastYear;

- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;

- (BOOL) isInFuture;
- (BOOL) isInPast;

#pragma mark - 日期规则
- (BOOL) isTypicallyWorkday;
- (BOOL) isTypicallyWeekend;

#pragma mark - 调整日期
- (NSDate *) dateByAddingYears: (NSInteger) dYears;
- (NSDate *) dateBySubtractingYears: (NSInteger) dYears;
- (NSDate *) dateByAddingMonths: (NSInteger) dMonths;
- (NSDate *) dateBySubtractingMonths: (NSInteger) dMonths;
- (NSDate *) dateByAddingDays: (NSInteger) dDays;
- (NSDate *) dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) dateByAddingHours: (NSInteger) dHours;
- (NSDate *) dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes;

#pragma mark - 极端日期
- (NSDate *) dateAtStartOfDay;
- (NSDate *) dateAtEndOfDay;

#pragma mark - 日期间隔
- (NSInteger) minutesAfterDate: (NSDate *) aDate;
- (NSInteger) minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) hoursAfterDate: (NSDate *) aDate;
- (NSInteger) hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) daysAfterDate: (NSDate *) aDate;
- (NSInteger) daysBeforeDate: (NSDate *) aDate;
- (NSInteger) distanceInDaysToDate:(NSDate *)anotherDate;

#pragma mark - 分解日期
@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger weekOfMonth;
@property (readonly) NSInteger weekOfYear;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;


- (NSString*)transformToFuzzyDate;
+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;
- (NSString*)getTimeStringformat:(NSString *)format;

+ (double)timeIntervalWithDateString:(NSString *)dateString;

+ (NSString *)ymdHmsFormat;
+ (NSString *)ymdFormat;

/// 年月日时分秒格式  是否在活动期间
+(BOOL)isCanDiscountOfStartTimeStr:(NSString *)startTimeStr endTimeStr:(NSString *)endTimeStr;

/// 距离结束时间是否在100小时之内
+(BOOL)isCurrentTimeToEndTimeIn100Hours:(NSString *)endTimeStr;

/// 判断两个时间 哪个时间结束的更早
+ (double)chooseTimeWhichTimeEndEarlier:(NSString *)firstTime annotherTime:(NSString *)secendTime;

+ (double)cacaulatTimeIntervalWithTimeString:(NSString *)firstTime;

+ (NSDate *)dateFromString:(NSString *)date;
+ (NSTimeInterval)longFromDate:(NSDate *)date;
+ (NSTimeInterval)cacaulatTimeInterval:(NSString *)firstTime between:(NSString *)secondTime;

+ (NSDate *)dateFromBeijing:(NSString *)dateString;

@end
