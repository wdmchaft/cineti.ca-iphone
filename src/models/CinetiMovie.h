//
//  CinetiMovie.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiJSONObject.h"


@interface CinetiMovie : CinetiJSONObject {
    NSString *_posterURL;
    NSString *_posterThumbURL;
}

+ movieFromRawMovie:(NSDictionary *)rawMovie;

@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSString *posterURL;
@property (readonly, nonatomic) NSString *posterThumbURL;

@end
