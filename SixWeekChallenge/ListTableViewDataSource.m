//
//  ListTableViewDataSource.m
//  SixWeekChallenge
//
//  Created by Scott on 8/12/15.
//  Copyright (c) 2015 Devmountain. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import "PersonController.h"

@implementation ListTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Person *person = [PersonController sharedInstance].people[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personCell"];
    cell.textLabel.text = person.name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PersonController sharedInstance].people.count;
}

@end
