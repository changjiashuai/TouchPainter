//
//  Scribble.h
//  TouchPainter
//
//  Created by CJS on 14-6-1.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"

@interface Scribble : NSObject
{
    @private
    id<Mark> parentMark_;
    id<Mark> incrementalMark_;
}

// methods for Mark management

- (void) addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void) removeMark:(id<Mark>)aMark;

// methods for memento

-(instancetype)initWithMemento:(ScribbleMemento *)aMemento;
+(Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento;
-(ScribbleMemento *)scribbleMemento;
-(ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;
-(void)attachStateFromMemento:(ScribbleMemento *)memento;

@end
