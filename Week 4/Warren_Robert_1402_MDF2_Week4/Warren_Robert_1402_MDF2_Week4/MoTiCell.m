//
//  MoTiCell.m
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/12/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "MoTiCell.h"

@implementation MoTiCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadCell
{
    //assign outlets with info
    feedText.text = _tText;
    feedTime1.text = _time1;
    feedTime2.text = _time2;
    feedTime3.text = _time3;
    feedThImage.image = _thImage;
}

@end
