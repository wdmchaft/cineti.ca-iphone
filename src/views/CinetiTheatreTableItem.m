//
//  CinetiTheatreTableItem.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-09.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreTableItem.h"


@implementation CinetiTheatreTableItem

@synthesize imageURL = _imageURL;

+ (id)itemWithText:(NSString*)text imageURL:(NSString*)imageURL URL:(NSString*)URL 
{
    NSLog(@"CinetiTheatreTableItem itemWithText:%@ URL:%@", text, URL);
    CinetiTheatreTableItem* item = [[[self alloc] init] autorelease];
    item.text = text;
    item.imageURL = imageURL;
    item.URL = URL;
    return item;
}


@end
