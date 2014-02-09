//
//  DetailView.h
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrayObject.h"

@interface DetailView : UIViewController
{
    ArrayObject * dataPass;
    IBOutlet UILabel *userDetailName;
    IBOutlet UIImageView *userDetailPic;
}

-(IBAction)onFinish:(id)sender;

@property (strong, nonatomic)  NSString *proName;
@property (strong, nonatomic)  UIImage *proPic;

@end
