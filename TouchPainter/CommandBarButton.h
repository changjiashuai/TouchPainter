//
//  CommandBarButton.h
//  TouchPainter
//
//  Created by CJS on 14-6-1.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@interface CommandBarButton : UIBarButtonItem
{
    @protected
    Command *command_;
}

@property (nonatomic, retain) IBOutlet Command *command;

@end
