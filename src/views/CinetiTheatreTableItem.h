//
//  CinetiTheatreTableItem.h
//  Cineti
//
//  Created by Peter McCurdy on 10-06-09.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "Three20/Three20.h"


@interface CinetiTheatreTableItem : TTTableSubtitleItem {
    NSArray *_showtimes;
}

@property (nonatomic, retain) NSArray *showtimes;

+ (id)itemWithText:(NSString *)text showtimes:(NSArray *)showtimes imageURL:(NSString *)imageURL URL:(NSString *)URL;

@end
