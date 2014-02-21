//
//  VideoViewController.h
//  Warren_Robert_MDF2_1402_Week3
//
//  Created by Robert Warren on 2/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController : ViewController
{
    IBOutlet UIView *mPlayer;
    MPMoviePlayerController *moviePlayer;
    UIAlertView *alert;
}

@property (strong, nonatomic) NSString *insertVideo;

@end
