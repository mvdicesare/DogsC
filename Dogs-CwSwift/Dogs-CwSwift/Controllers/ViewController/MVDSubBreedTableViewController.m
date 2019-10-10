//
//  MVDSubBreedTableViewController.m
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDSubBreedTableViewController.h"
#import "MVDBreed.h"
#import "MVDSubBreed.h"
#import "MVDImagesCollectionViewController.h"

@interface MVDSubBreedTableViewController ()

@end

@implementation MVDSubBreedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.breed.name capitalizedString];
    
}

// landing pad set value
- (void)setBreed:(MVDBreed *)breed
{
    if(breed != _breed)
    {
        _breed = breed;
        [self.tableView reloadData];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.breed.subBreed count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scbBreedCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.breed.subBreed[indexPath.row] name] capitalizedString];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"fromSubBreedsToImages" sender:self];
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MVDSubBreed *subBreed = self.breed.subBreed[[[[self tableView] indexPathForSelectedRow] row]];
    if ([segue.identifier isEqualToString:@"fromSubBreedsToImages"])
    {
        MVDImagesCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.subBreed = subBreed;
        destinationVC.breed = self.breed;
    }
}
@end
