//
//  PersonController.h
//  SixWeekChallenge
//
//  Created by Scott on 8/12/15.
//  Copyright (c) 2015 Devmountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonController : NSObject

@property (strong, nonatomic, readonly) NSArray *people;

+ (PersonController *)sharedInstance;


@end
