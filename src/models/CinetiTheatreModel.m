//
//  CinetiTheatreModel.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-04.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreModel.h"
#import "CinetiTheatreTableItem.h"
#import "CinetiMovieManager.h"
#import "CinetiMovie.h"
#import "NSString+SBJSON.h"
#import "SBJSON.h"

@implementation CinetiTheatreModel

@synthesize movies = _movies;
@synthesize theatreURL = _theatreURL;

- (id) initWithTheatreURL:(NSString *)url
{
    if (self = [super init])
    {
        self.theatreURL = [NSString stringWithString:url];
        self.movies = nil;
    }
    NSLog(@"CinetiTheatreModel: initWithTheatreURL(%@), self=%p", self.theatreURL, self);
    return self;
}

- (void) dealloc
{
    NSLog(@"CinetiTheatreModel: dealloc");
    self.theatreURL = nil;
    self.movies = nil;
    [super dealloc];
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more
{
    NSLog(@"CinetiTheatreModel: load %@, self=%p", self.theatreURL, self);
    
    if (!self.isLoading) {
        TTURLRequest *request = [TTURLRequest requestWithURL:self.theatreURL delegate:self];
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
    
    NSArray *rawMovies = [(NSDictionary *)object objectForKey:@"movies"];
    self.movies = [NSMutableArray arrayWithCapacity:[rawMovies count]];
    for (NSDictionary *rawmovie in rawMovies)
    {        
        NSString *movieid = [rawmovie objectForKey:@"href"];
        CinetiMovie *movie = [[CinetiMovieManager sharedInstance] movieForId:movieid];
        
        [self.movies addObject:[CinetiTheatreTableItem itemWithText:[rawmovie objectForKey:@"title"]
                                                          showtimes:[rawmovie objectForKey:@"times"]
                                                           imageURL:movie.posterThumbURL
                                                                URL:movieid]];
    }
    
    [super requestDidFinishLoad:request];
}

@end
