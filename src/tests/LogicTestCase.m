//
//  LogicTestCase.m
//  Cineti
//
//  Created by Peter McCurdy on 10-04-26.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "LogicTestCase.h"

@implementation LogicTestCase

- (void) testFail {
    STAssertTrue(TRUE, @"This had better pass...");
}

@end