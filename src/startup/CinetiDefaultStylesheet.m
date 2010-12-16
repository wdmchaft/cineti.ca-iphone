//
//  CinetiDefaultStylesheet.m
//  Cineti
//
//  Created by Peter McCurdy on 10-12-16.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiDefaultStylesheet.h"


@implementation CinetiDefaultStyleSheet

///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)launcherButton:(UIControlState)state {
    return
    [TTPartStyle styleWithName:@"image" style:TTSTYLESTATE(launcherButtonImage:, state) next:
     [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:11] color:RGBCOLOR(180, 180, 180)
                minimumFontSize:11 shadowColor:nil
                   shadowOffset:CGSizeZero next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)launcherButtonImage:(UIControlState)state {
    TTStyle* style =
    [TTBoxStyle styleWithMargin:UIEdgeInsetsMake(-7, 0, 11, 0) next:
     [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:8] next:
      [TTImageStyle styleWithImageURL:nil defaultImage:nil contentMode:UIViewContentModeCenter
                                 size:CGSizeZero next:nil]]];
    
    if (state == UIControlStateHighlighted || state == UIControlStateSelected) {
        [style addStyle:
         [TTBlendStyle styleWithBlend:kCGBlendModeSourceAtop next:
          [TTSolidFillStyle styleWithColor:RGBACOLOR(0,0,0,0.5) next:nil]]];
    }
    
    return style;
}

@end
