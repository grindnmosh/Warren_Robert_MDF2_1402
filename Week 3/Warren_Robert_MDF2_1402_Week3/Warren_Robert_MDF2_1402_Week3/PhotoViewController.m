//
//  PhotoViewController.m
//  Warren_Robert_MDF2_1402_Week3
//
//  Created by Robert Warren on 2/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //loads images into ui
    self->origImage.image = _insertImage;
    self->editImage.image = _insertEdited;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(UIButton*)button
{
    //saves image and alerts it was saved
    if (button.tag == 0)
    {
        UIImageWriteToSavedPhotosAlbum(_insertImage, self, nil, nil);
        UIImageWriteToSavedPhotosAlbum(_insertEdited, self, nil, nil);
        
        alert = [[UIAlertView alloc] initWithTitle:@"Image saved"
                                           message:@"\n"
                                          delegate:self
                                 cancelButtonTitle:@"ok"
                                 otherButtonTitles:nil];
        [alert show];
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    //cancels out images without saving
    else if (button.tag == 1)
    {
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



@end
