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
        fullURL = [URL retain];
        thumbURL = [thumbnailURL retain];
        caption = [title retain];
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
    NSString *url = nil;
    if (version == TTPhotoVersionThumbnail || version == TTPhotoVersionSmall)
        url = thumbURL;
    else if (version == TTPhotoVersionMedium || version == TTPhotoVersionLarge)
    {
        // FIXME: We should get the real URL from the movie details JSON
        url = [thumbURL stringByReplacingOccurrencesOfString:@"_thumb.jpg" withString:@".jpg"];
    }
    
    //NSLog(@"CinetiMoviePoster: URLForVersion(%d)=%@", version, url);
    return url;
}

@end