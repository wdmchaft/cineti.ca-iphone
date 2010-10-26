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

@implementation CinetiTheatreModel

@synthesize movies = _movies;
@synthesize theatreUrl = _theatreUrl;

- (id) initWithTheatreURL:(NSString *)url
{
    if (self = [super init])
    {
        self.theatreUrl = [NSString stringWithString:url];
        self.movies = nil;
    }
    NSLog(@"CinetiTheatreModel: initWithTheatreURL(%@), self=%p", self.theatreUrl, self);
    return self;
}

- (void) dealloc
{
    NSLog(@"CinetiTheatreModel: dealloc");
    self.theatreUrl = nil;
    self.movies = nil;
    [super dealloc];
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more
{
    NSLog(@"CinetiTheatreModel: load %@, self=%p", self.theatreUrl, self);
    
    if (!self.isLoading) {
        TTURLRequest *request = [TTURLRequest requestWithURL:self.theatreUrl delegate:self];
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
	NSObject *object = [jsonString JSONValue];
    
    NSArray *rawMovies = [(NSDictionary *)object objectForKey:@"movies"];
    self.movies = [NSMutableArray arrayWithCapacity:[rawMovies count]];
    for (NSDictionary *rawmovie in rawMovies)
    {
        // The server formats times as hh:mm:ss, which is dumb to display.
        NSArray *rawtimes = [rawmovie arrayForKey:@"times"];
        NSMutableArray *times = [NSMutableArray arrayWithCapacity:[rawtimes count]];
        for (NSString *s in rawtimes)
        {
            NSArray *split = [s componentsSeparatedByString:@":"];
            [times addNonEmptyString:[NSString stringWithFormat:@"%@:%@", [split objectAtIndex:0], [split objectAtIndex:1]]];
        }
        NSString *movieid = [rawmovie objectForKey:@"href"];
        CinetiMovie *movie = [[CinetiMovieManager sharedInstance] movieForId:movieid];
        if (movie != nil)
        {
            movie.showtimes = times;
        }
        [self.movies addObject:[CinetiTheatreTableItem itemWithText:[rawmovie objectForKey:@"title"]
                                                          showtimes:times
                                                           imageURL:movie.posterThumbURL
                                                                URL:movieid]];
    }
    
    [super requestDidFinishLoad:request];
}

@end
