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
    return (NSString *)[self valueForKey:@"thumbnail"];
}

- (NSString *)posterThumbURL {
    return (NSString *)[self valueForKey:@"thumbnail"];
}

- (NSArray *)showtimes {
    return (NSArray *)[self valueForKey:@"times"];
}

- (void)setShowtimes:(NSArray *)showtimes {
    [self setValue:showtimes forKey:@"times"];
}

@end
