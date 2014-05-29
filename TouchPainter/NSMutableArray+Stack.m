//
//  NSMutableArray+Stack.m
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)object
{
    if (nil != object) {
        [self addObject:object];
    }
}

- (id)pop
{
    if ([self count] == 0) {
        return nil;
    }
    
    id object = [self lastObject];
    [self removeLastObject];
    return object;
}

- (void)dropBottom
{
    if ([self count] == 0) {
        return;
    }
    [self removeObjectAtIndex:0];
}

@end
