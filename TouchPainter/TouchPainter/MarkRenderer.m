//
//  MarkRenderer.m
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "MarkRenderer.h"

@implementation MarkRenderer

- (id)initWithCGContext:(CGContextRef)context
{
    if (self = [super init]) {
        context_ = context;
        shouldMoveContextToDot_ = YES;
    }
    return self;
}

-(void)visitMark:(id<Mark>)mark
{
    // default behavior
}

- (void)visitDot:(Dot *)dot
{
    CGFloat x = [dot location].x;
    CGFloat y = [dot location].y;
    CGFloat frameSize = [dot size];
    CGRect frame = CGRectMake(x - frameSize / 2.0, y - frameSize / 2.0, frameSize, frameSize);
    CGContextSetFillColorWithColor(context_, [[dot color] CGColor]);
    CGContextFillEllipseInRect(context_, frame);
}

- (void)visitVertex:(Vertex *)vertex
{
    CGFloat x = [vertex location].x;
    CGFloat y = [vertex location].y;
    
    if (shouldMoveContextToDot_) {
        CGContextMoveToPoint(context_, x, y);
        shouldMoveContextToDot_ = NO;
    }else{
        CGContextAddLineToPoint(context_, x, y);
    }
}

- (void)visitStroke:(Stroke *)stroke
{
    CGContextSetStrokeColorWithColor(context_, [[stroke color] CGColor]);
    CGContextSetLineWidth(context_, [stroke size]);
    CGContextSetLineCap(context_, kCGLineCapRound);
    CGContextStrokePath(context_);
    shouldMoveContextToDot_ = YES;
}

@end
