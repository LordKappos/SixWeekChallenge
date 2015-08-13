//
//  PersonController.m
//  SixWeekChallenge
//
//  Created by Scott on 8/12/15.
//  Copyright (c) 2015 Devmountain. All rights reserved.
//

#import "PersonController.h"
#import "Stack.h"

static NSString * const allPeopleKey = @"allPeople";

@interface PersonController ()
@property (strong, nonatomic) NSArray *people;

@end

@implementation PersonController

+ (PersonController *)sharedInstance {
    static PersonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PersonController new];
    });
    return sharedInstance;
}


- (Person *)createPersonWithName:(NSString *)name  {
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    person.name = name;
    
    [self saveToPersistentStorage];
    
    return person;
}

- (NSArray *)people {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

- (void)save {
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

- (void)removePerson:(Person *)person {
    [[Stack sharedInstance].managedObjectContext deleteObject:person];
}

@end
