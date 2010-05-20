//
//  CinetiMoviePoster.h
//  Cineti
//
//  Created by Peter McCurdy on 10-05-19.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/TTPhoto.h"
#import "Three20/TTPhotoSource.h"

@interface CinetiMoviePoster : NSObject <TTPhoto>
{
    id <TTPhotoSource> photoSource;
    NSString *caption;
    NSString *fullURL;
    NSString *thumbURL;
    CGSize size;
    NSInteger index;
}

@end
