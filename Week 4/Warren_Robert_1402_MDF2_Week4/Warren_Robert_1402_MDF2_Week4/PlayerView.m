//
//  PlayerView.m
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/11/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "PlayerView.h"
#import <MediaPlayer/MediaPlayer.h>

@interface PlayerView ()

@end

@implementation PlayerView

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
    title = [NSString stringWithFormat:@"%@", [_insertPreview movieName]];
    url = [NSString stringWithFormat:@"%@", [_insertPreview movieURL]];
    
    self->name.text = title;
    
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
    if (button.tag == 0)
    {
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    //loads and plays video
    else if (button.tag == 1)
    {
        NSURL *loadURL = [NSURL URLWithString:url];
        moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:loadURL];
        
        if (moviePlayer != nil)
        {
            [preview addSubview:moviePlayer.view];
            moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, preview.frame.size.width, preview.frame.size.height);
            [moviePlayer prepareToPlay];
            moviePlayer.fullscreen = false;
            [moviePlayer play];
        }
    }
    //stops video playback
    else if (button.tag == 2)
    {
        [moviePlayer stop];
    }
}

@end
