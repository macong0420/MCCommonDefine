//
//  NSObject+ZHSafeObject.m
//  ZongHeng
//
//  Created by 马聪聪 on 2018/9/20.
//  Copyright © 2018 ZongHeng. All rights reserved.
//

#import "NSObject+ZHSafeObject.h"

@implementation NSObject (ZHSafeObject)

+(BOOL)isnull:(id)obj {
    
    if (obj == nil || [obj isEqual:[NSNull null]]) {
        return  YES;
    }
    if ([obj isKindOfClass:[NSString class]]) {
        
        if (obj == nil || [obj isEqualToString:@""] || [obj isEqualToString:@"(null)"]) {
            return YES;
        }
    }
    
    if ([obj isKindOfClass:[NSNumber class]]) {
        if (obj == NULL || obj == nil) {
            return YES;
        }
    }
    
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray * arr = (NSArray *)obj;
        if (arr.count == 0 || obj == nil) {
            return YES;
        }
    }
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dic = (NSDictionary *)obj;
        if (dic.count == 0 || obj == nil) {
            return YES;
        }
    }
    
    return NO;
}

- (NSString *(^)(id obj))safeString {
    return ^NSString *(id obj){
        return  [NSObject isnull:obj] ? @"" : [NSString stringWithFormat:@"%@",obj];
    };
}

- (NSNumber *(^)(id object))safeNumber {
    return ^NSNumber *(id obj){
        
        NSInteger intObj = (NSInteger)[obj integerValue];
        float floatObj = [obj floatValue];
        if (intObj != floatObj) {
            
            return [NSObject isnull:obj]?[NSNumber numberWithFloat:0]:[NSNumber numberWithFloat:floatObj];
        }
        return [NSObject isnull:obj]?[NSNumber numberWithInt:0]:[NSNumber numberWithInteger:intObj];
        
    };
}


- (NSNumber *(^)(id object))safeIntNumber {
    return ^NSNumber *(id obj) {
        NSInteger intNumber = [obj integerValue];
        return [NSObject isnull:obj]?[NSNumber numberWithInt:0]:[NSNumber numberWithInteger:intNumber];
    };
}

- (NSNumber *(^)(id object))safeFloatNumber {
    
    return ^NSNumber *(id obj) {
        float floatobject = [obj floatValue];
        return [NSObject isnull:obj]?[NSNumber numberWithFloat:0]:[NSNumber numberWithFloat:floatobject];
    };
}

@end
