//
//  CinetiMovieManager.m
//  Cineti
//
//  Created by Peter McCurdy on 10-10-18.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiMovieManager.h"

@implementation CinetiMovieManager

static CinetiMovieManager *sharedMovieManager = nil;

- (CinetiMovie *)movieForId:(NSString *)movieid
{
    return (CinetiMovie *)[dictionary objectForKey:movieid];
}

- (void)addMovie:(CinetiMovie *)movie withKey:(NSString *)movieid
{
    [dictionary setObject:movie forKey:movieid];
}

// Singleton-related methods

+ (CinetiMovieManager *)sharedInstance
{
    if (sharedMovieManager == nil) {
        sharedMovieManager = [[super allocWithZone:NULL] init];
    }
    return sharedMovieManager;
}

+ (id)allocWithZone:(NSZone*)zone
{
    return [[self sharedInstance] retain];
}

- (id)init
{
    if (sharedMovieManager != nil)
        [NSException raise:@"NSMovieManager initialized twice" format:@"NSMovieManager initialized twice"];
    // Initialization code
    dictionary = [[NSMutableDictionary alloc] initWithCapacity:64];
    return self;
}

- (id)copyWithZone:(NSZone*)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (void)release
{
    // Do nothing
}

- (id)autorelease
{
    return self;
}

@end
