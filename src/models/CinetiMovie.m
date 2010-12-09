//
//  CinetiMovie.m
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMovie.h"
#import "Three20/Three20+Additions.h"


@implementation CinetiMovie

#pragma mark TTPhoto implementation
@synthesize photoSource;
@synthesize size;
@synthesize index;

// We don't control the @property declaration, and you can't tell @synthesize to just call other existing methods.  So make some wrappers by hand.
- (NSString *)caption {
    return self.title;
}

- (void)setCaption:(NSString *)caption {
    [NSException raise:@"Can't change movie title" 
                format:@"A movie's title is immutable.  Don't try to change it.  This method only exists due to TTPhoto"];
}

- (NSString *)URLForVersion:(TTPhotoVersion)version
{
    NSString *url = nil;
    if (version == TTPhotoVersionThumbnail || version == TTPhotoVersionSmall)
        url = self.posterThumbURL;
    else if (version == TTPhotoVersionMedium || version == TTPhotoVersionLarge)
    {
        // FIXME: We should get the real URL from the movie details JSON
        url = [self.posterThumbURL stringByReplacingOccurrencesOfString:@"_thumb.jpg" withString:@".jpg"];
    }
    
    //NSLog(@"CinetiMovie: URLForVersion(%d)=%@", version, url);
    return url;
}

#pragma mark CinetiMovie implementation

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
