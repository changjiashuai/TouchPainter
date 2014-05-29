//
//  ClothCanvasView.m
//  TouchPainter
//
//  Created by CJS on 14-5-28.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "ClothCanvasView.h"

@implementation ClothCanvasView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Add a cloth image view on top
        // as the canvas background
        UIImage *backgroundImage = [UIImage imageNamed:@"cloth"];
        UIImageView *backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
        [self addSubview:backgroundView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
