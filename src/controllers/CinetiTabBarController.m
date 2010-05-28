//
//  CinetiTabBarController.m
//  Cineti
//
//  Created by Peter McCurdy on 10-05-28.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTabBarController.h"


@implementation CinetiTabBarController

- (void)viewDidLoad
{
    [self setTabURLs:[NSArray arrayWithObjects:
                      @"http://api.cineti.ca/movies",
                      @"http://api.cineti.ca/theatres",
                      nil]];
}

@end
