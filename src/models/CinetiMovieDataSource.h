//
//  CinetiMovieDataSource.h
//  
// A TTDataSource for getting the details of a single movie
//
//  Created by Peter McCurdy on 10-10-26.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/TTSectionedDataSource.h"

@class CinetiMovieModel;

@interface CinetiMovieDataSource : TTSectionedDataSource {
}

- (id)initWithMovieURL:(NSString *)movieurl;

@end
