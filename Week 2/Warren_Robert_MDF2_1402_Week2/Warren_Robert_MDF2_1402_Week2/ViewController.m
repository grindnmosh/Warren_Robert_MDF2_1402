//
//  ViewController.m
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "JailCell.h"
#import "DetailView.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "ArrayObject.h"
#import "UserInfoObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    dataPass = [ArrayObject sharedDataManager];
    //call on twitter feed on initial launch
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
    ^{
        [self fetchTweets];
    });
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



-(void)fetchTweets
{
    alert = [[UIAlertView alloc] initWithTitle:@"Loading Friends"
                                       message:@"\n"
                                      delegate:self
                             cancelButtonTitle:nil
                             otherButtonTitles:nil];
    [alert show];
    ACAccountStore *ACStore = [[ACAccountStore alloc] init];
    
    if (ACStore != nil)
    {
        
        
        
        ACAccountType *ACType =[ACStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (ACType != nil)
        {
            
            
            [ACStore requestAccessToAccountsWithType:ACType options:nil completion:^(BOOL granted, NSError *error)
             {
                 if (!granted) {
                     [alert dismissWithClickedButtonIndex:0 animated:YES];
                     
                     alert = [[UIAlertView alloc] initWithTitle:@"No Twitter Access"
                                                        message:@"\n"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"Close App", nil];
                     [alert show];
                 }
                 else
                 {
                     
                 {
                 NSArray *twitAcc = [ACStore accountsWithAccountType:ACType];
                 if (twitAcc != nil)
                 {
                     ACAccount *currAcc = [twitAcc objectAtIndex:0];
                     if (currAcc != nil)
                     {
                         
                         NSString *userTimeStr = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";
                         
                         SLRequest *req = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userTimeStr] parameters:nil];
                         if (req != nil)
                         {
                             [req setAccount:currAcc];
                             
                             [req performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                 NSInteger rCode = [urlResponse statusCode];
                                 if (rCode == 200)
                                 {
                                     
                                     
                                     feeder = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                    
                                     if (feeder != nil)
                                     {
                                         userDict = [[NSDictionary alloc] init];
                                         user = [feeder objectForKey:@"users"];
                                         for(int i=0; i < user.count; i++)
                                         {
                                             userDict = [user objectAtIndex:i];
                                             userName = [userDict valueForKey:@"name"];
                                             //NSLog(@"%@", userName);
                                             NSURL *url = [NSURL URLWithString:[userDict valueForKey:@"profile_image_url"]];
                                             NSData *image = [NSData dataWithContentsOfURL:url];
                                             twitImage = [[UIImage alloc] initWithData:image];
                                             UserInfoObject *load = [[UserInfoObject alloc] initWithName:userName image:twitImage];
                                             ArrayObject *database = [ArrayObject sharedDataManager];
                                             if (database != nil)
                                             {
                                                 //create businessName Loader
                                                 profileInfo = database.profileInfo;
                                                 if (profileInfo != nil)
                                                 {
                                                     [profileInfo addObject:load];
                                                 }
                                             
                                         }
                                         
                                         //NSLog(@"%@", feeder);
                                         
                                         
                                         }
                                     }
                                     [coll reloadData];
                                 }
                                 else if (rCode != 200)
                                 {
                                     [alert dismissWithClickedButtonIndex:0 animated:YES];
                                     
                                     alert = [[UIAlertView alloc] initWithTitle:@"connection error"
                                                                        message:@"\n"
                                                                       delegate:self
                                                              cancelButtonTitle:nil
                                                              otherButtonTitles:@"Close App", nil];
                                     [alert show];
                                 }
                                 
                             }];
                         }
                     }
                 }
             }
                 }
             }];
        }
        
    }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0)
    {
        exit(0);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   // NSLog(@"%lu", (unsigned long)[feeder count]);
    dataPass = [ArrayObject sharedDataManager];
     NSLog(@"%lu", (unsigned long)[dataPass.profileInfo count]);
    return [dataPass.profileInfo count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    JailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"jailCell" forIndexPath:indexPath];
    if (cell != nil)
    {
        
        NSDictionary *dataFile = [[profileInfo objectAtIndex:indexPath.row] userInfo];
        dataImage = [[profileInfo objectAtIndex:indexPath.row] profileImage];
        cell.tText = [NSString stringWithFormat:@"%@", dataFile];
        cell.tImage = dataImage;
        //NSLog(@"%@", cell.tImage);
        //NSLog(@"%@", cell.tText);
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        [cell loadCell];
    }
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *userNameData = [[profileInfo objectAtIndex:indexPath.row] userInfo];
    dataPass.uniName = [NSString stringWithFormat:@"%@", userNameData];
    detImage = [[profileInfo objectAtIndex:indexPath.row] profileImage];
    dataPass.uniImage = detImage;
    
    [self performSegueWithIdentifier: @"detail" sender: self];
}




@end
