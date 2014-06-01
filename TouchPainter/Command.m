//
//  Command.m
//  TouchPainter
//
//  Created by CJS on 14-6-1.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "Command.h"

@implementation Command

@synthesize userInfo = userInfo_;

- (void)execute
{
    // should throw an exception.
}

- (void)undo
{
    // do nothing
    // subclass need to override this
    // method to perform actual undo.
}

@end
