//
//  CinetiMoviesRequest.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CinetiJSONRequestDelegate.h"


@protocol CinetiMoviesRequestDelegate;


@interface CinetiMoviesRequest : NSObject <CinetiJSONRequestDelegate> {
@private
	id <CinetiMoviesRequestDelegate> delegate;
}

+ (CinetiMoviesRequest *)moviesRequestWithDelegate:(id <CinetiMoviesRequestDelegate>)_delegate;

@end
