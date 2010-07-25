//
//  CinetiTheatreModel.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-04.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreModel.h"
#import "CinetiTheatreTableItem.h"
#import "NSString+SBJSON.h"

@implementation CinetiTheatreModel

@synthesize movies = _movies;

- (id) initWithTheatreURL:(NSString *)url
{
    if (self = [super init])
    {
        _theatreUrl = [[NSString stringWithString:url] retain];
        _movies = nil;
    }
    NSLog(@"CinetiTheatreModel: initWithTheatreURL(%@), self=%p", _theatreUrl, self);
    return self;
}

- (void) dealloc
{
    NSLog(@"CinetiTheatreModel: dealloc");
    [_theatreUrl release];
    [_movies release];
    [super dealloc];
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more
{
    NSLog(@"CinetiTheatreModel: load %@, self=%p", _theatreUrl, self);
    
    if (!self.isLoading) {
        TTURLRequest *request = [TTURLRequest requestWithURL:_theatreUrl delegate:self];
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
    [_movies release];
    _movies = [NSMutableArray arrayWithCapacity:[rawMovies count]];
    for (NSDictionary *movie in rawMovies)
    {
        // The server formats times as hh:mm:ss, which is dumb to display.
        NSArray *rawtimes = [movie arrayForKey:@"times"];
        NSMutableArray *times = [NSMutableArray arrayWithCapacity:[rawtimes count]];
        for (NSString *s in rawtimes)
        {
            NSArray *split = [s componentsSeparatedByString:@":"];
            [times addNonEmptyString:[NSString stringWithFormat:@"%@:%@", [split objectAtIndex:0], [split objectAtIndex:1]]];
        }
        [_movies addObject:[CinetiTheatreTableItem itemWithText:[movie objectForKey:@"title"] 
                                                      showtimes:times
                                                       imageURL:[movie objectForKey:@"thumbnail"]
                                                            URL:nil]];
    }
    
    [super requestDidFinishLoad:request];
}

@end
