//
//  CinetiTheatreViewController.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-01.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreViewController.h"
#import "Three20/Three20.h"

@implementation CinetiTheatreViewController

- (id) init {
    NSLog(@"In CinetiTheatreViewController init");
    if (self = [super init]) {
        //self.variableHeightRows = YES;
        
        self.dataSource = [TTListDataSource dataSourceWithObjects:[TTTableTextItem itemWithText:@"Table cell item"], nil];
    }
    
    return self;
}

@end

