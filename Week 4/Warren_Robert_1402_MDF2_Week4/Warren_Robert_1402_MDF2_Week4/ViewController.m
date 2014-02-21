//
//  ViewController.m
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/11/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "DetailView.h"
#import "MoTiCell.h"
#import "MovieObject.h"
#import "MoListObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    TheaterName = [MovieObject sharedDataArray];
    MovieBlock = [MoListObject movieDataArray];
    
    //custom nib for my reusable cells
    UINib *MoTiCellNib = [UINib nibWithNibName:@"MoTiCell" bundle:nil];
    if (MoTiCellNib != nil)
    {
        [tabled registerNib:MoTiCellNib forCellReuseIdentifier:@"movieTimes"];
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
        ^{
            [self loadMovies];
        });
    [super viewDidLoad];
    //set row height
    self->tabled.rowHeight = 100.f;
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [tabled reloadData];
}

-(void)loadMovies
{
    MovieObjects = [[NSMutableArray alloc] initWithObjects:
                    [[MoListObject alloc] initWithMovie:@"The Amazing SpiderMan 2" trailer:@"http://movietrailers.apple.com/movies/sony_pictures/theamazingspiderman2/amazingspiderman2-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:45 AM", @"1:30 PM", @"4:10 PM", @"6:50 PM", @"9:30 PM", nil] movieImages:@"AS2.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Thor: The Dark World" trailer:@"http://movietrailers.apple.com/movies/marvel/thorthedarkworld/thorthedarkworld-tlr1_480p.mov" showtimes: [[NSArray alloc] initWithObjects:@"10:10 AM",  @"12:10 PM" , @"3:30 PM" , @"7:30 PM", @"8:15 PM" , @"10:10 PM", nil] movieImages:@"thor.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Captain America: Winter Soldier" trailer:@"http://movietrailers.apple.com/movies/marvel/captainamericathewintersoldier/captainamerica2-biggame1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:30 AM", @"12:50 PM", @"2:10 PM" , @"4:50 PM", @"7:25 PM", @"8:05 PM", @"10:45 PM", nil] movieImages:@"cap.jpg"],
                    [[MoListObject alloc] initWithMovie:@"The Wolverine" trailer:@"http://movietrailers.apple.com/movies/fox/thewolverine/wolverine-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"11:30 AM", @"2:50 PM", @"5:30 PM", @"6:10 PM", @"8:10 PM",  @"10:10 PM", nil] movieImages:@"wolv.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Iron Man 3" trailer:@"http://movietrailers.apple.com/movies/marvel/ironman3/ironman3-tlr2_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:00 AM", @"10:45 AM", @"1:45 PM", @"4:45 PM", @"7:45 PM" , @"10:40 PM" , nil] movieImages:@"im3.jpg"],
                    [[MoListObject alloc] initWithMovie:@"X-Men: Days of Future Past" trailer:@"http://movietrailers.apple.com/movies/fox/xmendaysoffuturepast/xmendaysoffuturepast-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:45 AM", @"12:45 PM", @"3:45 PM", @"6:45 PM", @"9:40 PM" , nil] movieImages:@"xmen.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Avengers" trailer:@"http://movietrailers.apple.com/movies/marvel/theavengers/avengers-interogation_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"11:15 AM", @"2:10 PM", @"5:00 PM", @"8:00 PM", @"10:50 PM" , nil] movieImages:@"aven.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Girl on a Bicycle" trailer:@"http://movietrailers.apple.com/movies/independent/girlonabicycle/girlonabicycle-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:15 AM", @"1:10 PM", @"4:00 PM", @"7:00 PM", @"10:00 PM" , nil] movieImages:@"goab.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Shirin in Love" trailer:@"http://movietrailers.apple.com/movies/independent/shirininlove/shirininlove-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:45 AM", @"1:30 PM", @"4:10 PM", @"6:50 PM", @"9:30 PM", nil] movieImages:@"shirin.jpg"],
                    [[MoListObject alloc] initWithMovie:@"About Last Night" trailer:@"http://movietrailers.apple.com/movies/sony_pictures/aboutlastnight/aboutlastnight-brokeup_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"11:00 AM", @"1:40 PM", @"4:20 PM", @"7:00 PM", @"9:50 PM", nil] movieImages:@"aln.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Right Kind of Wrong" trailer:@"http://movietrailers.apple.com/movies/magnolia_pictures/therightkindofwrong/rightkindofwrong-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:15 AM", @"4:35 PM", @"7:40 PM", @"10:35 PM", nil] movieImages:@"rkw.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Muppets Most Wanted" trailer:@"http://movietrailers.apple.com/movies/disney/muppetsmostwanted/muppetsmostwanted-tlr2_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:15 AM", @"3:15 PM", @"6:30 PM" , nil] movieImages:@"mmw.jpg"],
                    [[MoListObject alloc] initWithMovie:@"The Lego Movie" trailer:@"http://movietrailers.apple.com/movies/wb/thelegomovie/thelegomovie-tlr3_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:15 AM", @"1:10 PM", @"3:55 PM", @"10:00 PM" , nil] movieImages:@"lego.jpg"],
                    [[MoListObject alloc] initWithMovie:@"The Monuments Men" trailer:@"http://movietrailers.apple.com/movies/sony_pictures/monumentsmen/themonumentsmen-unlikelyheroes_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"11:40 AM", @"3:00 PM", @"6:05 PM" , nil] movieImages:@"monmen.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Ride Along" trailer:@"http://movietrailers.apple.com/movies/universal/ridealong/ridealong-tlr2_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"1:05 PM", @"3:35 PM", @"6:25 PM", @"9:10 PM", nil] movieImages:@"ride.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Frozen" trailer:@"http://movietrailers.apple.com/movies/disney/frozen/frozen-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:30 AM", @"1:25 PM", @"4:30 PM", @"7:50 PM", @"10:00 PM", nil] movieImages:@"froz.jpg"],
                    [[MoListObject alloc] initWithMovie:@"RoboCop" trailer:@"http://movietrailers.apple.com/movies/sony_pictures/robocop/robocop-tlr2_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:05 AM", @"12:40 PM", @"3:20 PM", @"6:20 PM", @"9:00 PM", nil] movieImages:@"robo.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Vampire Academy" trailer:@"http://movietrailers.apple.com/movies/weinstein/vampireacademy/vampireacademy-tlr2_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:00 AM", @"1:50 PM", @"4:15 PM", @"6:35 PM", @"10:50 PM", nil] movieImages:@"vamp.jpg"],
                    [[MoListObject alloc] initWithMovie:@"The Nut Job" trailer:@"http://movietrailers.apple.com/movies/independent/thenutjob/thenutjob-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"11:05 AM", @"2:00 PM", @"5:00 PM", @"7:50 PM", @"10:45 PM" , nil] movieImages:@"nuts.jpg"],
                    [[MoListObject alloc] initWithMovie:@"Jack Ryan: Shadow Recruit" trailer:@"http://movietrailers.apple.com/movies/paramount/jackryanshadowrecruit/jackryanshadowrecruit-tlr1_480p.mov" showtimes:[[NSArray alloc] initWithObjects:@"10:05 AM", @"12:35 PM", @"3:05 PM", @"5:50 PM", @"8:20 PM", @"10:35 PM", nil] movieImages:@"jrsc.jpg"],
                    nil];
    

    for (int i =0; i < [MovieObjects count]; i++)
    {
        MoListObject *mdfLoad = [MovieObjects objectAtIndex:i];
        if (i < 7)
        {
            MoListObject *database = [MoListObject movieDataArray];
            if (database != nil)
            {
                //create profile info Loader
                mdf1 = database.mdf1MoviesArray;
                if (mdf1 != nil)
                {
                    [mdf1 addObject:mdfLoad];
                }
            }
        }
        else if (i > 6 & i < 12)
        {
            MoListObject *database = [MoListObject movieDataArray];
            if (database != nil)
            {
                //create profile info Loader
                mdf2 = database.mdf2MoviesArray;
                if (mdf2 != nil)
                {
                    [mdf2 addObject:mdfLoad];
                }
            }
        }
        else if (i > 11 & i <21)
        {
            MoListObject *database = [MoListObject movieDataArray];
            if (database != nil)
            {
                //create profile info Loader
                mdf3 = database.mdf3MoviesArray;
                if (mdf3 != nil)
                {
                    [mdf3 addObject:mdfLoad];
                }
            }
        
        }
    }
    [self loadTheatre];
}

