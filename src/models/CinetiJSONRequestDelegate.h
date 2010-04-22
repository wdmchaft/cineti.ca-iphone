//
//  CinetiJSONRequestDelegate.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CinetiJSONRequest;


@protocol CinetiJSONRequestDelegate <NSObject>

@required

- (void)jsonRequest:(CinetiJSONRequest *)jsonRequest didSucceedWithObject:(NSObject *)object;

- (void)jsonRequest:(CinetiJSONRequest *)jsonRequest didFailWithError:(NSError *)error;

@end
