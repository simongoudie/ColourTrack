//
//  CTAppDelegate.h
//  ColourTrack
//
//  Created by Simon Goudie on 15/07/13.
//  Copyright (c) 2013 Simon Goudie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTViewController;

@interface CTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CTViewController *viewController;

@end
