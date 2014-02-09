//
//  JailCell.m
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "JailCell.h"
#import "ArrayObject.h"

@implementation JailCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)loadCell
{
    
    //assign outlets with info
    self->frUser.text = _tText;
    
    self->frImage.image = _tImage;
    // NSLog(@"%@", _tImage);
}

@end
