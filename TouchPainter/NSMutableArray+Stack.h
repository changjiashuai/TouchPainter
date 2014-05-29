//
//  NSMutableArray+Stack.h
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

- (void) push:(id)object;
- (void) dropBottom;
- (id) pop;

@end
