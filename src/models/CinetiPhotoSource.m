//
//  CinetiPhotoSource.m
//  Cineti
//
//  Created by Peter McCurdy on 10-05-19.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiPhotoSource.h"

#pragma mark -

@interface CinetiMoviePoster : NSObject <TTPhoto>
{
    NSString *caption;
    id <TTPhotoSource> photoSource;
    CGSize size;
    NSInteger index;
}

@end

#pragma mark -

@implementation CinetiPhotoSource

@synthesize photos;

- (id)init {
    NSLog(@"CinetiPhotoSource: init");
    if (self = [super init]) {
        self.title = @"Test Photo Source";
        CinetiMoviePoster *poster = [[[CinetiMoviePoster alloc] init] autorelease];
        poster.photoSource = self;
        poster.index = 0;
        self.photos = [[NSArray alloc] initWithObjects:poster, nil];
    }
    return self;
}

- (void)dealloc {
    [self.photos dealloc];
    [super dealloc];
}

#pragma mark TTPhotoSource Methods

@synthesize title;

- (NSInteger)numberOfPhotos
{
    NSLog(@"CinetiPhotoSource: numberOfPhotos");
    return [self.photos count];
}

- (NSInteger)maxPhotoIndex
{
    NSLog(@"CinetiPhotoSource: maxPhotoIndex (%d)", [self.photos count] - 1);
    return [self.photos count] - 1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)index
{
    NSLog(@"CinetiPhotoSource: photoAtIndex %@", index);
    if (index < 0 || index > [self maxPhotoIndex])
        return nil;
    
    return [self.photos objectAtIndex:index];
}

@end

#pragma mark -

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