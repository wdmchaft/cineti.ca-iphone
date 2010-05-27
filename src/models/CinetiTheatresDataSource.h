//
//  CinetiTheatresDataSource.h
//  Cineti
//
//  Created by Peter McCurdy on 10-05-26.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/TTListDataSource.h"

@class CinetiTheatresModel;

@interface CinetiTheatresDataSource : TTListDataSource {
    CinetiTheatresModel *_theatresmodel;
}

@end
