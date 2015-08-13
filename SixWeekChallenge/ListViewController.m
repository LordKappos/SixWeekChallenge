//
//  ViewController.m
//  SixWeekChallenge
//
//  Created by Scott on 8/12/15.
//  Copyright (c) 2015 Devmountain. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "PersonController.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Link table view to data source
    
    // add method to save button for saving down to coredata
    // add method to randomize button that will arc4random an nsmutable array
    // add method to add person button that will add entries to table view and an NSmutable array
    
    // add two entries to a cell or add a numeric identifier to each cell to make pairs by number with a dictionary or something
    
    // have entry button add entries to table view and an NSmutable array
    
    // have randomize button arc4random the array and reload table
    
    // have save button save view to coredata
    
    // make cells text editable 

}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewPerson"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailViewController *viewController = segue.destinationViewController;
        
        Person *person = [PersonController sharedInstance].people[indexPath.row];
        viewController.person = person;
        
    }
}
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
