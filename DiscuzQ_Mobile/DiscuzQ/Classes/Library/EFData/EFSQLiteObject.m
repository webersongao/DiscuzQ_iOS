//
// Created by yizhuolin on 12-10-19.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <objc/runtime.h>
#import "EFSQLiteObject.h"
#import "KeyValuePair.h"
#import "NSObject+Dictionary.h"

@implementation EFSQLData

- (NSDictionary *)EF_modelToDictionary{
    return [self DZQ_ModelToDictionary];
}

@end

@interface EFSQLiteObject () {
    NSMutableArray *_changedProperties;
    BOOL _isKVORegistered;
    NSArray *_fieldsForPersistence;
}

- (void)registerForKVO;

- (void)unregisterFromKVO;

@end

@implementation EFSQLiteObject

- (NSArray *)changedFields
{
    return _changedProperties;
}

- (void)startUpdateProperties:(NSArray *)properties
{
    if (properties) {
        _changedProperties = [[NSMutableArray alloc] initWithArray:properties];
    }
}

- (void)removeUpdateProperties
{
    if (_changedProperties) {
        [_changedProperties removeAllObjects];
    }
}

- (NSArray *)fieldsForPersistence
{
    if (!_fieldsForPersistence) {
        NSMutableArray *propertyList = [[NSMutableArray alloc] init];
        Class class = [self class];
        
        while (class != [EFSQLiteObject class]) {
            unsigned int count;
            objc_property_t *properties = class_copyPropertyList(class, &count);
            
            NSArray *excludedProperties = self.excludedFields;
            NSMutableArray *addedProperties = [[NSMutableArray alloc] init];
            
            for (int i = 0; i < count; i++) {
                KeyValuePair *pair = [[KeyValuePair alloc] initWithKey:@(property_getName(properties[i])) andValue:@(property_getAttributes(properties[i]))];
                
                if (![excludedProperties containsObject:pair.key] && ![addedProperties containsObject:pair.key]) {
                    [propertyList addObject:pair];
                    [addedProperties addObject:pair.key];
                }
            }
            
            free(properties);
            
            class = [class superclass];
        }
        
        _fieldsForPersistence = propertyList;
    }
    
    return _fieldsForPersistence;
}

- (void)startModification
{
    _changedProperties = [[NSMutableArray alloc] init];
    if (_isKVORegistered == NO) {
        [self registerForKVO];
    }
}

- (void)endModification
{
    [_changedProperties removeAllObjects];
    
    if (_isKVORegistered) {
        [self unregisterFromKVO];
    }
}

+(NSDictionary<NSString *,Class> *)blobFields{
    return @{};
}

#pragma mark - private

- (void)registerForKVO
{
//    KSLog("register");
    _isKVORegistered = YES;
    NSArray *observableKeypaths = self.fieldsForPersistence;
    for (KeyValuePair *pair in observableKeypaths) {
        [self addObserver:self forKeyPath:pair.key options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (void)unregisterFromKVO {
//    KSLog("unregister");
    _isKVORegistered = NO;
    NSArray *observableKeypaths = self.fieldsForPersistence;
    for (KeyValuePair *pair in observableKeypaths) {
        
        @try {
            [self removeObserver:self forKeyPath:pair.key];
        } @catch (NSException *exception) {
            
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    for (KeyValuePair *pair in self.fieldsForPersistence) {
        if ([((NSString *) pair.key) isEqualToString:keyPath] && ![self.primaryKey containsObject:keyPath]) {
            [_changedProperties addObject:keyPath];
        }
    }
}

- (void)dealloc
{
    if (_isKVORegistered) {
        [self unregisterFromKVO];
    }
}

@end
