//
//  CinetiMovieManager.h
//  Cineti
//
//  Created by Peter McCurdy on 10-10-18.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CinetiMovie.h"

@interface CinetiMovieManager : NSObject {
    NSMutableDictionary *dictionary;
}

- (CinetiMovie *)movieForId:(NSString *)movieid;
- (void)addMovie:(CinetiMovie *)movie withKey:(NSString *)movieid;

// Methods to make this a singleton class
+ (CinetiMovieManager *)sharedInstance;
+ (id)allocWithZone:(NSZone*)zone;

- (id)copyWithZone:(NSZone*)zone;
- (id)retain;
- (NSUInteger)retainCount;
- (void)release;
- (id)autorelease;

@end
