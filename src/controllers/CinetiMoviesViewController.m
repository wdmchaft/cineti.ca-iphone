//
//  CinetiMoviesViewController.m
//  Cineti
//
//  Created by Peter Zion on 10-04-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMoviesViewController.h"
#import "CinetiMoviesRequest.h"
#import "CinetiPhotoSource.h"
#import "Three20/Three20.h"

@implementation CinetiMoviesViewController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Movies";
    }
    return self;
}

// Our own convenience initializer, since we don't care about nibs.
- (id)init {
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    NSLog(@"CinetiMoviesViewController: viewDidLoad");
    [super viewDidLoad];
    self.photoSource = [[[CinetiPhotoSource alloc] init] autorelease];
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
}


- (void)dealloc {
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