-(void)loadTheatre
{
    MovieBlock = [MoListObject movieDataArray];
    
    TheaterObjects = [[NSMutableArray alloc] initWithObjects:
                      [[MovieObject alloc] initWithTheatre:@"Harkins Superstition Springs 25" image: @"Sup.jpg" location:@"6950 E. Superstition Springs Blvd. Mesa, AZ  85209" movies: MovieBlock.mdf1MoviesArray],
                      [[MovieObject alloc] initWithTheatre:@"Harkins Chandler Crossroads 12" image: @"Chan.jpg" location:@"2980 E. Germann Rd. Chandler, AZ  85286" movies:MovieBlock.mdf2MoviesArray],
                      [[MovieObject alloc] initWithTheatre:@"Harkins Arizona Mills 25" image: @"AzMills.jpg" location:@"5000 Arizona Mills Cir. Tempe, AZ  85282" movies: MovieBlock.mdf3MoviesArray],
                      nil];
    
    for (int i =0; i < [TheaterObjects count]; i++)
    {
        MovieObject *loadTheatre = [TheaterObjects objectAtIndex:i];
        MovieObject *database = [MovieObject sharedDataArray];
        if (database != nil)
        {
            //create profile info Loader
            mdfTheater = database.mdfTheater;
            if (mdfTheater != nil)
            {
                [mdfTheater addObject:loadTheatre];
            }
            
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return [TheaterName.mdfTheater count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    UIView *theatreView = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 60)];
    UIImage *himage = [UIImage imageNamed:[[TheaterName.mdfTheater objectAtIndex:section] theatreImage]];
    UILabel *thLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    thLabel.font = [UIFont boldSystemFontOfSize:25];
    thLabel.frame = CGRectMake(200, 10, 400, 30);
    thLabel.text = [NSString stringWithFormat:@"%@", [[TheaterName.mdfTheater objectAtIndex:section] theaterName]];
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectZero];
    address.text = [NSString stringWithFormat:@"%@", [[TheaterName.mdfTheater objectAtIndex:section] theaterLocale]];
    address.font = [UIFont systemFontOfSize:18];
    address.frame = CGRectMake(230, 40, 500, 25);
    UIImageView *thImgView = [[UIImageView alloc] initWithImage:himage];
    thImgView.frame = CGRectMake(30, 10, 140, 70);
    [theatreView addSubview:thImgView];
    [theatreView addSubview:thLabel];
    [theatreView addSubview:address];
    return theatreView;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    TheaterName = [MovieObject sharedDataArray];
    termArray = [[TheaterName.mdfTheater objectAtIndex:section] movieBlock];
    switch (section) {
        case 0: return [termArray count]; break;
        case 1: return [termArray count]; break;
        case 2: return [termArray count]; break;
        default: break;
    }
    return 0;
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    termArray = [[TheaterName.mdfTheater objectAtIndex:indexPath.section] movieBlock];
    MoTiCell *cell = [tabled dequeueReusableCellWithIdentifier:@"movieTimes"];
    if (cell != nil)
    {
        NSArray *timely = [[termArray objectAtIndex:indexPath.row] movieTimes];
        NSString *postImg = [NSString stringWithFormat:@"%@", [[termArray objectAtIndex:indexPath.row] posters]];
        UIImage *thImage = [UIImage imageNamed:postImg];
        cell.tText = [[termArray objectAtIndex:indexPath.row] movieName];
        cell.time1 = [timely objectAtIndex:0];
        cell.time2 = [timely objectAtIndex:1];
        cell.time3 = [timely objectAtIndex:2];
        cell.thImage = thImage;
        [cell loadCell];
        
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    termArray = [[TheaterName.mdfTheater objectAtIndex:indexPath.section] movieBlock];
    currentMovie = [termArray objectAtIndex:indexPath.row];
    currentMovieImage = [TheaterName.mdfTheater objectAtIndex:indexPath.section];
    
    [self performSegueWithIdentifier: @"detail" sender: self];
    
}

//pass object for selected cell
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        DetailView *destination = segue.destinationViewController;
        destination.insertObject = currentMovie;
        destination.insertObject2 = currentMovieImage;
    }
}



@end
