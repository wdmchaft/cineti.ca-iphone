//
//  CinetiTheatresModel.h
//  Cineti
//
//  Created by Peter McCurdy on 10-05-27.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/TTURLRequestModel.h"


@interface CinetiTheatresModel : TTURLRequestModel {
    NSArray *_theatreNames;
}

@property (nonatomic, readonly) NSArray *theatreNames;

@end
