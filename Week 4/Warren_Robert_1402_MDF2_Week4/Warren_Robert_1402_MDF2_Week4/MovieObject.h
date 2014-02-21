//
//  MovieObject.h
//  Warren_Robert_1402_MDF2_Week4
//
//  Created by Robert Warren on 2/11/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoListObject.h"

@interface MovieObject : NSObject
{
    NSMutableArray *mdfTheater;
    
    NSString *theaterName;
    NSString *theatreImage;
    NSString *theaterLocale;
    NSMutableArray *movieBlock;
    
}

-(id)initWithTheatre:(NSString*)theatre image:(NSString *)image location:(NSString*)location movies:(NSMutableArray*)movies;

@property(nonatomic, strong) NSString *theaterName;

@property(nonatomic, strong) NSString *theatreImage;

@property(nonatomic, strong)  NSString *theaterLocale;

@property(nonatomic, strong)  NSMutableArray *movieBlock;

//database builder static
+(MovieObject*)sharedDataArray;

@property (nonatomic, strong) NSMutableArray *mdfTheater;


@end
