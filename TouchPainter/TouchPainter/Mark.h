//
//  Mark.h
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

@protocol Mark <NSObject, NSCopying, NSCoding>

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;// 子节点的个数
@property (nonatomic, readonly) id <Mark> lastChild;

- (id) copy;
- (void) addMark:(id <Mark>)mark;
- (void) removeMark:(id <Mark>)mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger)index;

// for the Visitor pattern
- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor;

// for the Iterator pattern
- (NSEnumerator *)enumerator;

// for internal iterator implementation
- (void) enumerateMarksUsingBlock:(void (^)(id <Mark> item, BOOL *stop))block;

// for a bad example
- (void) drawWithContext:(CGContextRef)context;

@end
