//
//  MoListObject.h
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/12/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoListObject : NSObject
{
    NSMutableArray *mdfMoviesArray;
    
    NSString *movieName;
    NSString *movieURL;
    NSArray *movieTimes;
    NSString *posters;
}

-(id)initWithMovie:(NSString*)name trailer:(NSString *)trailer showtimes:(NSArray*)showtimes movieImages:(NSString*)movieImages;

//database builder static
+(MoListObject*) movieDataArray;

@property(nonatomic, strong) NSString *movieName;

@property(nonatomic, strong) NSString *movieURL;

@property(nonatomic, strong) NSArray *movieTimes;

@property(nonatomic, strong) NSString *posters;

@property (nonatomic, strong) NSMutableArray *mdf1MoviesArray;
@property (nonatomic, strong) NSMutableArray *mdf2MoviesArray;
@property (nonatomic, strong) NSMutableArray *mdf3MoviesArray;


@end
