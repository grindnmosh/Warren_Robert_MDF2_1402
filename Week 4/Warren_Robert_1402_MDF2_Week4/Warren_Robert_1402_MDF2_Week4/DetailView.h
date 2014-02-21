//
//  DetailView.h
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/11/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoListObject.h"
#import "MovieObject.h"

@interface DetailView : UIViewController
{
    MoListObject  *currentMovie;
    
    IBOutlet UIImageView *movImg;
    IBOutlet UILabel *movName;
    IBOutlet UITableView *timeTable;
    
    NSString *moviename;
    NSString *movieImage;
    NSArray *movieTime;
    NSURL *movieURL;
    
    UITableViewCell *timeCell;
}

-(IBAction)onClick:(UIButton*)button;

//passing of object
@property (strong, nonatomic) MoListObject *insertObject;
@property (strong, nonatomic) MovieObject *insertObject2;

@end
