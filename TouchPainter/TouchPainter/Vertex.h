//
//  Vertex.h
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@protocol MarkVisitor;

@interface Vertex : NSObject <Mark>
{
    @protected
    CGPoint location_;
}

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id<Mark> lastChild;

- (id) initWithLocation:(CGPoint)location;
- (void) addMark:(id<Mark>)mark;
- (void) removeMark:(id<Mark>) mark;
- (id<Mark>) childMarkAtIndex:(NSUInteger)index;

// for the Visitor pattern
- (void) acceptMarkVisitor:(id<MarkVisitor>)visitor;

// for the Prototype pattern
- (id) copyWithZone:(NSZone *)zone;

// for the Iterator pattern
- (NSEnumerator *)enumerator;

// for internal iterator implementation
- (void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *stop))block;

// for the Memento pattern
- (id) initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

@end
