//
//  JailCell.h
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrayObject.h"

@interface JailCell : UICollectionViewCell
{
    UIImage *loadImage;
    ArrayObject * dataPass;
    IBOutlet UIImageView *frImage;
    IBOutlet UILabel *frUser;
    
}

@property (nonatomic, strong) NSString *tText;
@property (nonatomic, strong) UIImage *tImage;


//method
-(void)loadCell;

@end
