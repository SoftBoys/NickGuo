//
//  NSObject+Class.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/5/16.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "NSObject+Class.h"

@implementation NSObject (Class)
- (BOOL)isArrayClass {
    return [self isKindOfClass:[NSArray class]];
}
- (BOOL)isStringClass {
    return [self isKindOfClass:[NSString class]];
}
- (BOOL)isDictionaryClass {
    return [self isKindOfClass:[NSDictionary class]];
}
@end
