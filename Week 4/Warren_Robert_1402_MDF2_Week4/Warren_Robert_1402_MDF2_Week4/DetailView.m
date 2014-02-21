//
//  DetailView.m
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/11/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "DetailView.h"
#import "PlayerView.h"


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
    moviename = [NSString stringWithFormat:@"%@", [_insertObject movieName]];
    movieImage = [NSString stringWithFormat:@"%@", [_insertObject posters]];
    movieTime = [_insertObject movieTimes];
    movieURL =  [NSURL URLWithString:[_insertObject movieURL]];
    
    self->movImg.image = [UIImage imageNamed:movieImage];
    self->movName.text = moviename;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
     return [movieTime count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    UIView *theatreView = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 60)];
    UIImage *himage = [UIImage imageNamed:[_insertObject2 theatreImage]];
    UILabel *thLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    thLabel.font = [UIFont boldSystemFontOfSize:13];
    thLabel.frame = CGRectMake(200, 10, 400, 30);
    thLabel.text = [NSString stringWithFormat:@"%@", [_insertObject2 theaterName]];
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectZero];
    address.text = [NSString stringWithFormat:@"%@", [_insertObject2 theaterLocale]];
    address.font = [UIFont systemFontOfSize:9];
    address.frame = CGRectMake(230, 40, 500, 25);
    UIImageView *thImgView = [[UIImageView alloc] initWithImage:himage];
    thImgView.frame = CGRectMake(30, 10, 140, 70);
    [theatreView addSubview:thImgView];
    [theatreView addSubview:thLabel];
    [theatreView addSubview:address];
    return theatreView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Test";
    timeCell = [timeTable dequeueReusableCellWithIdentifier: cellId];
    if (timeCell == nil)
    {
        timeCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //load location
    timeCell.textLabel.text = [movieTime objectAtIndex:indexPath.row];
    return timeCell;
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        currentMovie = _insertObject;
        
        
        [self performSegueWithIdentifier: @"preview" sender: self];
    }
    else if (button.tag == 1)
    {
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"preview"])
    {
        PlayerView *destination = segue.destinationViewController;
        destination.insertPreview = currentMovie;
    }
}

@end
