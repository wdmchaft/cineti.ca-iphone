//
//  CinetiMoviesRequestDelegate.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CinetiMoviesRequest;

@protocol CinetiMoviesRequestDelegate <NSObject>

@required

- (void)moviesRequest:(CinetiMoviesRequest *)request didSucceedWithMovies:(NSArray *)movies;

- (void)moviesRequest:(CinetiMoviesRequest *)request didFailWithError:(NSError *)error;

@end
