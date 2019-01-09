//
//  NSObject+ZHSafeObject.h
//  ZongHeng
//
//  Created by 马聪聪 on 2018/9/20.
//  Copyright © 2018 ZongHeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZHSafeObject)
//判断是否为空
+(BOOL)isnull:(id)obj;

//空就返回空字符串
-(NSString *(^)(id object))safeString;

//空返回为0的number 类型
-(NSNumber *(^)(id object))safeNumber;

//空返回为0的number  强转int类型
-(NSNumber *(^)(id object))safeIntNumber;

//空返回为0的number  强转float类型
-(NSNumber *(^)(id object))safeFloatNumber;
@end

NS_ASSUME_NONNULL_END
