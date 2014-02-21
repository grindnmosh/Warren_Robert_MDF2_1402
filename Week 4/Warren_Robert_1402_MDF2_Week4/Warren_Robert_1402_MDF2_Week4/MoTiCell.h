//
//  MoTiCell.h
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/12/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoTiCell : UITableViewCell
{
    IBOutlet UILabel *feedText;
    IBOutlet UILabel *feedTime1;
    IBOutlet UILabel *feedTime2;
    IBOutlet UILabel *feedTime3;
    IBOutlet UIImageView *feedThImage;
}

//method
-(void)loadCell;

//properties
@property (nonatomic, strong) NSString *tText;
@property (nonatomic, strong) NSString *time1;
@property (nonatomic, strong) NSString *time2;
@property (nonatomic, strong) NSString *time3;
@property (nonatomic, strong) UIImage *thImage;

@end
