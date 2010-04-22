//
//  CinetiJSONObject.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CinetiJSONObject : NSObject {
@private
	NSDictionary *dictionary;
}

- (id)initWithDictionary:(NSDictionary *)_dictionary;

- (NSObject *)valueForKey:(NSString *)key;

@end
