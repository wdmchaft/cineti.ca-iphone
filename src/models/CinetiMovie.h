//
//  CinetiMovie.h
//  Cineti
//
//  Created by Peter Zion on 10-04-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiJSONObject.h"


@interface CinetiMovie : CinetiJSONObject {
}

+ movieFromRawMovie:(NSDictionary *)rawMovie;

@property( readonly, nonatomic ) NSString *title;

@end
