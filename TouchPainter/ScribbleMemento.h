//
//  ScribbleMemento.h
//  TouchPainter
//
//  Created by CJS on 14-6-1.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface ScribbleMemento : NSObject
{
    @private
    id <Mark> mark_;
    BOOL hasCompleteSnapshot_;
}

+ (ScribbleMemento *) mementoWithData:(NSData *)data;
- (NSData *) data;

@end
