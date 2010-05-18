//
//  CinetiMoviesViewController.h
//  Cineti
//
//  Created by Peter Zion on 10-04-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinetiMoviesRequestDelegate.h"

@class TTThumbsViewController;

@interface CinetiMoviesViewController : UIViewController <CinetiMoviesRequestDelegate> {
    TTThumbsViewController *thumbsViewController;
}

@property (nonatomic, retain) TTThumbsViewController *thumbsViewController;

@end
