//
//  CinetiJSONRequest.m
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiJSONRequest.h"
#import "CinetiJSONRequestDelegate.h"
#import "TTURLRequest.h"
#import "TTURLDataResponse.h"
#import "NSString+SBJSON.h"


@implementation CinetiJSONRequest


- (id)initWithURL:(NSString *)url delegate:(id <CinetiJSONRequestDelegate>)_delegate {
	if ( self = [super init] ) {
		delegate = [_delegate retain];
		
		TTURLRequest *request = [TTURLRequest requestWithURL:url delegate:self];
		request.response = [[[TTURLDataResponse alloc] init] autorelease];
		[request send];
	}
	return self;
}


- (void)dealloc {
	[delegate release];
	[super dealloc];
}


+ (CinetiJSONRequest *)jsonRequestWithURL:(NSString *)url delegate:(id <CinetiJSONRequestDelegate>)_delegate {
	return [[[CinetiJSONRequest alloc] initWithURL:url delegate:_delegate] autorelease];
}


- (void)requestDidFinishLoad:(TTURLRequest*)request {
    TTURLDataResponse *response = (TTURLDataResponse *)request.response;
	NSString *jsonString = [[[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding] autorelease];
	NSObject *object = [jsonString JSONValue];
	[delegate jsonRequest:self didSucceedWithObject:object];
}


- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {
	[delegate jsonRequest:self didFailWithError:error];
}


@end
