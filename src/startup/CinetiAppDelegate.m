//
//  CinetiAppDelegate.m
//  cineti.ca-iphone
//
//  Created by Peter Zion on 10-04-21.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CinetiAppDelegate.h"
#import "CinetiMoviesViewController.h"
#import "CinetiTheatresViewController.h"

@implementation CinetiAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    tabBarController = [[UITabBarController alloc] init];
    
    // Create the controllers that will go in the tabs
    CinetiMoviesViewController *movies = [[[CinetiMoviesViewController alloc] init] autorelease];
    CinetiTheatresViewController *theatres = [[[CinetiTheatresViewController alloc] init] autorelease];
    
    // Add the tabs to the tab bar controller
    [tabBarController setViewControllers:
     [NSArray arrayWithObjects:
      [[[UINavigationController alloc] initWithRootViewController:movies] autorelease], 
      [[[UINavigationController alloc] initWithRootViewController:theatres] autorelease],
      nil]];
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
    [window makeKeyAndVisible];
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

