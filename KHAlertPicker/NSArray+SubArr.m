//
//  NSArray+SubArr.m
//  KHAlertPicker
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 Arron_zkh. All rights reserved.
//

#import "NSArray+SubArr.h"

@implementation NSArray (SubArr)

- (BOOL)hasSubArrInside{
    
    id firstObject = [self firstObject];
    
    if ([firstObject isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return NO;
}

@end
