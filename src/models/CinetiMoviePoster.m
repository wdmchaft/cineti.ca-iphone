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

- (id)initWithURL:(NSString *)URL withThumbURL:(NSString *)thumbnailURL withTitle:(NSString *)title {
    NSLog(@"CinetiMoviePoster: init(%@, %@, %@)", URL, thumbnailURL, title);
    if (self = [super init]) {
        self.size = CGSizeMake(140, 207);
        fullURL = [URL copy];
        thumbURL = [thumbnailURL copy];
        caption = [title copy];
    }
    return self;
}

+ (CinetiMoviePoster *)moviePosterWithURL:(NSString *)URL withThumbURL:(NSString *)thumbURL withTitle:(NSString *)title
{
    return [[[CinetiMoviePoster alloc] initWithURL:URL withThumbURL:thumbURL withTitle:title] autorelease];
}

- (void)dealloc {
    [fullURL release];
    [thumbURL release];
    [caption release];
    [super dealloc];
}

#pragma mark TTPhoto methods

- (NSString *)URLForVersion:(TTPhotoVersion)version
{
    //NSLog(@"CinetiMoviePoster: URLForVersion(%d)", version);
    if (version == TTPhotoVersionThumbnail)
        return thumbURL;
    else if (version == TTPhotoVersionSmall)
        return thumbURL;
    else if (version == TTPhotoVersionMedium)
        return fullURL;
    else if (version == TTPhotoVersionLarge)
        return fullURL;
    else
        return nil;
}

@end