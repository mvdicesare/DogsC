//
//  SubBreedsListTableViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRASubBreedsListTableViewController.h"
#import "CRABreed.h"
#import "CRASubBreed.h"
#import "CRAImagesCollectionViewController.h"

@interface CRASubBreedsListTableViewController ()

@end

@implementation CRASubBreedsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.breed.name capitalizedString];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.breed.subBreeds count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subBreedCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.breed.subBreeds[indexPath.row] name] capitalizedString];
    return cell;
}

//Landing pad setValue
//run this when the breed property is set
- (void)setBreed:(CRABreed *)breed
{
    if(breed != _breed){
        _breed = breed;
        [self.tableView reloadData];
    }
}

//when a row is selected, the view will perform a the specified segue
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"fromSubBreedsToImages" sender:self];
}

//when a segue is about to happen this code will run
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CRASubBreed * subBreed = self.breed.subBreeds[[[[self tableView] indexPathForSelectedRow] row]];
    if([segue.identifier  isEqualToString: @"fromSubBreedsToImages"])
    {
        //send breed and subBreed to landing pads on collection view
        CRAImagesCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.subBreed = subBreed;
        destinationVC.breed = self.breed;
        
    }
}
@end
