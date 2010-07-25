//
//  CinetiTheatreTableItem.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-09.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreTableItem.h"


@implementation CinetiTheatreTableItem

@synthesize showtimes = _showtimes;

+ (id)itemWithText:(NSString*)text showtimes:(NSArray*)showtimes imageURL:(NSString*)imageURL URL:(NSString*)URL 
{
    NSLog(@"CinetiTheatreTableItem itemWithText:%@ imageURL: %@ URL:%@", text, imageURL, URL);
    CinetiTheatreTableItem* item = [[[self alloc] init] autorelease];
    item.text = text;
    item.showtimes = showtimes;
    item.imageURL = imageURL;
    item.URL = URL;
    return item;
}

- (NSString *)showtimesString
{
    return [self.showtimes componentsJoinedByString:@" "];
}

@end
