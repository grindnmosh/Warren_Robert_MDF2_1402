//
//  ViewController.h
//  Warren_Robert_MDF2_1402_Week3
//
//  Created by Robert Warren on 2/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImage *ogImage;
    UIImage *edits;
    NSString *videoPath;
}
@end
