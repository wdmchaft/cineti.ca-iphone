//
//  CinetiMovieViewController.m
//  Cineti
//
//  Created by Peter McCurdy on 10-10-21.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiMovieViewController.h"
#import "CinetiMovie.h"
#import "CinetiMovieManager.h"
#import "CinetiMovieDataSource.h"
#import "CinetiMovieModel.h"


@implementation CinetiMovieViewController

- (id)initWithMovieId:(NSString *)movieid {
    NSLog(@"In CinetiMovieViewController initWithMovieId(%@)", movieid);
    if (self = [super init]) {
        self.variableHeightRows = YES;
        
        // The id passed in is just the base number, not the full URL
        NSString *movieUrl = [NSString stringWithFormat:@"%@%@.json", kMovieBaseUrl, movieid];
        
        self.dataSource = [[[CinetiMovieDataSource alloc] initWithMovieURL:movieUrl] autorelease];
    }
    
    return self;
}

@end
