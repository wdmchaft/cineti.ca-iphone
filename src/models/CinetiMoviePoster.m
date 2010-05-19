//
//  CinetiMoviePoster.m
//  Cineti
//
//  Created by Peter McCurdy on 10-05-19.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiMoviePoster.h"

@implementation CinetiMoviePoster

// TTPhoto protocol properties
@synthesize caption;
@synthesize photoSource;
@synthesize size;
@synthesize index;

- (id)init {
    NSLog(@"CinetiMoviePoster: init");
    if (self = [super init]) {
        self.caption = @"A Movie Caption";
        self.size = CGSizeMake(140, 207);
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

#pragma mark TTPhoto methods

- (NSString *)URLForVersion:(TTPhotoVersion)version
{
    NSLog(@"CinetiMoviePoster: URLForVersion(%@)", version);
    if (version == TTPhotoVersionThumbnail)
        return @"http://cineti.ca/poster/34687_thumb.jpg";
    else
        return @"http://cineti.ca/poster/34687.jpg";
}

@end