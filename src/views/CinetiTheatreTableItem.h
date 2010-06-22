//
//  CinetiTheatreTableItem.h
//  Cineti
//
//  Created by Peter McCurdy on 10-06-09.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "Three20/Three20.h"


@interface CinetiTheatreTableItem : TTTableTextItem {
    NSString *_imageURL;
}

@property (nonatomic, retain) NSString *imageURL;

+ (id)itemWithText:(NSString *)text imageURL:(NSString *)imageURL URL:(NSString *)URL;

@end
