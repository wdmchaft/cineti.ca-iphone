//
//  CinetiMoviesViewController.m
//  Cineti
//
//  Created by Peter Zion on 10-04-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMoviesViewController.h"
#import "CinetiMoviesRequest.h"
#import "Three20/Three20.h"

@implementation CinetiMoviesViewController

@synthesize thumbsViewController;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Movies";
        //self.navigationItem.title = @"Movies View";
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.view = [[[UIView alloc] initWithFrame:TTApplicationFrame()] autorelease];
    thumbsViewController = [[TTThumbsViewController alloc] init];
    [self.view addSubview:thumbsViewController.view];
    [[CinetiMoviesRequest moviesRequestWithDelegate:self] retain];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	thumbsViewController = nil;
}


- (void)dealloc {
    [thumbsViewController release];
    [super dealloc];
}


- (void)moviesRequest:(CinetiMoviesRequest *)request didSucceedWithMovies:(NSArray *)movies {
	NSLog( @"Successfully retrieved %d movies", [movies count] );
	[request autorelease];
}


- (void)moviesRequest:(CinetiMoviesRequest *)request didFailWithError:(NSError *)error {
	NSLog( @"Failed to retrieve movies" );
	[request autorelease];
}


@end
