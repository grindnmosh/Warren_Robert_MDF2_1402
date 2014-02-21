//
//  ViewController.h
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/11/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieObject.h"

@interface ViewController : UIViewController
{
    
    IBOutlet UITableView *tabled;
    
    
    MovieObject *TheaterName;
    MoListObject *MovieBlock;
    MoListObject *currentBlock;
    MovieObject  *currentMovieImage;
    MoListObject  *currentMovie;
    
    
    NSMutableArray *mdf1;
    NSMutableArray *mdf2;
    NSMutableArray *mdf3;
    NSMutableArray *mdfTheater;
    NSMutableArray *MovieObjects;
    NSMutableArray *TheaterObjects;
    NSMutableArray *termArray;
}
@end
