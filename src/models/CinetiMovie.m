//
//  CinetiMovie.m
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMovie.h"


@implementation CinetiMovie

@synthesize posterURL = _posterURL;
@synthesize posterThumbURL = _posterThumbURL;

+ movieFromRawMovie:(NSDictionary *)rawMovie {
	return [[[CinetiMovie alloc] initWithDictionary:rawMovie] autorelease];
}

- (CinetiMovie *)initWithDictionary:(NSDictionary *)_dictionary
{
    [super initWithDictionary:_dictionary];
    
    NSObject *rawPosters = [self valueForKey:@"posters"];
    if (rawPosters != nil && [rawPosters conformsToProtocol:@protocol(NSFastEnumeration)]) 
    {
        id<NSFastEnumeration> posters = (id<NSFastEnumeration>)rawPosters;
        for (NSObject *rawPoster in posters)
        {
            if ([rawPoster respondsToSelector:@selector(objectForKey:)])
            {
                NSDictionary *poster = (NSDictionary *)rawPoster;
                NSString *size = (NSString *)[poster objectForKey:@"size"];
                if ([size isEqualToString:@"large"])
                    _posterURL = (NSString *)[poster objectForKey:@"href"];
                if ([size isEqualToString:@"small"])
                    _posterThumbURL = (NSString *)[poster objectForKey:@"href"];
            }
        }
    }
    return self;
}

- (NSString *)title {
	return (NSString *)[self valueForKey:@"title"];
}

@end
