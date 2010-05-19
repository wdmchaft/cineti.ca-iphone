//
//  CinetiPhotoSource.h
//  Cineti
//
//  Created by Peter McCurdy on 10-05-19.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/Three20.h"

@interface CinetiPhotoSource : TTURLRequestModel <TTPhotoSource> {
    NSString *title;
}

@end
