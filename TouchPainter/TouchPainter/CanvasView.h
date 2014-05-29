//
//  CanvansView.h
//  TouchPainter
//
//  Created by CJS on 14-5-24.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Mark;

@interface CanvasView : UIView
{
    @private
    id <Mark> mark_;
}

@property (nonatomic, retain) id <Mark> mark;

@end
