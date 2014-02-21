//
//  ViewController.m
//  Warren_Robert_MDF2_1402_Week3
//
//  Created by Robert Warren on 2/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "PhotoViewController.h"
#import "VideoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    //tells page what to do when it reappears
    if (ogImage != nil)
    {
        [self performSegueWithIdentifier: @"photoViewer" sender: self];
    }
    else if (videoPath != nil)
    {
        [self performSegueWithIdentifier: @"videoViewer" sender: self];
    }
    else
    {
        //do nothing
    }
        
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", [info description]);
    UIImage *selected = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //pass in original image
    if (selected != nil)
    {
        ogImage = selected;
    }
    //pass in edited image
    UIImage *edited = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (edited != nil)
    {
        edits = edited;
    }
    //pass in viedeo file
    NSURL *videoUrl = [info valueForKey:UIImagePickerControllerMediaURL];
    if (videoUrl != nil)
    {
        videoPath = [videoUrl path];
        NSLog(@"%@", videoPath);
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"photoViewer"])
    {
        //photo viewer segue
        PhotoViewController *destination = segue.destinationViewController;
        destination.insertImage = ogImage;
        destination.insertEdited = edits;
        ogImage = nil;
        edits = nil;
    }
    else if ([segue.identifier isEqualToString:@"videoViewer"])
    {
        //video viewer segue
        VideoViewController *destination = segue.destinationViewController;
        destination.insertVideo = videoPath;
        videoPath = nil;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        
        //camera button
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        //picker.delegate = self;
        
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        picker.delegate = self;
        
        picker.allowsEditing = true;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else if (button.tag == 1)
    {
        //camcorder button
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        //picker.delegate = self;
        
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        picker.delegate = self;
        
        picker.allowsEditing = false;
        picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
        picker.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeMovie, nil];
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else if (button.tag == 2)
    {
        //gallery button
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        picker.mediaTypes =
        [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        
        picker.delegate = self;
        
        picker.allowsEditing = false;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

@end
