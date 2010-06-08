//
//  CinetiTheatreViewController.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-01.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreViewController.h"
#import "CinetiTheatreDataSource.h"
#import "CinetiTheatreModel.h"
#import "Three20/Three20.h"

@implementation CinetiTheatreViewController

- (id)init {
    NSLog(@"In CinetiTheatreViewController init");
    if (self = [super init]) {
        //self.variableHeightRows = YES;
        
        id<TTTableViewDataSource> ds = [CinetiTheatreDataSource dataSourceWithItems:nil];
        ds.model = [[CinetiTheatreModel alloc] initWithTheatreURL:@"http://api.cineti.ca/theater/parc.json"];
        self.dataSource = ds;
    }
    
    return self;
}

@end

