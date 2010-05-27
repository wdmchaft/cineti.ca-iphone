//
//  CinetiTheatresModel.m
//  Cineti
//
//  Created by Peter McCurdy on 10-05-27.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatresModel.h"
#import "Three20/Three20.h"
#import "NSString+SBJSON.h"

@implementation CinetiTheatresModel

@synthesize theatreNames = _theatreNames;

- (id)init
{
    NSLog(@"CinetiTheatresModel: init");
    if (self = [super init]) {
        _theatreNames = [[NSMutableArray arrayWithObjects:@"A Theatre", @"Another Theatre", nil] retain];
    }
    
    return self;
}

- (void)dealloc
{
    [_theatreNames release];
    [super dealloc];
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more
{
    NSLog(@"CinetiTheatresModel: load");
    
    if (!self.isLoading) {
        NSString *url = @"http://api.cineti.ca/theaters.json";
        TTURLRequest *request = [TTURLRequest requestWithURL:url delegate:self];
        request.cachePolicy = cachePolicy;
        
        id<TTURLResponse> response = [[TTURLDataResponse alloc] init];
        request.response = response;
        TT_RELEASE_SAFELY(response);
        
        [request send];
    }
}

- (void)requestDidFinishLoad:(TTURLRequest *)request
{
    NSLog(@"CinetiTheatresModel: requestDidFinishLoad");
    TTURLDataResponse *response = request.response;
    
    // Parse response
	NSString *jsonString = [[[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding] autorelease];
	NSObject *object = [jsonString JSONValue];

	NSArray *rawTheatres = (NSArray *)object;
	NSMutableArray *theatres = [NSMutableArray arrayWithCapacity:[rawTheatres count]];
	for ( NSDictionary *rawTheatre in rawTheatres ) {
		[theatres addObject:[rawTheatre valueForKey:@"name"]];
	}
    
    _theatreNames = theatres;
    
    [super requestDidFinishLoad:request];
}

@end
