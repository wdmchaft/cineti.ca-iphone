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

- (id)init {
    if (self = [super init]) {
        self.title = @"Test Photo Source";
    }
    return self;
}

#pragma mark TTPhotoSource Methods

@synthesize title;

- (NSInteger)numberOfPhotos
{
    return 1; 
}

- (NSInteger)maxPhotoIndex
{
    return 1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)index
{
    NSLog(@"CinetiPhotoSource: photoAtIndex %@", index);
    if (index < 0 || index > [self maxPhotoIndex])
        return nil;
    
    return [[[CinetiMoviePoster alloc] init] autorelease];
}

#pragma mark TTURLRequestModel Methods



@end

#pragma mark -

@implementation CinetiMoviePoster

// TTPhoto protocol properties
@synthesize caption;
@synthesize photoSource;
@synthesize size;
@synthesize index;

- (id)init {
    if (self = [super init]) {
        self.caption = @"A Movie Caption";
        self.size = CGSizeMake(140, 207);
    }
    return self;
}

- (void)dealloc {
    [caption release];
    [photoSource release];
    [super dealloc];
}

#pragma mark TTPhoto methods

- (NSString *)URLForVersion:(TTPhotoVersion)version
{
    return @"http://cineti.ca/poster/11913.jpg";
}

@end