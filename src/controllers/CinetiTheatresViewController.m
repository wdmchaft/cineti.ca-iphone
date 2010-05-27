//
//  CinetiTheatresViewController.m
//  Cineti
//
//  Created by Peter Zion on 10-04-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiTheatresViewController.h"
#import "CinetiTheatresDataSource.h"
#import "Three20/Three20.h"


@implementation CinetiTheatresViewController

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Theatres";
    }
    return self;
}

- (id)init {
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad {
    NSLog(@"CinetiTheatresViewController: viewDidLoad");
    [self createModel];
}

- (void)createModel {
    NSLog(@"CinetiTheatresViewController: createModel");
    self.dataSource = [[[CinetiTheatresDataSource alloc] init] autorelease];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
