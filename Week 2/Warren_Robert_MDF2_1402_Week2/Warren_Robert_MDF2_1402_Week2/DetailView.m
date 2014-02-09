//
//  DetailView.m
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "DetailView.h"
#import "ArrayObject.h"

@interface DetailView ()

@end

@implementation DetailView

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
    
    dataPass = [ArrayObject sharedDataManager];
    NSString *uniName = [dataPass uniName];
    UIImage *uniImage = [dataPass uniImage];
   

    self->userDetailName.text = uniName;
    self->userDetailPic.image = uniImage;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onFinish:(id)sender
{
    //close
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
