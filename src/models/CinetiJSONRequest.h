//
//  CinetiJSONRequest.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CinetiJSONRequest.h"
#import "TTURLRequestDelegate.h"


@protocol CinetiJSONRequestDelegate;


@interface CinetiJSONRequest : NSObject <TTURLRequestDelegate> {
@private
	id <CinetiJSONRequestDelegate> delegate;
}

+ (CinetiJSONRequest *)jsonRequestWithURL:(NSString *)url delegate:(id <CinetiJSONRequestDelegate>)_delegate;

@end
