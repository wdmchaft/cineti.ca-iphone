//
//  CinetiMoviesViewController.h
//  Cineti
//
//  Created by Peter Zion on 10-04-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CinetiMoviesRequestDelegate.h"
#import "Three20/Three20.h"

@interface CinetiMoviesViewController : TTViewController <CinetiMoviesRequestDelegate, TTLauncherViewDelegate> {
    TTLauncherView *_launcher;
}

@end
