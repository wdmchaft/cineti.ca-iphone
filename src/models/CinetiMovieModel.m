//
//  CinetiMovieModel.m
//  Cineti
//
//  Created by Peter McCurdy on 10-10-27.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiMovieModel.h"
#import "CinetiMovieManager.h"
#import "CinetiMovie.h"
#import "NSString+SBJSON.h"
#import "SBJSON.h"

@implementation CinetiMovieModel

@synthesize movieURL = _movieURL;
@synthesize movieData = _movieData;

- (id) initWithMovieURL:(NSString *)url
{
    if (self = [super init])
    {
        self.movieURL = [NSString stringWithString:url];
        self.movieData = nil;
    }
    NSLog(@"CinetiMovieModel: initWithMovieURL(%@), self=%p", self.movieURL, self);
    return self;
}

- (void) dealloc
{
    NSLog(@"CinetiMovieModel: dealloc");
    self.movieURL = nil;
    self.movieData = nil;
    [super dealloc];
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more
{
    NSLog(@"CinetiMovieModel: load %@, self=%p", self.movieURL, self);
    
    if (!self.isLoading) {
        TTURLRequest *request = [TTURLRequest requestWithURL:self.movieURL delegate:self];
        request.cachePolicy = cachePolicy;
        
        id<TTURLResponse> response = [[TTURLDataResponse alloc] init];
        request.response = response;
        TT_RELEASE_SAFELY(response);
        
        [request send];
    }
}

- (void)requestDidFinishLoad:(TTURLRequest *)request
{
    NSLog(@"CinetiTheatreModel: requestDidFinishLoad");
    TTURLDataResponse *response = request.response;
    
    // Parse response
	NSString *jsonString = [[[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding] autorelease];
    // The JSONValue extension doesn't seem to like Three20, just do it the regular way
	//NSObject *object = [jsonString JSONValue];
    SBJsonParser *jsonParser = [SBJsonParser new];
    NSObject *object = [jsonParser fragmentWithString:jsonString];
    [jsonParser release];
    
    self.movieData = (NSDictionary *)object;
    
    [super requestDidFinishLoad:request];
}

@end
