//
//  CTColourItem.h
//  ColourTrack
//
//  Created by Simon Goudie on 15/07/13.
//  Copyright (c) 2013 Simon Goudie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTColourItem : NSObject

// A text description of this item.
@property (nonatomic, copy) NSString *text;

// A Boolean value that determines the completed state of this item.
@property (nonatomic) BOOL completed;

// Returns an CTColourItem initialized with the given text.
-(id)initWithText:(NSString*)text;

// Returns an CTColourItem item initialized with the given text.
+(id)ColourItemWithText:(NSString*)text;

@end
