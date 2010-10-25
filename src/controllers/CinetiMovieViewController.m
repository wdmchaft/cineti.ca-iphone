//
//  CinetiMovieViewController.m
//  Cineti
//
//  Created by Peter McCurdy on 10-10-21.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiMovieViewController.h"


@implementation CinetiMovieViewController

- (id)initWithMovieId:(NSString *)movieid {
    NSLog(@"In CinetiMovieViewController initWithMovieId(%@)", movieid);
    if (self = [super init]) {
        self.variableHeightRows = YES;
        
        /*
        id<TTTableViewDataSource> ds = [CinetiMovieDataSource dataSourceWithItems:nil];
        ds.model = [[CinetiTheatreModel alloc] initWithTheatreURL:[NSString stringWithFormat:@"%@%@.json", kTheatreBaseUrl, theatreName]];
        self.dataSource = ds;
        */
        self.dataSource = [TTSectionedDataSource dataSourceWithObjects:
                           @"Details",
                           [TTTableMessageItem itemWithTitle:[NSString stringWithFormat:@"Movie Title %@", movieid] caption:@"Drama" text:@"OMG this is, like, the bestest movie ever, you guys." timestamp:[NSDate date] imageURL:@"http://cineti.ca/poster/3592.jpg" URL:nil],
                           @"Today",
                           [TTTableSubtextItem itemWithText:@"Some theatre or other" caption:@"12:00 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00 9:00"],
                           [TTTableSubtextItem itemWithText:@"Crapville" caption:@"4:00 5:00"],
                           @"Tomorrow",
                           [TTTableSubtextItem itemWithText:@"Some theatre or other" caption:@"12:00 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00 9:00"],
                           [TTTableSubtextItem itemWithText:@"Crapville" caption:@"4:00 5:00"],
                           @"Wednesday",
                           [TTTableSubtextItem itemWithText:@"Some theatre or other" caption:@"12:00 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00 9:00"],
                           [TTTableSubtextItem itemWithText:@"Crapville" caption:@"4:00 5:00"], 
                           nil];
    }
    
    return self;
}

@end
