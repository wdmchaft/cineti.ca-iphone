//
//  CinetiJSONObject.m
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiJSONObject.h"


@implementation CinetiJSONObject


- (id)initWithDictionary:(NSDictionary *)_dictionary {
	if ( self = [super init] ) {
		dictionary = [_dictionary retain];
	}
	return self;
}

- (NSObject *)valueForKey:(NSString *)key {
	return [dictionary valueForKey:key];
}


- (void)dealloc {
	[dictionary release];
    [super dealloc];
}


@end
