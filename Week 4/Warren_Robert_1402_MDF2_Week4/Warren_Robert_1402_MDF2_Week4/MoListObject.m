//
//  MoListObject.m
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/12/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "MoListObject.h"


@implementation MoListObject
@synthesize mdf1MoviesArray, mdf2MoviesArray, mdf3MoviesArray, movieName, movieURL, movieTimes, posters;

-(id)initWithMovie:(NSString*)name trailer:(NSString *)trailer showtimes:(NSArray*)showtimes movieImages:(NSString*)movieImages
{
    if ((self = [super init]))
    {
        movieName = name;
        movieURL = trailer;
        movieTimes = showtimes;
        posters = movieImages;
    }
    return self;
}

//database builder
static MoListObject * _movieDataArray = nil;
+(MoListObject*) movieDataArray
{
    if (!_movieDataArray)
    {
        _movieDataArray = [[self alloc] init];
    }
    return _movieDataArray;
}

//database
-(id)init
{
    if ((self = [super init]))
    {
        mdf1MoviesArray = [[NSMutableArray alloc] init];
        mdf2MoviesArray = [[NSMutableArray alloc] init];
        mdf3MoviesArray = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
