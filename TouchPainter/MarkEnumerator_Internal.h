//
//  MarkEnumerator_Internal.h
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "MarkEnumerator.h"

@interface MarkEnumerator ()

- (id) initWithMark:(id <Mark>)mark;
- (void) traverseAndBuildStackWithMark:(id <Mark>)mark;

@end
