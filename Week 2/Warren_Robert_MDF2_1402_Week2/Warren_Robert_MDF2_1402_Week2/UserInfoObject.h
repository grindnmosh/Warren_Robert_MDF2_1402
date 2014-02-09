//
//  UserInfoObject.h
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoObject : NSObject
{
    //vars to call data with
    NSString *userInfo;
    UIImage *profileImage;
}

-(id)initWithName:(NSString*)name image:(UIImage *)image;


//property to call business name with
@property(nonatomic, strong)NSString *userInfo;

//property to call business location with
@property(nonatomic, strong)UIImage *profileImage;


@end
