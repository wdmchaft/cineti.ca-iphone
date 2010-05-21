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
#import "CinetiMoviePoster.h"

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
    NSString *json = @"{\"posters\": ["
        "{\"href\": \"http://example.com/poster.jpg\", \"size\": \"large\"},"
        "{\"href\": \"http://example.com/poster_thumb.jpg\", \"size\": \"small\"}"
    "],"
    "\"theaters\": ["
        "{\"date\": \"2010-05-19\", "
        "\"times\": ["
           "\"14:50:00\"," 
           "\"17:10:00\"" 
        "]," 
        "\"href\": \"http://api.cineti.ca/theater/scotia\","
        "\"name\": \"Banque Scotia (Paramount)\","
        "\"title\": \"A Nightmare on Elm Street\"}],"
    "\"plot\": \"I am a plot summary\","
    "\"title\": \"Movie Title Goes Here\""
    "}";
    NSDictionary *rawMovie = [json JSONValue];
    CinetiMovie *movie = [CinetiMovie movieFromRawMovie:rawMovie];
    
    NVPassStrEq(movie.title, @"Movie Title Goes Here");
    NVPassStrEq(movie.posterURL, @"http://example.com/poster.jpg");
    NVPassStrEq(movie.posterThumbURL, @"http://example.com/poster_thumb.jpg");

    CinetiPhotoSource *photoSource = [[[CinetiPhotoSource alloc] init] autorelease];
    NVPassEq([photoSource numberOfPhotos], 0);
    NVPassEq([photoSource maxPhotoIndex], -1);
    
    [photoSource addMovie:movie];
    NVPassEq([photoSource numberOfPhotos], 1);
    NVPassEq([photoSource maxPhotoIndex], 0);
    
    CinetiMoviePoster *poster = [photoSource photoAtIndex:0];
    NVPassEq([poster photoSource], photoSource);
    NVPassIntEq([poster index], 0);
    NVPassStrEq([poster URLForVersion:TTPhotoVersionThumbnail], @"http://example.com/poster_thumb.jpg");
    NVPassStrEq([poster URLForVersion:TTPhotoVersionSmall], @"http://example.com/poster_thumb.jpg");
    NVPassStrEq([poster URLForVersion:TTPhotoVersionMedium], @"http://example.com/poster.jpg");
    NVPassStrEq([poster URLForVersion:TTPhotoVersionLarge], @"http://example.com/poster.jpg");
}

@end