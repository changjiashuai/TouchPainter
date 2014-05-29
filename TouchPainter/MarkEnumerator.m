//
//  MarkEnumerator.m
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "MarkEnumerator.h"
#import "MarkEnumerator_Internal.h"

@implementation MarkEnumerator

- (NSArray *)allObjects
{
    // returns an array of yet-visited Mark nodes
    // i.e. the remaining emlements in the stack
    return [[stack_ reverseObjectEnumerator] allObjects];
}

-(id)nextObject
{
    return [stack_ pop];
}


#pragma mark -
#pragma mark Private Methods

- (id)initWithMark:(id<Mark>)mark
{
    if (self = [super init]) {
        stack_ = [[NSMutableArray alloc] initWithCapacity:[mark count]];
        
        // post-orderly traverse the whole Mark aggregate
        // and add individual Marks in a private stack
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

- (void)traverseAndBuildStackWithMark:(id<Mark>)mark
{
    // push post-order traversal
    // into the stack
    if (nil == mark) {
        return;
    }
    [stack_ push:mark];
    NSUInteger index = [mark count];
    id <Mark> childMark;
    while ((childMark = [mark childMarkAtIndex:--index])) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

@end
