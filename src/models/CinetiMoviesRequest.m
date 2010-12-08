//
//  CinetiMoviesRequest.m
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMoviesRequest.h"
#import "CinetiMoviesRequestDelegate.h"
#import "CinetiMovie.h"
#import "CinetiJSONRequest.h"


@implementation CinetiMoviesRequest

- (id)initWithDelegate:(id <CinetiMoviesRequestDelegate>)_delegate {
	if ( self = [super init] ) {
		delegate = [_delegate retain];
		
		[[CinetiJSONRequest jsonRequestWithURL:@"http://api.cineti.ca/movies.json" delegate:self] retain];
	}
	return self;
}


- (void)dealloc {
	[delegate release];
	[super dealloc];
}


+ (CinetiMoviesRequest *)moviesRequestWithDelegate:(id <CinetiMoviesRequestDelegate>)_delegate {
    // Doing this all on one line causes a compiler warning.
    CinetiMoviesRequest *req = [CinetiMoviesRequest alloc];
    return [[req initWithDelegate:_delegate] autorelease];
}


- (void)jsonRequest:(CinetiJSONRequest *)jsonRequest didSucceedWithObject:(NSObject *)object {
	NSArray *rawMovies = (NSArray *)object;
	NSMutableArray *movies = [NSMutableArray arrayWithCapacity:[rawMovies count]];
	for ( NSDictionary *rawMovie in rawMovies ) {
		[movies addObject:[CinetiMovie movieFromRawMovie:rawMovie]];
	}
	[delegate moviesRequest:self didSucceedWithMovies:movies];
}


- (void)jsonRequest:(CinetiJSONRequest *)jsonRequest didFailWithError:(NSError *)error {
	[delegate moviesRequest:self didFailWithError:error];
}


@end
