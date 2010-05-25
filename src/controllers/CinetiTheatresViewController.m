//
//  CinetiTheatresViewController.m
//  Cineti
//
//  Created by Peter Zion on 10-04-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiTheatresViewController.h"
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [TTListDataSource dataSourceWithObjects:
                        [TTTableTextItem itemWithText:@"Cinema du Parc"], 
                        [TTTableTextItem itemWithText:@"Cinema Scotia"],
                        [TTTableTextItem itemWithText:@"AMC"],
                        [TTTableTextItem itemWithText:@"Cinema Quartier Latin"],
                        nil];
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
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
