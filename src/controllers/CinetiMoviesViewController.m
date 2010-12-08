//
//  CinetiMoviesViewController.m
//  Cineti
//
//  Created by Peter Zion on 10-04-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMoviesViewController.h"
#import "CinetiMoviesRequest.h"
#import "CinetiMovieManager.h"
#import "CinetiPhotoSource.h"
#import "Three20/Three20.h"

@implementation CinetiMoviesViewController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Movies";
        self.hidesBottomBarWhenPushed = NO;
        self.statusBarStyle = UIStatusBarStyleDefault;
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
    self.navigationBarStyle = UIBarStyleDefault;
    self.navigationBarTintColor = [UIColor redColor];

    [[CinetiMoviesRequest moviesRequestWithDelegate:self] retain];
}

// TTThumbsViewController doesn't let you set the nav bar to translucent using 
// its own properties (set in viewDidLoad) unless you set the navigationBarStyle 
// to UIBarStyleBlackTranslucent; instead, if you want a translucent coloured 
// nav bar, you have to set it yourself here.
/*
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UINavigationBar* navBar = self.navigationController.navigationBar;
    navBar.tintColor = [UIColor redColor];
    navBar.translucent = YES;
}
/**/

// If the navigation bar is set to non-translucent, we need to adjust the offset 
// of the table layout; TTThumbsViewController assumes that the navigation bar 
// is translucent, and so manually ensures that the table view starts out below it.
- (void)updateTableLayout
{
    self.tableView.contentInset = UIEdgeInsetsMake(4, 0, 0, 0); 
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero; 
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
    
    for (CinetiMovie *movie in movies)
    {
        NSLog(@"Got movie %@", movie.title);
        [[CinetiMovieManager sharedInstance] addMovie:movie withKey:movie.movieid];
        // FIXME: Redo all this photosource business
        [(CinetiPhotoSource *)self.photoSource addMovie:movie];
    }
	[request autorelease];
}


- (void)moviesRequest:(CinetiMoviesRequest *)request didFailWithError:(NSError *)error {
	NSLog( @"Failed to retrieve movies" );
	[request autorelease];
}


@end
