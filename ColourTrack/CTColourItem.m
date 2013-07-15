//
//  CTColourItem.m
//  ColourTrack
//
//  Created by Simon Goudie on 15/07/13.
//  Copyright (c) 2013 Simon Goudie. All rights reserved.
//

#import "CTColourItem.h"

@implementation CTColourItem

-(id)initWithText:(NSString*)text {
    if (self = [super init]) {
        self.text = text;
    }
    return self;
}

+(id)ColourItemWithText:(NSString *)text {
    return [[CTColourItem alloc] initWithText:text];
}

@end
