//
//  CinetiMovie.m
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMovie.h"
#import "Three20/Three20+Additions.h"

#pragma mark CinetiMovie implementation

@implementation CinetiMovie

+ movieFromRawMovie:(NSDictionary *)rawMovie {
	return [[[CinetiMovie alloc] initWithDictionary:rawMovie] autorelease];
}

+ (NSString *)stringFromShowtimes:(NSArray *)showtimes {
    // The server formats times as hh:mm:ss, which is dumb to display.
    NSMutableArray *times = [NSMutableArray arrayWithCapacity:[showtimes count]];
    for (NSString *s in showtimes)
    {
        NSLog(@"stringFromShowtimes: got time %@", s);
        NSArray *split = [s componentsSeparatedByString:@":"];
        [times addNonEmptyString:[NSString stringWithFormat:@"%@:%@", [split objectAtIndex:0], [split objectAtIndex:1]]];
    }
    NSLog(@"stringFromShowtimes: returning %@", [times componentsJoinedByString:@" "]);
    return [times componentsJoinedByString:@" "];
}

- (NSString *)movieid {
    return (NSString *)[self valueForKey:@"href"];
}

- (NSString *)title {
	return (NSString *)[self valueForKey:@"title"];
}

- (NSString *)plot {
    return (NSString *)[self valueForKey:@"plot"];
}

- (NSString *)posterURL {
    NSObject *rawPosterList = [self valueForKey:@"posters"];
    if (rawPosterList && [rawPosterList isKindOfClass:[NSArray class]]) {
        NSArray *posterList = (NSArray *)rawPosterList;
        for (NSObject *poster in posterList) {
            if ([poster isKindOfClass:[NSDictionary class]] && [@"large" isEqualToString:[poster valueForKey:@"size"]]) {
                return [poster valueForKey:@"href"];
            }
        }
    }
    return (NSString *)[self valueForKey:@"thumbnail"];
}

- (NSString *)posterThumbURL {
    NSObject *rawPosterList = [self valueForKey:@"posters"];
    if (rawPosterList && [rawPosterList isKindOfClass:[NSArray class]]) {
        NSArray *posterList = (NSArray *)rawPosterList;
        for (NSObject *poster in posterList) {
            if ([poster isKindOfClass:[NSDictionary class]] && [@"small" isEqualToString:[poster valueForKey:@"size"]]) {
                return [poster valueForKey:@"href"];
            }
        }
    }
    return (NSString *)[self valueForKey:@"thumbnail"];
}

- (NSArray *)theatres {
    return (NSArray *)[self valueForKey:@"theaters"];
}

@end
