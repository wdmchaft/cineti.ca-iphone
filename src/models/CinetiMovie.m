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


@dynamic title;

- (NSString *)title {
	return (NSString *)[self valueForKey:@"@text"];
}


@end
