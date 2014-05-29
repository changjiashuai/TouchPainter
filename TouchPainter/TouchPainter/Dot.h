//
//  Dot.h
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "Vertex.h"

@protocol MarkVisitor;

@interface Dot : Vertex
{
    @private
    UIColor *color_;
    CGFloat size_;
}

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;

// for the Visitor pattern
- (void) acceptMarkVisitor:(id<MarkVisitor>)visitor;

// for the Prototype pattern
- (id) copyWithZone:(NSZone *)zone;

// for the Memento pattern
- (id) initWithCoder:(NSCoder *)coder;
- (void) encodeWithCoder:(NSCoder *)coder;

@end
