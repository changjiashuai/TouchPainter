//
//  Stroke.m
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator_Internal.h"

@implementation Stroke

@synthesize color = color_, size = size_;
@dynamic location;

-(id)init
{
    if (self = [super init]) {
        children_ = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)setLocation:(CGPoint)location
{
    // it does't set any arbitrary location
}

- (CGPoint)location
{
    //返回第一个子节点的位置
    if ([children_ count] > 0) {
        return [(Stroke *)[children_ objectAtIndex:0] location];
    }
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark
{
    [children_ addObject:mark];
}

- (void)removeMark:(id<Mark>)mark
{
    // 如果Mark在这一层，将其移除并返回
    // 否则，让每个子节点去找它
    if ([children_ containsObject:mark]) {
        [children_ removeObject:mark];
    }else{
        [children_ makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

-(id<Mark>)childMarkAtIndex:(NSUInteger)index
{
    if (index >= [children_ count]) {
        return nil;
    }
    return [children_ objectAtIndex:index];
}

// 返回最后子节点的便利方法
- (id<Mark>)lastChild
{
    return [children_ lastObject];
}

// 返回子节点数
- (NSUInteger)count
{
    return [children_ count];
}

-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor
{
    for (id <Mark> dot in children_) {
        [dot acceptMarkVisitor:visitor];
    }
    
    [visitor visitStroke:self];
}

#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];
    [strokeCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    
    [strokeCopy setSize:size_];
    
    for (id <Mark> child in children_) {
        id <Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    return strokeCopy;
}


#pragma mark -
#pragma mark NSCoder methds

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        color_ = [aDecoder decodeObjectForKey:@"StrokeColor"];
        size_ = [aDecoder decodeFloatForKey:@"StrokeSize"];
        children_ = [aDecoder decodeObjectForKey:@"StrokeChildren"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:color_ forKey:@"StrokeColor"];
    [aCoder encodeFloat:size_ forKey:@"StrokeSize"];
    [aCoder encodeObject:children_ forKey:@"StrokeChildren"];
}

#pragma mark -
#pragma mark enumerator methods

- (NSEnumerator *)enumerator
{
    return [[MarkEnumerator alloc] initWithMark:self];
}

- (void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *stop))block
{
    BOOL stop = NO;
    NSEnumerator *enumerator = [self enumerator];
    for (id <Mark> mark in enumerator) {
        block(mark, &stop);
        if (stop) {
            break;
        }
    }
}

#pragma mark -
#pragma mark An Extended Direct-draw Example

- (void)drawWithContext:(CGContextRef)context
{
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    for (id <Mark> mark in children_) {
        [mark drawWithContext:context];
    }
    
    CGContextSetLineWidth(context, self.size);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
    CGContextStrokePath(context);
}

@end
