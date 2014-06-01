//
//  ScribbleMemento_Friend.h
//  TouchPainter
//
//  Created by CJS on 14-6-1.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "ScribbleMemento.h"

@interface ScribbleMemento ()

- (instancetype) initWithMark:(id <Mark>)aMark;

@property (nonatomic, copy) id<Mark>mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot;

@end
