//
//  PersonController.m
//  SixWeekChallenge
//
//  Created by Scott on 8/12/15.
//  Copyright (c) 2015 Devmountain. All rights reserved.
//

#import "PersonController.h"
#import "Stack.h"

@implementation PersonController

+ (PersonController *)sharedInstance {
    static PersonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PersonController new];
    });
    return sharedInstance;
}


- (Person *)createPersonWithTitle:(NSString *)name  {
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    Person. = name;
    
    [self saveToPersistentStorage];
    
    return person;
}

@end
