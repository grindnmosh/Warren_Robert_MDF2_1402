//
//  VideoViewController.m
//  Warren_Robert_MDF2_1402_Week3
//
//  Created by Robert Warren on 2/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "VideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController ()

@end

@implementation VideoViewController

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
    //saves video
    if (button.tag == 0)
    {
        UISaveVideoAtPathToSavedPhotosAlbum(_insertVideo, self, nil, nil);
        
        alert = [[UIAlertView alloc] initWithTitle:@"video saved"
                                           message:@"\n"
                                          delegate:self
                                 cancelButtonTitle:@"ok"
                                 otherButtonTitles:nil];
        [alert show];
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    //closes without saving
    else if (button.tag == 1)
    {
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    //loads and plays video
    else if (button.tag == 2)
    {
        NSString *loadPath = _insertVideo;
        NSURL *loadURL = [NSURL fileURLWithPath:loadPath];
        moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:loadURL];
        if (moviePlayer != nil)
        {
            [mPlayer addSubview:moviePlayer.view];
            moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, mPlayer.frame.size.width, mPlayer.frame.size.height);
            
            moviePlayer.fullscreen = false;
            moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
            [moviePlayer play];
        }
    }
    //stops video playback
    else if (button.tag == 3)
    {
        [moviePlayer stop];
    }
}

@end
