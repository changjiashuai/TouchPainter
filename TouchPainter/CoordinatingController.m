//
//  CoordinatingController.m
//  TouchPainter
//
//  Created by CJS on 14-6-1.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "CoordinatingController.h"

@interface CoordinatingController ()

- (void) initialize;

@end

@implementation CoordinatingController

@synthesize activeViewController = activeViewController_;
@synthesize canvasViewcontroller = canvasViewController_;

static CoordinatingController *sharedCoordinator = nil;

- (void) initialize
{
    canvasViewController_ = [[CanvasViewController alloc] init];
    activeViewController_ = canvasViewController_;
}

#pragma mark -
#pragma mark CoordinatingController Singleton Implementation

+ (CoordinatingController *)sharedInstance
{
    if (sharedCoordinator == nil) {
        sharedCoordinator = [[super alloc] init];
        
        // initialize the first view controller
        // and keep it with the singleton
        [sharedCoordinator initialize];
    }
    return sharedCoordinator;
}

#pragma mark -
#pragma mark A method for view transitions

- (IBAction)requestViewChangeByObject:(id)object
{
    if ([object isKindOfClass:[UIBarButtonItem class]]) {
        switch ([(UIBarButtonItem *)object tag]) {
            case kButtonTagOpenPaletteView:
            {
                // load a PaletteViewController
                PaletteViewController *controller = [[PaletteViewController alloc] init];
                // transition to the PaletteViewController
                [canvasViewController_ presentModalViewController:controller animated:YES];
                // set the activeViewController to
                // paletteViewController
                activeViewController_ = controller;
            }
                break;
            case kButtonTagOpenThumbnailVie:
            {
                // load a ThumbnailViewController
                ThumbnailViewController *controller = [[ThumbnailViewController alloc] init];
                // transition to the ThumbnailViewController
                [canvasViewController_ presentModalViewController:controller animated:YES];
                // set the activeViewController to
                // ThumbnailViewController
                activeViewController_ = controller;
            }
                break;
            default:
            {
                // just go back to the main canvasViewController
                // for the other types
                [canvasViewController_ dismissModalViewControllerAnimated:YES];
                activeViewController_ = canvasViewController_;
            }
                break;
        }
    }
    else
    {
        [canvasViewController_ dismissModalViewControllerAnimated:YES];
        // set the activeViewController back to
        // canvasViewController
        activeViewController_ = canvasViewController_;
    }
}


@end
