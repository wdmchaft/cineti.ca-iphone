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
