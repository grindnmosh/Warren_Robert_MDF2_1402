//
//  UserInfoObject.m
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "UserInfoObject.h"

@implementation UserInfoObject
@synthesize userInfo, profileImage;

//location variables to call data with
-(id)initWithName:(NSString*)name image:(UIImage *)image
{
    if ((self = [super init]))
    {
        userInfo = name;
        profileImage = image;
    }
    return self;
}


@end
