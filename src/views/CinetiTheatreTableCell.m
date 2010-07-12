//
//  CinetiTheatreTableCell.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-09.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreTableCell.h"
#import "CinetiTheatreTableItem.h"

#define kImageWidth 95
#define kImageHeight 140

@implementation CinetiTheatreTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSLog(@"CinetiTheatreTableCell:initWithStyle:reuseIdentifier:");
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier])
    {
    }
    return self;
}

- (void)dealloc
{
//    [_imageView2 release];
    [super dealloc];
}

/*
- (TTImageView *)imageView2
{
    if (!_imageView2)
    {
        _imageView2 = [[TTImageView alloc] init];
        [self.contentView addSubview:_imageView2];
    }
    return _imageView2;
}
 */

#pragma mark TTTableViewCell

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
    CinetiTheatreTableItem* item = object;
    
    CGFloat height = TTSTYLEVAR(tableFont).ttLineHeight + kTableCellVPadding*2;
    if (item.subtitle) {
        height += TTSTYLEVAR(font).ttLineHeight;
    }
    
    if (item.imageURL) {
        CGFloat imageHeight = kImageHeight + 2*kTableCellSmallMargin;
        if (height < imageHeight)
            height = imageHeight;
    }
    return height;
}

- (void)setObject:(id)object
{
    if (_item != object)
    {
        [super setObject:object];
        
        CinetiTheatreTableItem *item = (CinetiTheatreTableItem *)object;
        self.textLabel.text = item.text;
        self.detailTextLabel.text = @"subtexty";
        self.imageView2.urlPath = item.imageURL;
    }
}

#pragma mark UIView

- (void)layoutSubviews 
{
    [super layoutSubviews];
    CGFloat textLeftMargin = 0;
    
    if (self.imageView2) {
        TTStyle *style = 
         [TTShapeStyle styleWithShape:[TTRectangleShape shape] next:
         [TTSolidBorderStyle styleWithColor:[UIColor colorWithWhite:0.86 alpha:1] width:1 next:
         [TTInsetStyle styleWithInset:UIEdgeInsetsMake(2, 2, 2, 2) next:
         [TTContentStyle styleWithNext:
         [TTImageStyle styleWithImageURL:nil 
                            defaultImage:nil 
                             contentMode:UIViewContentModeScaleAspectFill 
                                    size:CGSizeMake(68, 100) 
                                    next:nil
             ]]]]];
        
        self.imageView2.frame = CGRectMake(kTableCellSmallMargin, kTableCellSmallMargin, kImageWidth, kImageHeight);
        [self.imageView2 setStyle:style];
        
        textLeftMargin = self.imageView2.right + kTableCellSmallMargin;
    }
    else
        textLeftMargin = kTableCellHPadding;
    
    CGFloat textWidth = self.contentView.width - (self.imageView2.width + 2*kTableCellSmallMargin);
    self.textLabel.frame = CGRectMake(textLeftMargin, 0, textWidth, self.textLabel.font.ttLineHeight);
    self.detailTextLabel.frame = CGRectMake(textLeftMargin, self.textLabel.bottom, textWidth, self.detailTextLabel.font.ttLineHeight);
}



@end
