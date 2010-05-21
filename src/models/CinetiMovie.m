//
//  CinetiMovie.m
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMovie.h"


@implementation CinetiMovie

+ movieFromRawMovie:(NSDictionary *)rawMovie {
	return [[[CinetiMovie alloc] initWithDictionary:rawMovie] autorelease];
}

- (NSString *)title {
	return (NSString *)[self valueForKey:@"title"];
}

- (NSString *)posterURL {
    return (NSString *)[self valueForKey:@"href"];
}

- (NSString *)posterThumbURL {
    NSString *thumbURL = (NSString *)[self valueForKey:@"thumbnail"];
    return thumbURL == nil ? self.posterURL : thumbURL;
}

@end
