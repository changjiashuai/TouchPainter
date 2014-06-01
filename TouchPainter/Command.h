//
//  Command.h
//  TouchPainter
//
//  Created by CJS on 14-6-1.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Command : NSObject
{
    @protected
    NSDictionary *userInfo_;
}

@property (nonatomic, retain) NSDictionary *userInfo;

- (void) execute;
- (void) undo;

@end
