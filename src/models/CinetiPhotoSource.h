//
//  CinetiPhotoSource.h
//  Cineti
//
//  Created by Peter McCurdy on 10-05-19.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/Three20.h"

@class CinetiMovie;

@interface CinetiPhotoSource : TTModel <TTPhotoSource> {
    NSString *_title;
    NSMutableArray *_photos;
}

- (void)addMovie:(CinetiMovie *)movie;

@end
