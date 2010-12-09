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
    [self.view addSubview:_launcher];
    
    [[CinetiMoviesRequest moviesRequestWithDelegate:self] retain];
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
}

#pragma mark TTLauncherViewDelegate

- (void)launcherView:(TTLauncherView*)launcher didSelectItem:(TTLauncherItem*)item {
    [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:item.URL]];
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
    
    for (CinetiMovie *movie in movies)
    {
        NSLog(@"Got movie %@, URL %@", movie.title, movie.movieid);
        [[CinetiMovieManager sharedInstance] addMovie:movie withKey:movie.movieid];
        [_launcher addItem:[[[TTLauncherItem alloc] initWithTitle:movie.title image:movie.posterThumbURL URL:movie.movieid] autorelease] animated:NO];
    }
	[request autorelease];
}


- (void)moviesRequest:(CinetiMoviesRequest *)request didFailWithError:(NSError *)error {
	NSLog( @"Failed to retrieve movies" );
	[request autorelease];
}


@end
