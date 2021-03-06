//
//  CinetiTheatresDataSource.m
//  Cineti
//
//  Created by Peter McCurdy on 10-05-26.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatresDataSource.h"
#import "CinetiTheatresModel.h"
#import "Three20/Three20.h"

@implementation CinetiTheatresDataSource

- (id)init
{
    NSLog(@"CinetiTheatresDataSource: init");
    if (self = [super init]) {
        _theatresmodel = [[CinetiTheatresModel alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"CinetiTheatresDataSource: dealloc");
    [_theatresmodel release];
    
    [super dealloc];
}

- (id)model
{
    return _theatresmodel;
}

- (void)tableViewDidLoadModel:(UITableView *)tableView
{
    NSLog(@"CinetiTheatresDataSource: tableViewDidLoadModel");
    
    NSMutableArray *theatreNames = [[[NSMutableArray alloc] init] autorelease];
    for (NSDictionary *theatre in _theatresmodel.theatres)
    {
        NSLog(@"Found theatre: %@, url %@", [theatre objectForKey:@"name"], [theatre objectForKey:@"href"]);
        [theatreNames addObject:[TTTableTextItem itemWithText:[theatre objectForKey:@"name"] URL:[theatre objectForKey:@"href"]]];
    }
    
    self.items = theatreNames;
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
