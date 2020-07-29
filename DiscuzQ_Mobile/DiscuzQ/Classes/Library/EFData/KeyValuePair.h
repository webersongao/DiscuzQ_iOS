//
// Created by yizhuolin on 12-9-13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface KeyValuePair : NSObject

- (id)initWithKey:(id)key andValue:(id)value;

@property (nonatomic) id key;

@property (nonatomic) id value;

@end