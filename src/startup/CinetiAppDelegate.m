//
//  CinetiAppDelegate.m
//  cineti.ca-iphone
//
//  Created by Peter Zion on 10-04-21.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CinetiAppDelegate.h"
#import "CinetiMoviesViewController.h"
#import "CinetiMovieViewController.h"
#import "CinetiTheatresViewController.h"
#import "CinetiTheatreViewController.h"
#import "CinetiTabBarController.h"

@implementation CinetiAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {   
    TTNavigator *navigator = [TTNavigator navigator];
    navigator.persistenceMode = TTNavigatorPersistenceModeAll;
    navigator.window = [[[UIWindow alloc] initWithFrame:TTScreenBounds()] autorelease];
    
    TTURLMap *map = navigator.URLMap;
    
    [map from:@"http://api.cineti.ca" toSharedViewController:[CinetiTabBarController class]];
    [map from:@"http://api.cineti.ca/movies" toSharedViewController:[CinetiMoviesViewController class]];
    [map from:kMovieBaseUrl @"(initWithMovieId:)" toViewController:[CinetiMovieViewController class]];
    [map from:@"http://api.cineti.ca/theaters" toSharedViewController:[CinetiTheatresViewController class]];
    [map from:kTheatreBaseUrl @"(initWithTheatreName:)" toViewController:[CinetiTheatreViewController class]];

    if (![navigator restoreViewControllers]) {
        // This is the first launch, so we just start with the tab bar
        [navigator openURLAction:[TTURLAction actionWithURLPath:@"http://api.cineti.ca"]];
    }
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

