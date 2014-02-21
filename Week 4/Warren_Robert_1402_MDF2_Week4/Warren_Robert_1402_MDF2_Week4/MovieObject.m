//
//  MovieObject.m
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/11/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "MovieObject.h"


@implementation MovieObject
@synthesize mdfTheater, theaterName, theatreImage, theaterLocale, movieBlock;

-(id)initWithTheatre:(NSString*)theatre image:(NSString *)image location:(NSString*)location movies:(NSMutableArray*)movies
{
    if ((self = [super init]))
    {
        theaterName = theatre;
        theatreImage = image;
        theaterLocale = location;
        movieBlock = movies;
        
    }
    return self;
}

//database builder
static MovieObject* _sharedDataArray = nil;
+(MovieObject*)sharedDataArray
{
    if (!_sharedDataArray)
    {
        _sharedDataArray = [[self alloc] init];
    }
    return _sharedDataArray;
}

//database
-(id)init
{
    if ((self = [super init]))
    {
        mdfTheater = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
