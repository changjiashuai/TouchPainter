//
//  MarkEnumerator.h
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"
#import "Mark.h"

@interface MarkEnumerator : NSEnumerator
{
    @private
    NSMutableArray *stack_;
}

- (NSArray *)allObjects;
- (id)nextObject;

@end
