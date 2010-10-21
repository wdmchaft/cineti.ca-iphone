//
//  LogicTestCase.m
//  Cineti
//
//  Created by Peter McCurdy on 10-04-26.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "LogicTestCase.h"

#import "CinetiMovie.h"
#import "CinetiPhotoSource.h"

#import "NSString+SBJSON.h"

@implementation LogicTestCase

#define NVPassEq(a, b) STAssertEquals((a), (b), @"[%@] == [%@]", (a), (b))
#define NVPassIntEq(a, b) STAssertEquals((a), (b), @"[%d] == [%d]", (a), (b))
#define NVPassStrEq(a, b) STAssertTrue([(a) isEqualToString:(b)], @"[%@] == [%@]", (a), (b))

- (void) testFail {
    STAssertTrue(TRUE, @"This had better pass...");
}

- (void)testMovieAttributes {
    //NSDictionary *rawMovie = [NSDictionary dictionaryWithObjectsAndKeys:
    NSString *json = @"{\"title\": \"Movie Title Goes Here\","
        "\"href\": \"http://example.com/poster\","
        "\"thumbnail\": \"http://example.com/poster_thumb.jpg\""
    "}";
    NSDictionary *rawMovie = [json JSONValue];
    CinetiMovie *movie = [CinetiMovie movieFromRawMovie:rawMovie];
    
    NVPassStrEq(movie.title, @"Movie Title Goes Here");
    NVPassStrEq(movie.posterURL, @"http://example.com/poster_thumb.jpg");
    NVPassStrEq(movie.posterThumbURL, @"http://example.com/poster_thumb.jpg");

    CinetiPhotoSource *photoSource = [[[CinetiPhotoSource alloc] init] autorelease];
    NVPassEq([photoSource numberOfPhotos], 0);
    NVPassEq([photoSource maxPhotoIndex], -1);
    
    CinetiMovie *emptyMovie = [[[CinetiMovie alloc] init] autorelease];
    [photoSource addMovie:emptyMovie];
    NVPassEq([photoSource numberOfPhotos], 0);
    NVPassEq([photoSource maxPhotoIndex], -1);
    
    [photoSource addMovie:movie];
    NVPassEq([photoSource numberOfPhotos], 1);
    NVPassEq([photoSource maxPhotoIndex], 0);
    
    NVPassEq([movie photoSource], photoSource);
    NVPassIntEq([movie index], 0);
    
    NVPassStrEq([movie URLForVersion:TTPhotoVersionThumbnail], @"http://example.com/poster_thumb.jpg");
    NVPassStrEq([movie URLForVersion:TTPhotoVersionSmall], @"http://example.com/poster_thumb.jpg");
    NVPassStrEq([movie URLForVersion:TTPhotoVersionMedium], @"http://example.com/poster.jpg");
    NVPassStrEq([movie URLForVersion:TTPhotoVersionLarge], @"http://example.com/poster.jpg");

}

@end