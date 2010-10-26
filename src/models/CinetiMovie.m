//
//  CinetiMovie.m
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMovie.h"


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

- (NSString *)movieid {
    return (NSString *)[self valueForKey:@"href"];
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
