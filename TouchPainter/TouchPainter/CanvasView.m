//
//  CanvansView.m
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"

@implementation CanvasView

@synthesize mark = mark_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // create a renderer visitor
    MarkRenderer *markRendrer = [[MarkRenderer alloc] initWithCGContext:context];
    
    // pass this renderer along the mark composite structure
    [mark_ acceptMarkVisitor:markRendrer];
}


@end
