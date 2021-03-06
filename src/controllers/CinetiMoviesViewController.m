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
#import "Three20/Three20.h"

@implementation TTLauncherView (DisableEditing) 

- (void)editHoldTimer:(NSTimer*)timer {
    _editHoldTimer = nil; 
}

@end

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

- (void)dealloc {
    [super dealloc];
}

#pragma mark UIViewController

- (void)loadView
{
    NSLog(@"CinetiMoviesViewController: loadView");
    [super loadView];
    
    _launcher = [[TTLauncherView alloc] initWithFrame:self.view.bounds];
    _launcher.delegate = self;
    _launcher.columnCount = 3;
    _launcher.backgroundColor = [UIColor colorWithRed:236/255.0f green:236/255.0f blue:236/255.0f alpha:1.0f];
    [self.view addSubview:_launcher];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [[CinetiMoviesRequest moviesRequestWithDelegate:self] retain];
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark TTLauncherViewDelegate

- (void)launcherView:(TTLauncherView*)launcher didSelectItem:(TTLauncherItem*)item {
    [[TTNavigator navigator] openURLAction:[[TTURLAction actionWithURLPath:item.URL] applyAnimated:YES]];
}

- (void)launcherViewDidBeginEditing:(TTLauncherView*)launcher {
    [self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc]
                                                 initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                 target:_launcher action:@selector(endEditing)] autorelease] animated:YES];
}

- (void)launcherViewDidEndEditing:(TTLauncherView*)launcher {
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

#pragma mark CinetiMoviesRequestDelegate

- (void)moviesRequest:(CinetiMoviesRequest *)request didSucceedWithMovies:(NSArray *)movies {
	NSLog( @"Successfully retrieved %d movies", [movies count] );
    
    NSMutableArray *picturelessMovies = [[[NSMutableArray alloc] init] autorelease];
    _launcher.pages = nil;
    for (CinetiMovie *movie in movies)
    {
        NSLog(@"Got movie %@, URL %@", movie.title, movie.movieid);
        [[CinetiMovieManager sharedInstance] addMovie:movie withKey:movie.movieid];
        TTLauncherItem *item = [[[TTLauncherItem alloc] initWithTitle:movie.title image:movie.posterThumbURL URL:movie.movieid] autorelease];
        if (movie.posterThumbURL != nil)
            [_launcher addItem:item animated:NO];
        else
            [picturelessMovies addObject:item];
    }
    // Collect all the movies without thumbnails at the end.
    for (TTLauncherItem *item in picturelessMovies) {
        [_launcher addItem:item animated:NO];
    }
    [_launcher setCurrentPageIndex:0];
	[request autorelease];
}


- (void)moviesRequest:(CinetiMoviesRequest *)request didFailWithError:(NSError *)error {
	NSLog( @"Failed to retrieve movies" );
	[request autorelease];
}


@end
