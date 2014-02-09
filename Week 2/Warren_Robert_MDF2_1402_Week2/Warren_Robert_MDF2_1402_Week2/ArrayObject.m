//
//  ArrayObject.m
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ArrayObject.h"

@implementation ArrayObject
//singleton vars
@synthesize uniName, uniImage, profileInfo;

//singleton static method
//static singleton method
static ArrayObject* _sharedDataManager = nil;
+(ArrayObject*)sharedDataManager
{
    if (!_sharedDataManager)
    {
        _sharedDataManager = [[self alloc] init];
    }
    return _sharedDataManager;
}

//init to allow adding dynamically unused
-(id)init
{
    if ((self = [super init]))
    {
        profileInfo = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
