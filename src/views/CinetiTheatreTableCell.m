//
//  CinetiTheatreTableCell.m
//  Cineti
//
//  Created by Peter McCurdy on 10-06-09.
//  Copyright 2010 The Navarra Group. All rights reserved.
//

#import "CinetiTheatreTableCell.h"
#import "CinetiTheatreTableItem.h"


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
    [_imageView2 release];
    [super dealloc];
}

- (TTImageView *)imageView2
{
    if (!_imageView2)
    {
        _imageView2 = [[TTImageView alloc] init];
        [self.contentView addSubview:_imageView2];
    }
    return _imageView2;
}

#pragma mark TTTableViewCell

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
    /*
    TTTableSubtitleItem* item = object;
    
    CGFloat height = TTSTYLEVAR(tableFont).ttLineHeight + kTableCellVPadding*2;
    if (item.subtitle) {
        height += TTSTYLEVAR(font).ttLineHeight;
    }
    */
    return 160;
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
    
    if (_imageView2) {
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
        
        _imageView2.frame = CGRectMake(kTableCellSmallMargin, kTableCellSmallMargin, 95, 140);
        [_imageView2 setStyle:style];
        
        textLeftMargin = _imageView2.right + kTableCellSmallMargin;
    }
    else
        textLeftMargin = kTableCellHPadding;
    
    CGFloat textWidth = self.contentView.width - (_imageView2.width + 2*kTableCellSmallMargin);
    self.textLabel.frame = CGRectMake(textLeftMargin, 0, textWidth, self.textLabel.font.ttLineHeight);
    self.detailTextLabel.frame = CGRectMake(textLeftMargin, self.textLabel.bottom, textWidth, self.detailTextLabel.font.ttLineHeight);
}



@end
