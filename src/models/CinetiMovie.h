//
//  CinetiMovie.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinetiJSONObject.h"
#import "Three20/TTPhoto.h"
#import "Three20/TTPhotoSource.h"


@interface CinetiMovie : CinetiJSONObject <TTPhoto> {
    // Members needed for TTPhoto attributes
    id <TTPhotoSource> photoSource;
    CGSize size;
    NSInteger index;
}

+ movieFromRawMovie:(NSDictionary *)rawMovie;

@property (readonly, nonatomic) NSString *movieid;
@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSString *plot;
@property (readonly, nonatomic) NSString *posterURL;
@property (readonly, nonatomic) NSString *posterThumbURL;
@property (retain, nonatomic) NSArray *showtimes;

@end
