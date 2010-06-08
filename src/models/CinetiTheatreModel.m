//
//  CinetiTheatreModel.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-04.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreModel.h"
#import "NSString+SBJSON.h"

@implementation CinetiTheatreModel

@synthesize movies = _movies;

- (id) initWithTheatreURL:(NSString *)url
{
    if (self = [super init])
    {
        _theatreUrl = [[NSString stringWithString:url] retain];
    }
    NSLog(@"CinetiTheatreModel: initWithTheatreURL(%@), self=%p", _theatreUrl, self);
    return self;
}

- (void) dealloc
{
    NSLog(@"CinetiTheatreModel: dealloc");
    [_theatreUrl release];
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

/*
	NSArray *rawMovies = [(NSDictionary *)object objectForKey:@"movies"];
    //	NSMutableArray *movies = [[NSMutableArray arrayWithCapacity:[rawMovies count]] retain];
	for (NSDictionary *rawMovie in rawMovies) {
        NSLog(@"Got movie %@", [rawMovie objectForKey:@"title"]);
	}
*/
    _movies = [(NSDictionary *)object objectForKey:@"movies"];
    [super requestDidFinishLoad:request];
}

@end
