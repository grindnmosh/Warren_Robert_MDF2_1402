//
//  ArrayObject.h
//  Warren_Robert_MDF2_1402_Week2
//
//  Created by Robert Warren on 2/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayObject : NSObject
{
    NSMutableArray *profileInfo;
    NSString *uniName;
    UIImage *uniImage;
}


@property(nonatomic)NSString *uniName;

@property(nonatomic)UIImage *uniImage;


+(ArrayObject *)sharedDataManager;

//singleton array
@property (nonatomic, strong) NSMutableArray *profileInfo;

@end
