//
//  ViewController.h
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrayObject.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    ArrayObject * dataPass;
    NSMutableArray *profileInfo;
    NSDictionary *feeder;
    IBOutlet UICollectionView *coll;
    IBOutlet UICollectionViewFlowLayout *collection;
    NSDictionary *twitDict;
    NSDictionary *userDict;
    NSString *userName;
    UIImage *twitImage;
    NSArray *user;
    NSMutableArray *screenName;
    NSMutableArray *profilePic;
    NSMutableArray *data;
    UIImage *dataImage;
    UIImage *detImage;
    UIImage *userPic;
    UIAlertView *alert;
}
@end
