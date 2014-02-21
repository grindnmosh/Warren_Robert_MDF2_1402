//
//  PhotoViewController.h
//  Warren_Robert_MDF2_1402_Week3
//
//  Created by Robert Warren on 2/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ViewController.h"

@interface PhotoViewController : ViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet UIImageView *origImage;
    IBOutlet UIImageView *editImage;
    UIAlertView *alert;
}

@property (strong, nonatomic) UIImage *insertImage;
@property (strong, nonatomic) UIImage *insertEdited;

@end
