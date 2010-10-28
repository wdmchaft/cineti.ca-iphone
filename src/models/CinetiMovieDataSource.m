//
//  CinetiMovieDataSource.m
//  Cineti
//
//  Created by Peter McCurdy on 10-10-26.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiMovieDataSource.h"
#import "CinetiMovieModel.h"
#import "CinetiMovie.h"
#import <Three20/Three20.h>


@implementation CinetiMovieDataSource

- (id)initWithMovieURL:(NSString *)movieurl {
    NSLog(@"CinetiMovieDataSource: init");
    if (self = [super init]) {
        self.model = [[[CinetiMovieModel alloc] initWithMovieURL:movieurl] autorelease];
    }
    
    return self;    
}

- (void)dealloc {
    NSLog(@"CinetiMovieDataSource: dealloc");
    [super dealloc];
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
    self.items = [NSMutableArray array];
    self.sections = [NSMutableArray array];
    
    CinetiMovieModel *model = (CinetiMovieModel *)self.model;
    CinetiMovie *movie = [CinetiMovie movieFromRawMovie:model.movieData];
    
    [self.sections addObject:@"Details"];
    TTTableMessageItem *item = [TTTableMessageItem itemWithTitle:movie.title 
                                                         caption:@"Drama" 
                                                            text:movie.plot 
                                                       timestamp:[NSDate date] 
                                                        imageURL:movie.posterURL 
                                                             URL:nil];
    [self.items addObject:[NSArray arrayWithObject:item]];
    
    [super tableViewDidLoadModel:tableView];
}

@end
