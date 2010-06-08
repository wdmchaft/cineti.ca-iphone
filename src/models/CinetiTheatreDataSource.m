//
//  CinetiTheatreDataSource.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-04.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreDataSource.h"
#import "CinetiTheatreModel.h"

@implementation CinetiTheatreDataSource

- (id)init
{
    NSLog(@"CinetiTheatreDataSource: init");
    if (self = [super init]) {
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"CinetiTheatreDataSource: dealloc");
    [super dealloc];
}

/*
- (id)model
{
    return _theatreModel;
}
 */

- (void)tableViewDidLoadModel:(UITableView *)tableView
{
    NSLog(@"CinetiTheatresDataSource: tableViewDidLoadModel");
    
    NSMutableArray *movieNames = [[[NSMutableArray alloc] init] autorelease];
    for (NSDictionary *movie in ((CinetiTheatreModel *)self.model).movies)
    {
        //NSLog(@"Found theatre: %@", theatreName);
        [movieNames addObject:[TTTableTextItem itemWithText:[movie objectForKey:@"title"]]];
    }
    
    self.items = movieNames;
    [super tableViewDidLoadModel:tableView];
}    

#pragma mark TTTableViewDataSource protocol

- (UIImage*)imageForEmpty
{
	return [UIImage imageNamed:@"Three20.bundle/images/empty.png"];
}

- (UIImage*)imageForError:(NSError*)error
{
    return [UIImage imageNamed:@"Three20.bundle/images/error.png"];
}

@end
