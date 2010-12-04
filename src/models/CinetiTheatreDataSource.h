//
//  CinetiTheatreDataSource.h
//  Cineti
//
//  Created by Peter McCurdy on 10-06-04.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/Three20.h"

@class CinetiTheatreModel;

@interface CinetiTheatreDataSource : TTListDataSource {
}

- (id)initWithTheatreURL:(NSString *)url;

@end
