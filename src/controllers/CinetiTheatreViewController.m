//
//  CinetiTheatreViewController.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-01.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreViewController.h"
#import "CinetiTheatreDataSource.h"
#import "CinetiTheatreModel.h"
#import "Three20/Three20.h"

@implementation CinetiTheatreViewController

- (id)initWithTheatreName:(NSString *)theatreName {
    NSLog(@"In CinetiTheatreViewController initWithTheatreName(%@)", theatreName);
    if (self = [super init]) {
        self.variableHeightRows = YES;
        
        NSString *theatreURL = [NSString stringWithFormat:@"%@%@.json", kTheatreBaseUrl, theatreName];
        self.dataSource = [[[CinetiTheatreDataSource alloc] initWithTheatreURL:theatreURL] autorelease];
    }
    
    return self;
}

@end

