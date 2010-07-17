//
//  CinetiTheatreDataSource.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-04.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreDataSource.h"
#import "CinetiTheatreModel.h"
#import "CinetiTheatreTableItem.h"
#import "CinetiTheatreTableCell.h"

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
    
    NSMutableArray *movieList = [[[NSMutableArray alloc] init] autorelease];
    for (NSDictionary *movie in ((CinetiTheatreModel *)self.model).movies)
    {
        [movieList addObject:[CinetiTheatreTableItem itemWithText:[movie objectForKey:@"title"] 
                                                         imageURL:[movie objectForKey:@"thumbnail"]
                                                              URL:nil]];
    }
    
    self.items = movieList;
    [super tableViewDidLoadModel:tableView];
}    

#pragma mark TTTableViewDataSource protocol

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id)object {
    if ([object isKindOfClass:[CinetiTheatreTableItem class]]) {
        return [CinetiTheatreTableCell class];
    } else {
        return [super tableView:tableView cellClassForObject:object];
    }
}

- (UIImage*)imageForEmpty
{
	return [UIImage imageNamed:@"Three20.bundle/images/empty.png"];
}

- (UIImage*)imageForError:(NSError*)error
{
    return [UIImage imageNamed:@"Three20.bundle/images/error.png"];
}

@end
