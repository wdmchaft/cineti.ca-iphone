//
//  CinetiPhotoSource.m
//  Cineti
//
//  Created by Peter McCurdy on 10-05-19.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiPhotoSource.h"
#import "CinetiMoviePoster.h"

@implementation CinetiPhotoSource

- (id)init {
    NSLog(@"CinetiPhotoSource: init");
    if (self = [super init]) {
        _title = @"Test Photo Source";
        CinetiMoviePoster *poster = [[[CinetiMoviePoster alloc] init] autorelease];
        poster.photoSource = self;
        poster.index = 0;
        _photos = [[NSArray alloc] initWithObjects:poster, nil];
    }
    return self;
}

- (void)dealloc {
    [_photos dealloc];
    [super dealloc];
}

#pragma mark TTPhotoSource Methods

@synthesize title = _title;

- (NSInteger)numberOfPhotos
{
    NSLog(@"CinetiPhotoSource: numberOfPhotos");
    return _photos.count;
}

- (NSInteger)maxPhotoIndex
{
    NSLog(@"CinetiPhotoSource: maxPhotoIndex (%d)", [_photos count] - 1);
    return _photos.count - 1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)index
{
    NSLog(@"CinetiPhotoSource: photoAtIndex %d", index);
    if (index < 0 || index > [self maxPhotoIndex])
        return nil;
    
    return [_photos objectAtIndex:index];
}

@end
