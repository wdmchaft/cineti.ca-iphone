//
//  CinetiMovieModel.h
//  Cineti
//
//  Created by Peter McCurdy on 10-10-27.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/Three20.h"

@interface CinetiMovieModel : TTURLRequestModel {
    NSString *_movieURL;
    NSDictionary *_movieData;
}

- (id) initWithMovieURL:(NSString *)url;

@property (nonatomic, retain) NSString *movieURL;
@property (nonatomic, retain) NSDictionary *movieData;

@end
