//
//  CoordinatingController.h
//  TouchPainter
//
//  Created by CJS on 14-6-1.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CanvasViewController.h"
#import "PaletteViewController.h"
#import "ThumbnailViewController.h"

typedef NS_ENUM(NSInteger, ButtonTag){
    kButtonTagDone,
    kButtonTagOpenPaletteView,
    kButtonTagOpenThumbnailVie
};

@interface CoordinatingController : NSObject
{
    @private
    CanvasViewController *canvasViewController_;
    UIViewController *activeViewController_;
}

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewcontroller;

+ (CoordinatingController *) sharedInstance;

- (IBAction)requestViewChangeByObject:(id)object;

@end
