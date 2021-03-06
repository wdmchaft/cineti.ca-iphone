//
//  CinetiMovie.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinetiJSONObject.h"

@interface CinetiMovie : CinetiJSONObject {
}

+ movieFromRawMovie:(NSDictionary *)rawMovie;

+ (NSString*)stringFromShowtimes:(NSArray*)showtimes;

@property (readonly, nonatomic) NSString *movieid;
@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSString *plot;
@property (readonly, nonatomic) NSString *posterURL;
@property (readonly, nonatomic) NSString *posterThumbURL;
@property (readonly, nonatomic) NSArray *theatres;

@end
